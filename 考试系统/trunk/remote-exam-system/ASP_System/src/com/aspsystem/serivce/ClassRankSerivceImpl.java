package com.aspsystem.serivce;

import java.util.List;

import javax.annotation.Resource;

import com.aspsystem.dao.ClassRankDao;
import com.aspsystem.entity.ClassRank;
import com.aspsystem.entity.Exam;
import com.aspsystem.entity.MyClass;
import com.aspsystem.entity.Student;
import com.aspsystem.util.MySerivceParent;
import com.aspsystem.util.StringUtil;

public class ClassRankSerivceImpl extends MySerivceParent implements
	ClassRankSerivce {
	@Resource
	private ClassRankDao classRankDao;
	@Resource
	private ExamSerivce examSerivce;
	@Resource
	private GradeSerivce gradeSerivce;
	@Resource
	private MyClassSerivce myClassSerivce;
	@Resource
	private StudentSerivce studentSerivce;
	private String hql;
	
	public boolean dele(Integer class_rank_id, String permission_id) {
		// TODO Auto-generated method stub
		return false;
		
	}

	public ClassRank find(Integer class_rank_id, String permission_id) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean save(ClassRank classRank, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			session =this.getSession();
			classRankDao.save(classRank, session);
			return true;
		}else 
			return false;
	}

	public boolean update(ClassRank classRank, String permission_id) {
		// TODO Auto-generated method stub
		return false;
	}
	//查找参加这次考试的班级排名
	public List<?> find(String exam_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from ClassRank as cr where cr.exam.exam_id='"+exam_id+"' order by cr.rank" ;
			return classRankDao.findAll(hql, session);
		}else 
			return null;
		
	}

	
	/**
	 * 通过考试id和班级id来查找班级之间排名的记录
	 */
	public ClassRank find(String exam_id, String class_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=this.getSession();
			hql="from ClassRank as cr where cr.exam.exam_id='"+exam_id+"' and cr.myclass.class_id='"+class_id+"'";
			return (ClassRank)classRankDao.find(hql, session);
		}
		return null;
	}

	/**
	 * 对一次考试中的成绩进行班级之间的排名
	 * 
	 */
	@SuppressWarnings("unchecked")
	public boolean rankExam(String exam_id, String permission_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		if(permission_id!=null){
			if(gradeSerivce.findByExam(exam_id, permission_id)!=null){
				List<String> class_id_l=StringUtil.getOption(examSerivce.find(exam_id, permission_id).getClass_id(), ",");
				for(String class_id:class_id_l){
					Exam exam =examSerivce.find(exam_id, permission_id);
					MyClass myclass =myClassSerivce.find(Integer.parseInt(class_id), permission_id);
					float aveGrade = gradeSerivce.getClassAvgGrade(exam_id, Integer.parseInt(class_id), permission_id);
					int stu_num=((List<Student>)studentSerivce.findByClass_Id(class_id, permission_id)).size();
					ClassRank classRank =new ClassRank();
					classRank.setAvg_score(aveGrade);
					classRank.setExam(exam);
					classRank.setStu_num(stu_num);
					classRank.setMyclass(myclass);
					classRankDao.save(classRank, session);
				}
				hql="from ClassRank as cr where cr.exam.exam_id='"+exam_id+"'";
				List<ClassRank> classRank_l =(List<ClassRank>)classRankDao.findAll(hql, session);
				for(ClassRank cr:classRank_l){
					hql="select count(*) from ClassRank as cr where cr.exam.exam_id='"+exam_id+"' and cr.avg_score>'"+cr.getAvg_score()+"'";
					int rank =classRankDao.findCount_all(session, hql).intValue()+1;
					cr.setRank(rank);
					classRankDao.save(cr, session);
				}
				flag=true;
			}
		}
		return flag;
	}
}
