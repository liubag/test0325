package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Book;

/**
 * ��Ա�����¼��ϢService��ӿ�
 * @author Winds
 *
 */
public interface ShoppingRecordService {
	/**
	 * ��ȡ����������
	 * һ�����ϼܵ���
	 * @return
	 */
	public List<Object> getHotsale_newbook();
	
	/**
	 * ��ȡ�������ߵ�ͼ��
	 * @return
	 */
	public List<Object> getHotAuthorBooks();
	
	/**
	 * ��ȡ����ͼ��
	 * ����ǰ��
	 */
	public List<Object> getHotsale();
}
