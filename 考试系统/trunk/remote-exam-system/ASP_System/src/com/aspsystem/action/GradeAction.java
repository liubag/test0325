package com.aspsystem.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.aspsystem.entity.Grade;
import com.aspsystem.serivce.GradeSerivce;
import com.aspsystem.util.MyStringAppConfigs;
import com.aspsystem.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class GradeAction extends  ActionSupport{
	
	@Resource
	private GradeSerivce gradeSerivce;
	private Grade grade;
	
	private Long hasGrade;   //数据的总个数
	private int page;		 //当前页
	private int hasPages;	 //总页数
	private int perFolioAmount;  //每页数据的条数
	private List<Integer> page_l;//获取一个从1到hasPages的数组
	private List<Grade> Grade_l; //当前页的数据
	private List<Grade> allGrade_l; //当所有的数据
	private Map<String,Object> session;
	private String permission_id;
	private String idArray;
	private String tip;
	private String class_id;
	private String exam_id;
	
	private List<Integer> rank_in_class_l;//班级排名集合
	private List<Integer> rank_in_grade_l;//全级排名集合
	
	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
	private MyStringAppConfigs myStringAppConfigs;  
	/**
	 * 获取分页显示Grade所需要数据
	 * 
	 */
	public String showGrade_by_page(){
		try{			
			session=ActionContext.getContext().getSession();
			permission_id=(String)session.get("student_permission");
			perFolioAmount = 4;   //每页显示条数
			this.hasGrade = gradeSerivce.hasNumbers(permission_id);//获取数据条数
			
			hasPages = gradeSerivce.findPages(perFolioAmount, permission_id); //获取页数
			
			this.page_l = PageUtil.getPageList(hasPages);  //获取一个从1到hasPages的数组
			if (page <= 0) {
				page = 1;
			}
			if (hasPages == 0) {
				page = 0;
			} else {
				if (page <= 0) {
					page = 1;
				} else if (page > hasPages) {
					page = hasPages;
				}
			}
			//获取当前页的数据
			this.Grade_l = (List<Grade>)gradeSerivce.show_by_page( page, perFolioAmount, permission_id);
			if(Grade_l==null){
				return INPUT;
			}
			rank_in_class_l=new ArrayList<Integer>();
			rank_in_grade_l=new ArrayList<Integer>();
			for(Grade g:Grade_l){
				rank_in_class_l.add(gradeSerivce.getRank_in_class(g,permission_id));
			}
			for(Grade g:Grade_l){
				rank_in_grade_l.add(gradeSerivce.getRank_in_grade(g,permission_id));
			}

			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	
	@SuppressWarnings("unchecked")
	public String studentRank(){
		try{
			session=ActionContext.getContext().getSession();
			permission_id=(String)session.get("teacher_permission");
			this.Grade_l = (List<Grade>)gradeSerivce.find(exam_id, class_id, permission_id);
			rank_in_class_l=new ArrayList<Integer>();
			rank_in_grade_l=new ArrayList<Integer>();
			for(Grade g:Grade_l){
				rank_in_class_l.add(gradeSerivce.getRank_in_class(g,permission_id));
			}
			for(Grade g:Grade_l){
				rank_in_grade_l.add(gradeSerivce.getRank_in_grade(g,permission_id));
			}
			return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return INPUT;
		}
	}
	public GradeSerivce getGradeSerivce() {
		return gradeSerivce;
	}


	public void setGradeSerivce(GradeSerivce gradeSerivce) {
		this.gradeSerivce = gradeSerivce;
	}


	public Long getHasGrade() {
		return hasGrade;
	}


	public void setHasGrade(Long hasGrade) {
		this.hasGrade = hasGrade;
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getHasPages() {
		return hasPages;
	}


	public void setHasPages(int hasPages) {
		this.hasPages = hasPages;
	}


	public int getPerFolioAmount() {
		return perFolioAmount;
	}


	public void setPerFolioAmount(int perFolioAmount) {
		this.perFolioAmount = perFolioAmount;
	}


	public List<Integer> getPage_l() {
		return page_l;
	}


	public void setPage_l(List<Integer> page_l) {
		this.page_l = page_l;
	}


	public List<Grade> getGrade_l() {
		return Grade_l;
	}


	public void setGrade_l(List<Grade> grade_l) {
		Grade_l = grade_l;
	}


	public List<Grade> getAllGrade_l() {
		return allGrade_l;
	}


	public void setAllGrade_l(List<Grade> allGrade_l) {
		this.allGrade_l = allGrade_l;
	}


	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	public String getPermission_id() {
		return permission_id;
	}


	public void setPermission_id(String permission_id) {
		this.permission_id = permission_id;
	}


	public String getIdArray() {
		return idArray;
	}


	public void setIdArray(String idArray) {
		this.idArray = idArray;
	}


	public MyStringAppConfigs getMyStringAppConfigs() {
		return myStringAppConfigs;
	}


	public void setMyStringAppConfigs(MyStringAppConfigs myStringAppConfigs) {
		this.myStringAppConfigs = myStringAppConfigs;
	}
	

	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public void setRank_in_class_l(List<Integer> rank_in_class_l) {
		this.rank_in_class_l = rank_in_class_l;
	}

	public List<Integer> getRank_in_class_l() {
		return rank_in_class_l;
	}

	public void setRank_in_grade_l(List<Integer> rank_in_grade_l) {
		this.rank_in_grade_l = rank_in_grade_l;
	}

	public List<Integer> getRank_in_grade_l() {
		return rank_in_grade_l;
	}

	public String getClass_id() {
		return class_id;
	}

	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}

	public String getExam_id() {
		return exam_id;
	}

	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
	}
	
}
