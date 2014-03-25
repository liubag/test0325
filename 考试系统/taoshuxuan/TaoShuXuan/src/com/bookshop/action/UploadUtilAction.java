package com.bookshop.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.bookshop.util.UtilCommon;
import com.opensymphony.xwork2.ActionSupport;

public class UploadUtilAction extends ActionSupport implements
		ServletResponseAware {

	private File fileupload; // 和JSP中input标记name同名
	private String imageUrl;
	private String attachmentUrl;
	private String fileRealName;
	private HttpServletResponse response;
	// Struts2拦截器获得的文件名,命名规则，File的名字+FileName
	// 如此处为 'fileupload' + 'FileName' = 'fileuploadFileName'
	private String fileuploadFileName; // 上传来的文件的名字
	private String guid;
	private String imageFile;

	public String uploadFile() {
		String extName = ""; // 保存文件拓展名
		String newFileName = ""; // 保存新的文件名
		PrintWriter out = null;
		String savePath = ServletActionContext.getServletContext().getRealPath(
				""); // 获取项目根路径
		savePath = savePath + "/../BookImages/"+imageFile+"/";
		System.out.println(savePath);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk"); // 务必，防止返回文件名是乱码

		// 获取拓展名
		if (fileuploadFileName.lastIndexOf(".") >= 0) {
			extName = fileuploadFileName.substring(fileuploadFileName
					.lastIndexOf("."));
		}
		try {
			out = response.getWriter();
			newFileName = guid+ extName; // 文件重命名后的名字
			String filePath = savePath + newFileName;
			filePath = filePath.replace("\\", "/");
			System.out.println(newFileName);
			//检查上传的是否是图片
			if (UtilCommon.checkIsImage(extName)) {
				FileUtils.copyFile(fileupload, new File(filePath));
				out.print(newFileName);

			} else {
				out.print("<font color='red'>上传的文件类型错误，请选择jpg,jpeg,png和gif格式的图片!</font>");
			}
		
			// 直接输入响应的内容
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			out.print("上传失败，出错啦!");
		}
		return null;
	}

	public File getFileupload() {
		return fileupload;
	}

	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getAttachmentUrl() {
		return attachmentUrl;
	}

	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public String getFileuploadFileName() {
		return fileuploadFileName;
	}

	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}

	public String getGuid() {
		return guid;
	}

	public void setGuid(String guid) {
		this.guid = guid;
	}

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
    
}
