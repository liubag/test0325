package com.aspsystem.serivce;

import java.util.List;

import javax.annotation.Resource;

import com.aspsystem.dao.QuestionsDao;
import com.aspsystem.entity.Course;
import com.aspsystem.entity.Questions;
import com.aspsystem.entity.Teacher;
import com.aspsystem.util.MySerivceParent;
import com.aspsystem.util.RandomUtil;
import com.aspsystem.util.StringUtil;

public class QuestionsSerivceImpl extends MySerivceParent implements
	QuestionsSerivce {
	@Resource
	private QuestionsDao questionsDao;
	private String hql;
	public boolean dele(String ques_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			questionsDao.dele(find(ques_id,permission_id), session);
			return true;
		}else
			return false;
		
	}
	
	public Questions find(String ques_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Questions as q where q.ques_id='"+ques_id+"'";
			return (Questions)questionsDao.find(hql, session);
		}else			
			return null;
	}

	public boolean save(Questions question, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			questionsDao.save(question, session);
			return true;
		}else
			return false;
	}


	public boolean save(Questions question, String techer_id, String course_id,
			String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			Questions q=new Questions("Q001");
			hql="from Teacher as t where t.teacher_id='"+techer_id+"'";
			Teacher t=(Teacher)questionsDao.find(hql, session);
			
			hql="from Course as c where c.course_id='"+course_id+"'";
			Course c=(Course)questionsDao.find(hql, session);
			q.setTopic(question.getTopic());
			q.setType(question.getType());
			q.setOptions(question.getOptions());
			q.setAnswer(question.getAnswer());
			q.setAnalysis(question.getAnalysis());
			q.setCourse(c);
			q.setTeacher(t);
			questionsDao.save(q, session);
			return true;
		}else
			return false;
	}

	public boolean update(Questions question, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Questions as q where q.ques_id='"+question.getQues_id()+"'";
			Questions q=(Questions)questionsDao.find(hql, session);
			if(q!=null){
				q.setTopic(question.getTopic());
				q.setType(question.getType());
				q.setAnalysis(question.getAnalysis());
				q.setAnswer(question.getAnswer());
				q.setOptions(question.getOptions());

				questionsDao.update(q, session);
				return true;
			}else
				return false;
			
		}else
			return false;
	}

	public boolean deleBatch(String idArray, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			List<String> idList=StringUtil.getOption(idArray, ",");
			for(String id:idList){				
				questionsDao.dele(find(id,permission_id), session);			
			}
			return true;
		}else
			return false;
	}
/*
 * 随机获取一定数量题（包含有单选，多选，不定选），
 * 例如随机获取10道单选题，先经过随机的排序后，再获取此科目单选题的个数count，
 * 如果（count-10）>0,就获取从0到（count-10）的随机数，然后hibernate的分页技术获取10道题。)
 */
	public List<Questions> randomAccessQus(int number, int type,
			String course_id,String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			List<Questions> q;
			this.session=getSession();
			List<String> l=RandomUtil.randomOrderBy();
			hql="select count(*) from Questions as q where q.course.course_id='"+course_id+"' and q.type='"+type+"'";
			int count=questionsDao.findCount_all(session, hql).intValue();
			int i=RandomUtil.randomOne(count, number);
			hql="from Questions as q where q.course.course_id='"+course_id+"' and q.type='"+type+"' order by "+l.get(0)+","+l.get(1)+","+l.get(2);
			q=(List<Questions>)questionsDao.showQuestions_by_random(i, number, session, hql);
			return q;
		}else
			return null;
	}

	
}
