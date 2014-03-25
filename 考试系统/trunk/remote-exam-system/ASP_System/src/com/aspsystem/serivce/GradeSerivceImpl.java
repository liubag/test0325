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
	
	//通过考试成绩id查找成绩对象
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
	//获取班级排名
	public Integer  getRank_in_class(Grade grade,String permission_id){
		if(permission_id!=null){
			this.session=getSession();
			hql="select count(*) from Grade as g where g.stu.myclass.class_id='"+grade.getStu().getMyclass().getClass_id()+"' and g.exam.exam_id='"+grade.getExam().getExam_id()+"' and g.grade>'"+grade.getGrade()+"'";
			return gradeDao.findCount_all(session, hql).intValue()+1;
		}else
			return null;
	}
	//@SuppressWarnings("unchecked")
	//获取年级排名
	public Integer getRank_in_grade(Grade grade,String permission_id){
		if(permission_id!=null){
			this.session=getSession();
			hql ="select count(*) from Grade as g where g.exam.exam_id='"+grade.getExam().getExam_id()+"' and g.grade>'"+grade.getGrade()+"'";
			return gradeDao.findCount_all(session, hql).intValue()+1;
		}else
			return null;
	}
	//保存一个成绩对象到数据库中
	public boolean save(Grade grade,String permission_id) {
		if(permission_id!=null){
			this.session=getSession();
			gradeDao.save(grade, session);
			return true;
		}
			return false;
	}

	//通过考试对象和学生对象查找分数并且返回
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
	 * 获取当前登录学生的考试成绩页数
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
	 * 获取当前学生考试成绩信息的数量
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
	 * 分页显示学生考试成绩信息
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

	//查询某班在某次考试的成绩
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
  * 通过exam_id查找一次考试的全部成绩
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
 * 获取一个班级在一次考试中的平均分
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
