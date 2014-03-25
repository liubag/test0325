package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Collection;

/**
 * �ղ���ϢService��ӿ�
 * @author Winds
 *
 */
public interface CollectionService {
	/**
	 * �����ղ�����ͼ��
	 */
	public List<Object> getHotCollection();
	/**
	 * ɾ����Աͼ���ղؼ�¼
	 * @param collection_id �ղؼ�¼Id
	 * @return boolean
	 */
	public boolean delete(String collection_id);
	/**
	 * ����ɾ����Աͼ���ղؼ�¼
	 * @param collectionIdStr �ղؼ�¼Id��
	 * @return
	 */
	public boolean deleteBatch(String collectionIdStr);
	/**
	 * ��ҳ�����еĸ�ͼ����ղ���
	 * @param collection_l
	 * @return
	 */
	public List<Long> findColletionNum(List<Collection> collection_l);
	
	/**
	 * ����ղ�
	 * @return
	 */
	public int addToCollection(String book_id,String customer_email);
	/**
	 * ��ҳ����
	 * @param entityName ʵ������
	 * @param paramName  ʵ��Ĳ�ѯ������
	 * @param value    ��Ӧ������ֵ
	 * @param isLike   �Ƿ�Ҫģ����ѯ
	 * @return
	 */
	public Long hasNumbers(String entityName,String[] paramName,String[]value,boolean isLike);
	public List<?> show_by_page(int page,int perFolioAmount,String entityName,String[] paramName,String[]value,boolean isLike);
}
