package com.aspsystem.action;

import javax.annotation.Resource;

import com.aspsystem.entity.AanswerNote;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AanswerNoteAction extends  ActionSupport{
	
//	@Resource
//	private AanswerNoteSerivce aanswerNoteSerivce;
	private AanswerNote aanswerNote;
	public AanswerNote getAanswerNote() {
		return aanswerNote;
	}
	public void setAanswerNote(AanswerNote aanswerNote) {
		this.aanswerNote = aanswerNote;
	}
	
	
}
