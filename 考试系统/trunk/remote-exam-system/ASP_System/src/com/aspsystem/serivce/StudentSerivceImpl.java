package com.aspsystem.serivce;

import java.util.List;

import javax.annotation.Resource;

import com.aspsystem.dao.StudentDao;
import com.aspsystem.entity.MyClass;
import com.aspsystem.entity.Student;
import com.aspsystem.util.MySerivceParent;
import com.aspsystem.util.StringUtil;

public class StudentSerivceImpl extends MySerivceParent implements
	StudentSerivce {
	@Resource
	private StudentDao studentDao;
	private String hql;
	public boolean dele(String stu_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Student as s where s.stu_id='"+stu_id+"'";
			Student s=(Student)studentDao.find(hql, session);
			if(s!=null){
				s.setStatus(0);
				studentDao.update(s, session);
				return true;
			}else
				return false;
		}else{
			return false;
			
		}
	}	

	public Student find(String stu_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Student as s where s.stu_id='"+stu_id+"'";
			return (Student)studentDao.find(hql, session);
		}else
			return null;
	}

	public boolean save(Student student, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			studentDao.save(student, session);
			return true;
		}else
			return false;
	}

	public boolean update(Student student, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			studentDao.update(student, session);
			return true;
		}else
			return false;
	}

	public String login(String account, String pw) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Student as s where s.stu_id='"+account+"' and s.pw='"+pw+"'";
		Student s=(Student)studentDao.find(hql, session);
		if(s!=null){
			return "student_login_success,"+s.getStu_id();
		}
		return null;
	}
/**
 * 修改学生登录密码
 */
	public boolean changePassword(Student student, String newpw,String permission_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		if(permission_id!=null){
			this.session=getSession();
			hql="from Student as s where s.stu_id='"+student.getStu_id()+"' and s.pw='"+student.getPw()+"'";
			Student s=(Student) studentDao.find(hql, session);
			if(s!=null){
				s.setPw(newpw);
				studentDao.save(s, session);
				flag=true;
			}
		}
		return flag;
	}

public boolean save(Student student,String class_id,String permission_id) {
	// TODO Auto-generated method stub
	if(permission_id!=null){
		this.session=getSession();
		hql="from MyClass as c where c.class_id='"+class_id+"'";
		MyClass c=(MyClass)studentDao.find(hql, session);		
		student.setMyclass(c);
		studentDao.save(student, session);
		return true;
	}else
		return false;
}

public boolean deleBatch(String idArray, String permission_id) {
	// TODO Auto-generated method stub
	if(permission_id!=null){
		this.session=getSession();
		List<String> idList=StringUtil.getOption(idArray, ",");
		for(String stu_id:idList){
			hql="from Student as s where s.stu_id='"+stu_id+"'";
			Student s=(Student)studentDao.find(hql, session);			
			s.setStatus(0);
			studentDao.update(s, session);								
		}
		return true;
	}else
		return false;
}
/**
 * 通过class_id查找这个班级的学生
 */
@SuppressWarnings("unchecked")
public List<Student> findByClass_Id(String class_id, String permission_id) {
	// TODO Auto-generated method stub
	if(permission_id!=null){
		this.session=this.getSession();
		hql="from Student as s where s.myclass.class_id='"+class_id+"'";
		List<Student> stu_l=(List<Student>)studentDao.findAll(hql, session);
		return stu_l;
	}
	return null;
}
	

	
}
