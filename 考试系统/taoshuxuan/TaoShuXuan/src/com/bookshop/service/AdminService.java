package com.bookshop.service;
/**
 * 网站管理员信息Service层接口
 * @author Winds
 *
 */
public interface AdminService {
	/**
	 * 网管登录
	 */
	public int login(String account,String pw);
}
