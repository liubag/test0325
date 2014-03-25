package com.aspsystem.util;
/*
 * �ļ�����
 * 
 */
import java.io.File;

import org.apache.struts2.ServletActionContext;

public class FileUtil {
	
	/*
	 * ��·���ǻ�ȡ���Ե����ļ�·��
	 */
	public static String getExamPath(){
		return "../ASP_System/admin/examFile";
	}
	
	/*
	 * ��·���Ǳ��濼�Ե����ļ�·������������·�������ݿ���ʱ�����������ʹ�ã���·�����������޸�
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
	 * ɾ���ļ�
	 * @param filePathAndName  String �ļ�·�������� ��c:/fqf.txt
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
			System.out.println("ɾ���ļ���������");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * ɾ���ļ���
	 * 
	 * @param filePathAndName
	 *            String �ļ���·�������� ��c:/fqf
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	public static boolean delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // ɾ����������������
			String filePath = folderPath;
			filePath = filePath.toString();
			java.io.File myFilePath = new java.io.File(filePath);
			myFilePath.delete(); // ɾ�����ļ���
			return true;
		} catch (Exception e) {
			System.out.println("ɾ���ļ��в�������");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * ɾ���ļ�������������ļ�
	 * @param path String �ļ���·�� �� c:/fqf
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
				delAllFile(path + "/" + tempList[i]);// ��ɾ���ļ���������ļ�
				delFolder(path + "/" + tempList[i]);// ��ɾ�����ļ���
			}
		}
	}
	
}
