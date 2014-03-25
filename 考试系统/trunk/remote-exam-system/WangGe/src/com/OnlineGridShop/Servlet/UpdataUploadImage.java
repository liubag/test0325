package com.OnlineGridShop.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.elkan.utils.ImageUtil;

/**
 * ʵ��KindEditorͼƬ�ϴ���Servlet
 * 
 * @author SENHUI
 * 
 * @since 2011/03/21 20:20:23
 */
public class UpdataUploadImage extends HttpServlet {

	private static final long serialVersionUID = 5121794650920770832L;
	// �ϴ�ͼƬ�������
	protected int MAX_WIDTH = -1;
	// �ϴ�ͼƬ�����߶�
	protected int MAX_HEIGHT = -1;
	// �ϴ�ͼƬ�Ĵ�С
	protected long MAX_SIZE = 1000000;
	// ���������ϴ���ͼƬ����չ��
	protected String[] IMAGETYPES = new String[] { "gif", "jpg", "jpeg", "png", "bmp" };
	// �����ϴ�ͼƬ����Ŀ¼·��
	protected String UPLOAD_PATH = "";	
	// �ϴ�ͼƬ������Ϣ   
	protected String id = "";  
	// �ϴ�ͼƬ��TITLE����ֵ
	protected String imgTitle = ""; 
	
	protected int imgWidth = -1;   
	
	protected int imgHeight = -1;   
	
	protected String imgBorder = "";   
	
	protected String resizeImg = "";
	
	protected boolean isFlag = false;
	
	protected String tempTitle = "";

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String savePath = this.getInitParameter("UPLOAD_PATH");
		if (savePath == null || savePath.isEmpty()) {
			out.println(alertMsg("�㻹û�����ϴ�ͼƬ�����Ŀ¼·��!"));
			return;
		}
		//�ж��Ƿ��������ϴ�ͼƬ�Ĵ�С
		if(this.getInitParameter("MAX_SIZE") != null){
			MAX_SIZE = Integer.parseInt(this.getInitParameter("MAX_SIZE"));
		}
		//�ж��Ƿ��������ϴ�ͼƬ������
		if(this.getInitParameter("IMAGETYPES") != null){
			IMAGETYPES = toArray(this.getInitParameter("IMAGETYPES"));
		}
		// ͼƬ����Ŀ¼·��
		String uploadPath = new StringBuffer(request.getSession().getServletContext().getRealPath("/")).append(savePath).toString();
		
		// ͼƬ����Ŀ¼URL
		String saveUrl = new StringBuffer(request.getContextPath()).append("/").append(savePath).toString();
		
		// ����ϴ�ͼƬ�Ƿ����
		if (!ServletFileUpload.isMultipartContent(request)) {
			out.println(alertMsg("��ѡ����Ҫ�ϴ���ͼƬ!"));
			return;
		}
		
		// ���Ŀ¼
		File uploadDir = new File(uploadPath);
		if (!uploadDir.isDirectory()) {
			out.println(alertMsg("�ϴ�ͼƬ�����Ŀ¼�����ڡ�"));
			return;
		}
		
		// ���Ŀ¼дȨ��
		if (!uploadDir.canWrite()) {
			out.println(alertMsg("�ϴ�ͼƬ�����Ŀ¼û��дȨ�ޡ�"));
			return;
		}
		
