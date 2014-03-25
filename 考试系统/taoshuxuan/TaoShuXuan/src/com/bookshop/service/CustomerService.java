package com.bookshop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bookshop.entity.Customer;

/**
 * ��Ա��ϢService��ӿ�
 * @author Winds
 *
 */
public interface CustomerService {
	/**
	 * �����Ա�˺�
	 */
	public boolean activityCustomer(String email);
	/**
	 * ���ͼ����ַ���û�ע������
	 */
	public void sendEmail(String email,HttpSession httpSession);
	/**
	 * �û���¼
	 * @param email
	 * @param pw
	 * @return
	 */
	public boolean login(String email,String pw);
	/**
	 * ������Ա
	 * @param customer
	 * @return
	 */
	public boolean save(Customer customer);
	/**
	 * ��֤������Ч��
	 * @param email
	 * @return
	 */
	public boolean check_email(String email);
	
	/**
	 * �����û�״̬
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
