package com.bookshop.util;
/*
 * ����ʱ�䣺2011-12��29
 * �����ˣ������
 * ���飺�ַ���ö��
 * 
 */
public enum MyStringAppConfigs {
	add_myclass_fail("��Ӱ༶����."),
	show_questions_fail("��ʾ�������");
	
	
	private String value;
	MyStringAppConfigs(String value){
		this.value = value;
	}
	public String getValue() {
		return value;
	}
	
}
