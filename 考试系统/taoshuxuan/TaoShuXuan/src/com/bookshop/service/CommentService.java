package com.bookshop.service;

import java.util.List;

/**
 * ������ϢService��ӿ�
 * @author Winds
 *
 */
public interface CommentService {
	public List<Integer> findStarList(String book_l);
	
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
}
