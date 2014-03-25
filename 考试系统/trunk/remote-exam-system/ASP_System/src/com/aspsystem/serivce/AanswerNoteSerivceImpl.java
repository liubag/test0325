package com.aspsystem.serivce;

import javax.annotation.Resource;

import com.aspsystem.dao.AanswerNoteDao;
import com.aspsystem.entity.AanswerNote;
import com.aspsystem.util.MySerivceParent;

public class AanswerNoteSerivceImpl extends MySerivceParent implements
	AanswerNoteSerivce {
	@Resource
	private AanswerNoteDao aanswerNoteDao;
	private String hql;
	public AanswerNote find(String note_id,String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from AanswerNote as an where an.note_id='"+note_id+"'";
			return (AanswerNote)aanswerNoteDao.find(hql, session);
		}else
			return null;
	}

	public boolean save(AanswerNote aanswerNote,String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			aanswerNoteDao.save(aanswerNote, session);
			return true;
		}else
			return false;
		
	}

	public AanswerNote find(String exam_id, String stu_id, String permission_id) {
		// TODO Auto-generated method stub
		if(permission_id!=null){
			this.session=getSession();
			hql="from AanswerNote as an where an.exam_id='"+exam_id+"' and an.stu_id='"+stu_id+"'";
			return (AanswerNote)aanswerNoteDao.find(hql, session);
		}else
			return null;
	}
	
}
