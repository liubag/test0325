package com.aspsystem.serivce;

import java.util.List;

import javax.annotation.Resource;

import com.aspsystem.dao.CourseDao;
import com.aspsystem.entity.Course;
import com.aspsystem.util.MySerivceParent;
import com.aspsystem.util.StringUtil;
@SuppressWarnings("unchecked")
public class CourseSerivceImpl extends MySerivceParent implements
	CourseSerivce {
	@Resource
	private CourseDao courseDao;
	private String hql;
	public boolean dele(Integer course_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
				this.session=getSession();
				courseDao.dele(find(course_id,permission_id),this.session);
		}
		return true;
		
	}

	public Course find(Integer course_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.hql="from Course as c where c.course_id ='"+course_id+"'";		
			this.session=getSession();
			return (Course)courseDao.find(hql, session);
		}

		return null;
	}

	public boolean save(Course course, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			if(find(course.getCourse_name(),permission_id)==null){
				courseDao.save(course, session);
				return true;
			}	
		}
		return false;
	}

	public boolean update(Course course, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Course as c where c.course_id='"+course.getCourse_id()+"'";
			Course c=(Course)courseDao.find(hql, session);
			if(c!=null){
				c.setCourse_name(course.getCourse_name());
				courseDao.save(c, session);
				return true;
			}else
				return false;
		}
			return false;
	}

	public Course find(String course_name, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			try{
				course_name = new String(course_name.getBytes("ISO8859_1"), "UTF8");
				}catch(Exception e){
					e.printStackTrace();
				}
			hql="from Course as c where c.course_name ='"+course_name+"'";
			this.session=getSession();
			return (Course)courseDao.find(hql, session);
		}
		return null;
		
	}

	public boolean findCourse(Integer course_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			hql="select count(*) from Questions as q ,Course as c where q.course.course_id=c.course_id and  c.course_id='"+course_id+"'";
			this.session=getSession();
			if(myDaoParent.findCount_all(session, hql)!=0)
				return true;
			else 
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
				Integer course_id=Integer.parseInt(id);
				courseDao.dele(find(course_id,permission_id), session);			
			}
			return true;
		}else
			return false;
	}

	public List<Course> find(String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from Course";
			return (List<Course>)courseDao.findAll(hql, session);
		}else
			return null;
	}


	
}
