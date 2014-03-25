package com.aspsystem.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.aspsystem.entity.Questions;
import com.aspsystem.serivce.CourseSerivce;
import com.aspsystem.serivce.QuestionsSerivce;
import com.aspsystem.serivce.TeacherSerivce;
import com.aspsystem.util.ReadXlsAndXlsx;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings({"serial"})
public class ReadXlsAction extends ActionSupport {
	@Resource
	private QuestionsSerivce questionsSerivce;
	@Resource
	private CourseSerivce courseSerivce;
	@Resource
	private TeacherSerivce teacherSerivce;
	private File upload;  
	private String uploadContentType;  //������,�п��Ҫ��
	private String uploadFileName;  //������,�п��Ҫ��
	private File target;
	

	public File getUpload() {
		return upload;
	}



	public void setUpload(File upload) {
		this.upload = upload;
	}



	public String getUploadContentType() {
		return uploadContentType;
	}



	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}



	public String getUploadFileName() {
		return uploadFileName;
	}



	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String uploadQuestions(){
			try {
				String flag="fail";
				if(uploadFile()){
					if(target!=null){
						 String excelContentType = uploadFileName.substring(uploadFileName.lastIndexOf(".")); //��ȡ�ϴ��ļ�������
						 HttpServletRequest request =ServletActionContext.getRequest();
						 Map<String,Object> session =ServletActionContext.getContext().getSession();
						 String permission_id=(String)session.get("admin_permission");
						 if(permission_id!=null){
							 if(".xls".equals(excelContentType)){
								 List<Map<String,String>> list=ReadXlsAndXlsx.loadXls(target.getAbsolutePath(), 1, "Questions",request);
					         	List<Questions> qlist =this.mapToQuestion(list,permission_id);
					         	for(Questions question:qlist){
					         		this.questionsSerivce.save(question,permission_id);
					         	}
					         	flag= "success";
							 }else if(".xlsx".equals(excelContentType)){
								 List<Map<String,String>> list=ReadXlsAndXlsx.loadXlsx(target.getAbsolutePath(), 1, "Questions",request);
					         	List<Questions> qlist =this.mapToQuestion(list,permission_id);
					         	for(Questions question:qlist){
					         		this.questionsSerivce.save(question,permission_id);
					         	}
					         	flag="success";
							 }
						 }
					}
				}
				return flag;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "fail";
			}
		
	}
	
	
	public List<Questions> mapToQuestion(List<Map<String,String>> list,String permission_id){
		List<Questions> qlist=new  ArrayList<Questions>();
		for(Map<String,String> map:list){
			//print(map);
			Questions question=new Questions("yes");
			if(map.get("course")!="" && map.get("course")!=null){
				if(courseSerivce.find(Integer.valueOf(map.get("course")),permission_id)!=null){
					question.setCourse(courseSerivce.find(Integer.valueOf(map.get("course")),permission_id));
				}
			}
			if(map.get("type")!="" && map.get("type")!=null){
				question.setType(Integer.valueOf(map.get("type")));
			}
			if(map.get("topic")!="" && map.get("topic")!=null){
				question.setTopic(map.get("topic"));
			}
			if(map.get("options")!="" && map.get("options")!=null){
				question.setOptions(map.get("options"));
			}
			if(map.get("answer")!="" && map.get("answer")!=null){
				question.setAnswer(map.get("answer"));
			}
			if(map.get("analysis")!="" && map.get("analysis")!=null){
				question.setAnalysis(map.get("analysis"));
			}
			if(map.get("teacher")!="" && map.get("teacher")!=null){
				if(teacherSerivce.find(map.get("teacher"),permission_id)!=null){
					question.setTeacher(teacherSerivce.find(map.get("teacher"),permission_id));
				}
			}
			qlist.add(question);
		}
		return qlist;
	}
	
	//�ϴ��ļ���������
	public boolean uploadFile(){
	    String directory = "admin/upload";  
        String targetDirectory = ServletActionContext.getServletContext().getRealPath(directory);  
        //�����ϴ����ļ�����  
         target = new File(targetDirectory,uploadFileName);  

        //����ļ��Ѿ����ڣ���ɾ��ԭ���ļ�  
        if(target.exists()){  
            target.delete();  
        }  
        //����file����ʵ���ϴ�  
        try {  
            FileUtils.copyFile(upload, target);  
              
            //out = response.getWriter();  
            //out.print("�ļ��ϴ��ɹ���");  
            return true;
        } catch (IOException e) {  
            e.printStackTrace();
            return false;
        } 
        
	}
}
