package com.searchEngine.entity;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_keyword")
public class KeyWord {
	@Id
	private String keyword_id; //UUID
	@Column(length=100)
	private String keyword_content; 
	private int keyword_status; //1��ʾ�˹ؼ���Ϊϵͳ�ؼ��֣�0Ϊ��ͨ�ؼ���	
	private int keyword_today_click; //����������
	private float keyword_before_click; //���ڵĵ����
	private int keyword_has_goods;// �ؼ��ְ����ı���
	
	public KeyWord(){}
	public KeyWord(String isnew){
		keyword_id = UUID.randomUUID().toString();
	}
	public String getKeyword_id() {
		return keyword_id.toLowerCase();
	}
	public void setKeyword_id(String keyword_id) {
		this.keyword_id = keyword_id;
	}
	public String getKeyword_content() {
		return keyword_content;
	}
	public void setKeyword_content(String keyword_content) {
		this.keyword_content = keyword_content;
	}
	public int getKeyword_status() {
		return keyword_status;
	}
	public void setKeyword_status(int keyword_status) {
		this.keyword_status = keyword_status;
	}
	public int getKeyword_today_click() {
		return keyword_today_click;
	}
	public void setKeyword_today_click(int keyword_today_click) {
		this.keyword_today_click = keyword_today_click;
	}
	public float getKeyword_before_click() {
		return keyword_before_click;
	}
	public void setKeyword_before_click(float keyword_before_click) {
		this.keyword_before_click = keyword_before_click;
	}
	public int getKeyword_has_goods() {
		return keyword_has_goods;
	}
	public void setKeyword_has_goods(int keyword_has_goods) {
		this.keyword_has_goods = keyword_has_goods;
	}
	
}