		// ׼���ϴ�ͼƬ
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		List<?> items = null;
		String temp = null;
		try {
			items = upload.parseRequest(request);
			Iterator<?> itr =items.iterator();
			
			while (itr.hasNext()) {
				
				FileItem item = (FileItem) itr.next();
				 // �ϴ�ͼƬ��ԭ�ļ���   
		        String fileName = item.getName(); 
		        temp = (String) item.getName();
		        if(temp != null && !isFlag){
		        	temp = temp.substring(temp.lastIndexOf("\\")+1);
		        	tempTitle = temp;
		        	isFlag = true;
		        }
		         // KindEditor�༭����ID  
		        if(((String)item.getFieldName()).equals("id")){   
		            id = item.getString(); 
		        }  
		       
		        // �ϴ�ͼƬ��������ʾ
		        if(((String)item.getFieldName()).equals("imgTitle")){   
		            imgTitle = item.getString(); 
		            if(imgTitle != null){
		            	imgTitle = new String(imgTitle.getBytes("ISO8859-1"),"UTF-8");
		            }
		        } 
		        // ����ͼƬ�Ŀ��
		        if(((String)item.getFieldName()).equals("imgWidth")){   
		           String imgWidth = item.getString();   
		           if(imgWidth != null && !imgWidth.isEmpty()){
		        	   this.imgWidth = Integer.parseInt(imgWidth);
		           }
		        }  
		        // ����ͼƬ�ĸ߶�
		        if(((String)item.getFieldName()).equals("imgHeight")){   
		           String imgHeight = item.getString();   
		           if(imgHeight != null && !imgHeight.isEmpty()){
		        	   this.imgHeight = Integer.parseInt(imgHeight);
		           }
		        }
		        // ����ͼƬ�ı߿�
		        if(((String)item.getFieldName()).equals("imgBorder")){   
		            imgBorder = item.getString();  
		        } 
		        
				long fileSize = item.getSize();
				if (!item.isFormField()) {						
					// ����ļ���С
					if (fileSize > MAX_SIZE) {
						out.println(alertMsg("�ϴ��ļ���С�������ơ�"));
						return;
					}
					
					// �����չ��
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					if (!Arrays.<String> asList(IMAGETYPES).contains(fileExt)) {
						out.println(alertMsg("�ϴ�ͼƬ��չ���ǲ��������չ����"));
						return;
					}
					// ����ʱ�䴴���ļ���
					SimpleDateFormat folderNameFormat = new SimpleDateFormat("yyyyMMdd");
					String realPath = uploadPath + folderNameFormat.format(new Date());
					File folder = new File(realPath);
					boolean flag = folder.exists();
					// ȷ���ļ����Ƿ��Ѿ�����
					if(!flag){
						flag = folder.mkdir();
					}
					// �����ļ��в��ϴ�ͼƬ
					if(flag){
						SimpleDateFormat fileNameFormat = new SimpleDateFormat("yyyyMMddHHmmss");					
						String newFileName = fileNameFormat.format(new Date()) + "_"+ new Random().nextInt(1000) + "." + fileExt;						
						File uploadedFile = new File(realPath, newFileName);						
						item.write(uploadedFile);
						resizeImg = uploadedFile.getPath();
						resizeImg = resizeImg.replaceAll("\\\\", "/");
						saveUrl += folderNameFormat.format(new Date()) + "/" + newFileName;						
					}else{
						System.out.println(" �ļ��д���ʧ�ܣ���ȷ�ϴ���û��д�������ҿռ��㹻");
					}	
				}
			}
			
			// �ж��Ƿ�����ͼƬ���������߶�
			String max_width = this.getInitParameter("MAX_WIDTH");
			String max_height = this.getInitParameter("MAX_HEIGHT");
			if((max_width != null && !max_width.isEmpty())){
				MAX_WIDTH = Integer.parseInt(max_width);
			}
			if(max_height != null && !max_height.isEmpty()){
				MAX_HEIGHT = Integer.parseInt(max_height);
			}
			
			if(imgTitle == null || imgTitle.isEmpty()){
				imgTitle = tempTitle;
			}
			
			// �ж��Ƿ�Ҫѹ��ͼƬ
			if(MAX_WIDTH != -1 || MAX_HEIGHT != -1) {
				// ѹ��ͼƬ
				ImageUtil.resizeImg(resizeImg, resizeImg, MAX_WIDTH, MAX_HEIGHT);
				
				if(this.imgWidth > ImageUtil.ImgWidth){
					this.imgWidth = ImageUtil.ImgWidth;
				}
				
				if(this.imgHeight > ImageUtil.ImgHeight){
					this.imgHeight = ImageUtil.ImgHeight;
				}
				
				// ���ر༭��
				out.println(insertEditor(id, saveUrl, imgTitle, imgWidth, imgHeight, imgBorder));
			}else{
				// ���ر༭��
				out.println(insertEditor(id, saveUrl, imgTitle, imgWidth, imgHeight, imgBorder));
			}				
			
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			out.flush();
			out.close();
			isFlag = false;
		}

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * �����ӡ�ϴ�ʧ�ܵ�JSON���
	 * 
	 * @param message    ʧ����Ϣ
	 * 
	 * @return ҳ���ϴ�ʧ�ܵ�JSON���
	 */
	public String alertMsg(String message) {
		StringBuffer sb = new StringBuffer("{\"error\":\"1\",\"message\":\"");
		sb.append(message).append("\"}");
		return sb.toString();
	}
	
	/**
	 * �������ͼƬ���༭�����Ľű�
	 * 
	 * @param id        �༭��ID
	 * 
	 * @param saveUrl   �ϴ�ͼƬ�������ַ
	 * 
	 * @param imgTitle   ͼƬ����ʾ��Ϣ
	 * 
	 * @param imgWidth   ����ͼƬ�Ŀ��
	 * 
	 * @param imgHeight  ����ͼƬ�Ŀ��
	 * 
	 * @param imgBorder  ����ͼƬ�ı߿�
	 * 
	 * @return ����ͼƬ���༭���Ľű����
	 */
	public String insertEditor(String id, String saveUrl, String imgTitle, 
			int imgWidth, int imgHeight, String imgBorder){
		StringBuffer sb = new StringBuffer("<script type\"text/javascript\">");
		sb.append("parent.KE.plugin[\"image\"].insert(\"").append(id).append("\",\"");
		sb.append(saveUrl).append("\",\"").append(imgTitle).append("\",\"");
		sb.append(imgWidth).append("\",\"").append(imgHeight).append("\",\"");
		sb.append(imgBorder).append("\");");
		sb.append("</script>");
		return sb.toString();
	}
	
	/**
	 * ��������ϴ�ͼƬ���͵�����
	 * 
	 * @param filesType �����ϴ���ͼƬ����
	 * 
	 * @return �����ϴ�ͼƬ����
	 */
	public String[] toArray(String filesType){
		
		if(filesType == null){
			return null;
		}
			
		String[] types = filesType.split(",");
		String[] allowTypes = new String[types.length];
		int i = 0;
		for(String type : types){
			allowTypes[i] = type;
			i++;
		}
		
		return allowTypes;
	}
}
