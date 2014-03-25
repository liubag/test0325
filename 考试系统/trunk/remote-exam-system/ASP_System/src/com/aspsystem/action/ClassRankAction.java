package com.aspsystem.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.aspsystem.entity.ClassRank;
import com.aspsystem.entity.Exam;
import com.aspsystem.serivce.ClassRankSerivce;
import com.aspsystem.util.MyStringAppConfigs;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial","unchecked"})
public class ClassRankAction extends  ActionSupport{
	
	@Resource
	private ClassRankSerivce classRankSerivce;
	
	private Map<String,Object> session;//
	private String permission_id;
	private List<ClassRank> classRank_l;
	private String exam_id;
	private List<Exam> noClassRankExam_l;
	private MyStringAppConfigs myStringAppConfigs;
	private String tip;
	/**
	 * 获取参加这次考试的班级
	 * @return
	 */
	public String classRank(){
		String flag="fail";
		setTip("");
		try{
			session=ActionContext.getContext().getSession();
			permission_id=(String)session.get("teacher_permission");
			classRank_l=(List<ClassRank>)classRankSerivce.find(exam_id, permission_id);
			if(classRank_l==null){
				if(classRankSerivce.rankExam(exam_id, permission_id)){
					classRank_l=(List<ClassRank>)classRankSerivce.find(exam_id, permission_id);
					flag="success";
				}else{
					flag="fail";
					myStringAppConfigs=MyStringAppConfigs.create_classrank_fail;
					setTip(myStringAppConfigs.getValue());
				}
			}else{
				flag= "success";
			}
			return flag;
		}catch(Exception e){
			e.printStackTrace();
			setTip(e.getMessage());
			return flag;
		}
	}
	public List<ClassRank> getClassRank_l() {
		return classRank_l;
	}
	public void setClassRank_l(List<ClassRank> classRank_l) {
		this.classRank_l = classRank_l;
	}
	public String getExam_id() {
		return exam_id;
	}
	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
	}
	public void setNoClassRankExam_l(List<Exam> noClassRankExam_l) {
		this.noClassRankExam_l = noClassRankExam_l;
	}
	public List<Exam> getNoClassRankExam_l() {
		return noClassRankExam_l;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getTip() {
		return tip;
	}

}
