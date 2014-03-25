package com.bookshop.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;


public class StringUtil {
	private static List<String> list =new ArrayList<String>();
	/**
	 * 把一个字符串通过一个分隔符分隔成一个集合
	 * @param options
	 * @param separator
	 * @return
	 */
	public static List<String> getOption(String options,String separator){
		int index=0;
		String option;
		list.clear();
		//消取掉字符串options前的separator
		if(String.valueOf(options.charAt(0)).equals(separator)){
			options=options.substring(1);
		}
		
		//消取掉字符串options后的separator
		if(String.valueOf(options.charAt(options.length()-1)).equals(separator)){
			options=options.substring(0,options.length()-1);
		}
		//如果消取掉字符串options前后的separator，不存在了separator
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
	 * 把管理员，老师，学生的id从permission_id中截取出来
	 * @param permission_id
	 * @return
	 */
	public static String cutOutId(String permission_id){
		return permission_id.substring(permission_id.lastIndexOf(",")+1);
	}
	/**
	 * 将字符串集合里的每一个字符串用连接符串起来。返回一个长串
	 * 
	 * 
	 * @param strs
	 *            字符串集合
	 * 
	 * @param split
	 *            连接符
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
	 * 判断一个字符串是否为空，即 为 null 或 "" 或 "NULL" 或 "null"
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
	 * 判断集合是否为空
	 * @param collection
	 * @return
	 */
	public static boolean isCollectionEmpty(Collection<? extends Object> collection){
		return collection==null || collection.isEmpty();
	}
}
