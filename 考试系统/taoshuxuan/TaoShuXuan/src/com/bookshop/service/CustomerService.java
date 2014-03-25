package com.bookshop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bookshop.entity.Customer;

/**
 * 会员信息Service层接口
 * @author Winds
 *
 */
public interface CustomerService {
	/**
	 * 激活会员账号
	 */
	public boolean activityCustomer(String email);
	/**
	 * 发送激活地址到用户注册邮箱
	 */
	public void sendEmail(String email,HttpSession httpSession);
	/**
	 * 用户登录
	 * @param email
	 * @param pw
	 * @return
	 */
	public boolean login(String email,String pw);
	/**
	 * 新增会员
	 * @param customer
	 * @return
	 */
	public boolean save(Customer customer);
	/**
	 * 验证邮箱有效性
	 * @param email
	 * @return
	 */
	public boolean check_email(String email);
	
	/**
	 * 更新用户状态
	 * @param email
	 * @return
	 */
	public int updateState(String email);
	public Customer find(String email);
	
//	public Long hasNumbers(String entityName);
//	public int findPages(int perFolioAmount,String entityName);
//	public List<?> show_by_page(int page,int perFolioAmount,String entityName);
//	
//	public Long hasNumbers(String entityName,String parameter);
//	public int findPages(int perFolioAmount,String entityName,String parameter);
//	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String parameter);
	
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
}
