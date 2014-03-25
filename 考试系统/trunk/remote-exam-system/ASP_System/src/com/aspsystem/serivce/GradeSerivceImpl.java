package com.aspsystem.serivce;

import java.util.List;

import javax.annotation.Resource;

import com.aspsystem.dao.GradeDao;
import com.aspsystem.entity.Exam;
import com.aspsystem.entity.Grade;
import com.aspsystem.entity.Student;
import com.aspsystem.util.MySerivceParent;
import com.aspsystem.util.StringUtil;

public class GradeSerivceImpl extends MySerivceParent implements
	GradeSerivce {
	@Resource
	private GradeDao gradeDao;
	private String hql;
	
	//ͨ�����Գɼ�id���ҳɼ�����
	public Grade find(String grade_id,String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Grade as g where g.grade_id='"+grade_id+"'";
			return (Grade)gradeDao.find(hql, session);
		}else
			return null;
	}


	
	//@SuppressWarnings("unchecked")
	//��ȡ�༶����
	public Integer  getRank_in_class(Grade grade,String permission_id){
		if(permission_id!=null){
			this.session=getSession();
			hql="select count(*) from Grade as g where g.stu.myclass.class_id='"+grade.getStu().getMyclass().getClass_id()+"' and g.exam.exam_id='"+grade.getExam().getExam_id()+"' and g.grade>'"+grade.getGrade()+"'";
			return gradeDao.findCount_all(session, hql).intValue()+1;
		}else
			return null;
	}
	//@SuppressWarnings("unchecked")
	//��ȡ�꼶����
	public Integer getRank_in_grade(Grade grade,String permission_id){
		if(permission_id!=null){
			this.session=getSession();
			hql ="select count(*) from Grade as g where g.exam.exam_id='"+grade.getExam().getExam_id()+"' and g.grade>'"+grade.getGrade()+"'";
			return gradeDao.findCount_all(session, hql).intValue()+1;
		}else
			return null;
	}
	//����һ���ɼ��������ݿ���
	public boolean save(Grade grade,String permission_id) {
		if(permission_id!=null){
			this.session=getSession();
			gradeDao.save(grade, session);
			return true;
		}
			return false;
	}

	//ͨ�����Զ����ѧ��������ҷ������ҷ���
	public Grade find(Exam exam, Student student, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Grade as g where g.exam.exam_id='"+exam.getExam_id()+"' and g.stu.stu_id='"+student.getStu_id()+"'";
			
			return (Grade)gradeDao.find(hql, session);
		}else
			return null;
	}


	/**
	 * ��ȡ��ǰ��¼ѧ���Ŀ��Գɼ�ҳ��
	 */
	public int findPages(int perFolioAmount, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			int pagenum;
			String stu_id=StringUtil.cutOutId(permission_id);
			this.session=getSession();
			hql="select count(*) from Grade as g where g.stu.stu_id='"+stu_id+"'";
			Long num1 = gradeDao.findCount_all(session, hql);
			int num = num1.intValue();
			pagenum = num/perFolioAmount;
			num = num%perFolioAmount;
			if(num>0){
				pagenum++;
			}
			return pagenum;
		}
		return 0 ;
	}


	/**
	 * ��ȡ��ǰѧ�����Գɼ���Ϣ������
	 */
	public Long hasNumbers(String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			
			String stu_id=StringUtil.cutOutId(permission_id);
			this.session=getSession();
			hql="select count(*) from Grade as g where g.stu.stu_id='"+stu_id+"'";
		    gradeDao.findCount_all(session, hql);
			return gradeDao.findCount_all(session, hql);
		}
		return 0l;
	}
	/**
	 * ��ҳ��ʾѧ�����Գɼ���Ϣ
	 */
	@SuppressWarnings("unchecked")
	public List<Grade> show_by_page(int page,int perFolioAmount,String permission_id){
		if(permission_id!=null){
			String stu_id=StringUtil.cutOutId(permission_id);
			this.session=getSession();
			hql="from Grade as g where g.stu.stu_id='"+stu_id+"'";
			return (List<Grade>)gradeDao.show_by_page_all(page, perFolioAmount, session, hql);
		}
		return null;
	}

	//��ѯĳ����ĳ�ο��Եĳɼ�
	public List<?> find(String exam_id, String class_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Grade as g where g.exam.exam_id='"+exam_id+"' and  g.stu.myclass.class_id='"+class_id+"' and g.stu.status='1' order by g.grade desc";	
		
			return gradeDao.findAll(hql, session);
		}else
			return null;
	}


 /**
  * ͨ��exam_id����һ�ο��Ե�ȫ���ɼ�
  */
	@SuppressWarnings("unchecked")
	public List<Grade> findByExam(String exam_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Grade as g where g.exam.exam_id='"+exam_id+"'";
			return (List<Grade>)gradeDao.findAll(hql, session);
		}
		return null;
	}


/**
 * ��ȡһ���༶��һ�ο����е�ƽ����
 */
public float getClassAvgGrade(String exam_id, Integer class_id,
		String permission_id) {
	// TODO Auto-generated method stub
	if(permission_id!=null){
		this.session=getSession();
		hql="select avg(g.grade) from Grade as g where g.exam.exam_id='"+exam_id+"' and g.stu.myclass.class_id='"+class_id+"'";
		return gradeDao.getTheAvgGrade(session, hql);
	}
	return 0;
}		
}
