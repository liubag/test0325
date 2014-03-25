package com.drag.service;

import com.drag.entity.MoveDivs;

public interface MoveDivsService {
	public boolean save(String div_content);
	/**
	 * ����һ���ض��ĵ�ͼ
	 * @param moveDivs_id
	 * @param div_content
	 * @return
	 */
	public boolean save(String moveDivs_id,String div_content);
	public boolean update(String moveDivs_id,String div_content);
	public MoveDivs find(String moveDivs_id);
	/**
	 * ͨ��div_content����MoveDivs
	 * @param div_content
	 * @return
	 */
	public MoveDivs findByDivContent(String div_content);
}
