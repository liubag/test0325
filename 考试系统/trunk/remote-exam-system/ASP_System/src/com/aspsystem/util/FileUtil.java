package com.aspsystem.util;
/*
 * 文件操作
 * 
 */
import java.io.File;

import org.apache.struts2.ServletActionContext;

public class FileUtil {
	
	/*
	 * 此路径是获取考试导出文件路径
	 */
	public static String getExamPath(){
		return "../ASP_System/admin/examFile";
	}
	
	/*
	 * 此路径是保存考试导出文件路径，以上两种路径，根据开发时具体情况具体使用，如路径有误，自行修改
	 */
	public static String getExamPath_save(){
		return "../webapps/ASP_System/admin/examFile";
	}
	
	@SuppressWarnings("deprecation")
	public static boolean dele(String path, String filename) {
		String root = ServletActionContext.getRequest().getRealPath(path);
		File dir = new File(root);
		if (dir.exists() == false) {
			return true;
		} else {
			dir.delete();
			return true;
		}
	}


	
	/**
	 * 删除文件
	 * @param filePathAndName  String 文件路径及名称 如c:/fqf.txt
	 * @param fileContent String
	 * @return boolean
	 */
	public static boolean delFile(String filePathAndName) {
		try {
			String filePath = filePathAndName;
			filePath = filePath.toString();
			java.io.File myDelFile = new java.io.File(filePath);
			myDelFile.delete();
			return true;
		} catch (Exception e) {
			System.out.println("删除文件操作出错");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 删除文件夹
	 * 
	 * @param filePathAndName
	 *            String 文件夹路径及名称 如c:/fqf
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	public static boolean delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // 删除完里面所有内容
			String filePath = folderPath;
			filePath = filePath.toString();
			java.io.File myFilePath = new java.io.File(filePath);
			myFilePath.delete(); // 删除空文件夹
			return true;
		} catch (Exception e) {
			System.out.println("删除文件夹操作出错");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 删除文件夹里面的所有文件
	 * @param path String 文件夹路径 如 c:/fqf
	 */
	public static void delAllFile(String path) {
		File file = new File(path);
		if (!file.exists()) {
			return;
		}
		if (!file.isDirectory()) {
			return;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				temp.delete();
			}
			if (temp.isDirectory()) {
				delAllFile(path + "/" + tempList[i]);// 先删除文件夹里面的文件
				delFolder(path + "/" + tempList[i]);// 再删除空文件夹
			}
		}
	}
	
}
