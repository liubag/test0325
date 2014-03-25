package com.aspsystem.serivce;

import java.util.List;

import javax.annotation.Resource;

import com.aspsystem.dao.MyClassDao;
import com.aspsystem.entity.MyClass;
import com.aspsystem.util.MySerivceParent;
import com.aspsystem.util.StringUtil;
@SuppressWarnings("unchecked")
public class MyClassSerivceImpl extends MySerivceParent implements
		MyClassSerivce {
	@Resource
	private MyClassDao myClassDao;
	private String hql;
	public boolean dele(Integer class_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			myClassDao.dele(find(class_id,permission_id), session);
			return true;
		}else
			return false;
	}

	public boolean deleBatch(String idArray, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			List<String> idList=StringUtil.getOption(idArray, ",");
			for(String id:idList){
				Integer class_id=Integer.parseInt(id);
				myClassDao.dele(find(class_id,permission_id), session);			
			}
			return true;
		}else
			return false;
	}

	public MyClass find(Integer class_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from MyClass as mc where mc.class_id='"+class_id+"'";
			return (MyClass)myClassDao.find(hql, session);
		}else 
			return null;
		
	}

	public boolean save(MyClass myClass, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			myClassDao.save(myClass, session);
			return true;
		}
			return false;
	}

	public boolean update(MyClass myClass, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from MyClass as mc where mc.class_id='"+myClass.getClass_id()+"'";
			MyClass mc=(MyClass)myClassDao.find(hql, session);
			if(mc!=null){
				mc.setClass_name(myClass.getClass_name());
				myClassDao.save(mc, session);
				return true;
			}else
				return false;
		}
			return false;
		
	}

	public List<MyClass> find(String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from MyClass";
			return (List<MyClass>)myClassDao.findAll(hql, session);
		}else			
			return null;
	}

	public boolean findMyClass(Integer class_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			hql="select count(*) from MyClass as c ,Student as s where s.myclass.class_id=c.class_id and  c.class_id='"+class_id+"'";
			this.session=getSession();
			if(myDaoParent.findCount_all(session, hql)!=0)
				return true;
			else 
				return false;
		}else
			return false;
	}

	public MyClass find(String class_name, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			try{
				class_name = new String(class_name.getBytes("ISO8859_1"), "UTF8");
				}catch(Exception e){
					e.printStackTrace();
				}
			hql="from MyClass as c where c.class_name ='"+class_name+"'";
			this.session=getSession();
			return (MyClass)myClassDao.find(hql, session);
		}
		return null;
	}

	
}
