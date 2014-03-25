package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Catagory;

/**
 * 图书分类信息Service层接口
 * @author Winds
 *
 */
public interface CatagoryService {
	public boolean add(Catagory catagory,int firstCatagory_id);
	public boolean updateName(Catagory catagory);
	public boolean updateDiscount(Catagory catagory);
	public boolean find(int catagory_id);
	public Catagory find(String catagory_name);
	public boolean delete(int catagory_id);
	public List<Catagory> findAll(int catagory_id);
	public List<Catagory> findAllFirstCatagory();
	public List<Catagory> findAllSecondCatagory();
	
//	public Long hasNumbers(String entityName);
//	public int findPages(int perFolioAmount,String entityName);
//	public List<?> show_by_page(int page,int perFolioAmount,String entityName);
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
}
