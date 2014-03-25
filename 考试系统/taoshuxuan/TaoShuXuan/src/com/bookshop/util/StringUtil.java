package com.bookshop.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;


public class StringUtil {
	private static List<String> list =new ArrayList<String>();
	/**
	 * ��һ���ַ���ͨ��һ���ָ����ָ���һ������
	 * @param options
	 * @param separator
	 * @return
	 */
	public static List<String> getOption(String options,String separator){
		int index=0;
		String option;
		list.clear();
		//��ȡ���ַ���optionsǰ��separator
		if(String.valueOf(options.charAt(0)).equals(separator)){
			options=options.substring(1);
		}
		
		//��ȡ���ַ���options���separator
		if(String.valueOf(options.charAt(options.length()-1)).equals(separator)){
			options=options.substring(0,options.length()-1);
		}
		//�����ȡ���ַ���optionsǰ���separator����������separator
		if(options.indexOf(separator)==-1){
			list.add(options);
		}
		
		while(index<options.lastIndexOf(separator)){			
			option=options.substring(index, options.indexOf(separator,index)).trim();
			list.add(option);
			index= options.indexOf(separator,index)+1;
			if((index-1)==options.lastIndexOf(separator)){
				option=options.substring(index).trim();
				list.add(option);
			}
		}

		return list;
	}
	/**
	 * �ѹ���Ա����ʦ��ѧ����id��permission_id�н�ȡ����
	 * @param permission_id
	 * @return
	 */
	public static String cutOutId(String permission_id){
		return permission_id.substring(permission_id.lastIndexOf(",")+1);
	}
	/**
	 * ���ַ����������ÿһ���ַ��������ӷ�������������һ������
	 * 
	 * 
	 * @param strs
	 *            �ַ�������
	 * 
	 * @param split
	 *            ���ӷ�
	 * 
	 * @return
	 * @throws Exception
	 */
	public static String join(List<String> strs, String split) {
		if (isCollectionEmpty(strs) || isEmpty(split)) {
			return "";
		}

		StringBuilder rs = new StringBuilder(strs.size() * 60);
		for (Iterator<String> itr = strs.iterator(); itr.hasNext();) {
			String str = itr.next();
			if (!isEmpty(str)) {
				if (itr.hasNext()) {
					rs.append(str).append(split);
				} else {
					rs.append(str);
				}
			}
		}

		return rs.toString();
	}
	
	/**
	 * �ж�һ���ַ����Ƿ�Ϊ�գ��� Ϊ null �� "" �� "NULL" �� "null"
	 * 
	 * @param string
	 * 
	 * @return
	 */
	public static boolean isEmpty(String str) {
		return str == null || "".equals(str.trim())
				|| "NULL".equalsIgnoreCase(str.trim());
	}
	
	/**
	 * �жϼ����Ƿ�Ϊ��
	 * @param collection
	 * @return
	 */
	public static boolean isCollectionEmpty(Collection<? extends Object> collection){
		return collection==null || collection.isEmpty();
	}
}
