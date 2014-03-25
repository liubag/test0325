package com.aspsystem.serivce;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.aspsystem.dao.TeacherDao;
import com.aspsystem.entity.Teacher;
import com.aspsystem.util.MySerivceParent;
@SuppressWarnings("unchecked")
public class TeacherSerivceImpl extends MySerivceParent implements
	TeacherSerivce {
	@Resource
	private TeacherDao teacherDao;
	private String hql;
	
	/**
	 * 通过教师工号删除教师对象
	 */
	public boolean dele(String teacher_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			teacherDao.dele(find(teacher_id,permission_id), session);
			return true;
		}else
			return false;
	}
	/**
	 * 通过教师工号查询教师对象
	 */
	public Teacher find(String teacher_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Teacher as t where t.teacher_id='"+teacher_id+"'";
			return (Teacher)teacherDao.find(hql, session);
		}else
			return null;
	}
	/**
	 * 保存教师信息
	 */
	public boolean save(Teacher teacher, Date today, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			teacherDao.save(teacher, session);
			return true;
		}else
			return false;
	}
	
	/**
	 * 更新教师信息
	 */
	public boolean update(Teacher teacher, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			teacherDao.update(teacher, session);
			return true;
		}else
			return false;
	}

	/**
	 * 教师登录
	 */
	public String login(String account, String pw) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Teacher as t where t.teacher_id='"+account+"' and t.pw='"+pw+"'";
		Teacher t=(Teacher)teacherDao.find(hql, session);
		if(t!=null){
			return "teacher_login_success,"+t.getTeacher_id();
		}
		return null;
	}
		/**
		 * 修改教师登录密码
		 */
	public boolean changePassword(Teacher teacher, String newpw,String permission_id) {
		// TODO Auto-generated method stub
		boolean flag=false;
		if(permission_id!=null){
			this.session=getSession();
			this.hql="from Teacher as t where t.teacher_id='"+teacher.getTeacher_id()+"' and t.pw='"+teacher.getPw()+"'";
			Teacher t=(Teacher) teacherDao.find(hql, session);
			if(t!=null)
				t.setPw(newpw);
				teacherDao.save(t, session);
				flag=true;
			}
			return flag;
		}
		public List<Teacher> find(String permission_id) {
			// TODO Auto-generated method stub
			if(permission_id!=null){
				this.session=getSession();
				hql="from Teacher";
				return (List<Teacher>)teacherDao.findAll(hql, session);
			}else
				return null;
		}
	
	
}
