package com.aspsystem.serivce;

import java.util.List;

import com.aspsystem.entity.MyClass;


public interface MyClassSerivce {
	public boolean dele(Integer class_id,String permission_id);
	public boolean deleBatch(String idArray,String permission_id);
	public boolean save(MyClass myClass,String permission_id);
	public boolean update(MyClass myClass,String permission_id);
	public MyClass find(Integer class_id,String permission_id);
	public MyClass find(String class_name,String permission_id);
	public List<MyClass> find(String permission_id);
	public boolean findMyClass(Integer class_id,String permission_id);
	public int findPages(int perFolioAmount,String entityName);  //������ҳ��
	public Long hasNumbers(String entityName);     //���������ݸ���
	public List<?> show_by_page(int page,int perFolioAmount,String entityName);  //����ҳ������
}
