package com.bookshop.util;
/*
 * 创建时间：2011-12—29
 * 创建人：王秋贵
 * 详情：字符串枚举
 * 
 */
public enum MyStringAppConfigs {
	add_myclass_fail("添加班级出错."),
	show_questions_fail("显示考题出错！");
	
	
	private String value;
	MyStringAppConfigs(String value){
		this.value = value;
	}
	public String getValue() {
		return value;
	}
	
}
