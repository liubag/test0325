package com.drag.service;

import com.drag.entity.Title;

public interface TitleService {
	public Title findTitle(String div_id,String moveDivs_id);
	public boolean updateTitle(Title title);
	/**
	 * ����һ��Title
	 * @param title
	 * @return
	 */
	public boolean save(Title title);
	
	/**
	 * ɾ����ͼ�е�ĳ��div
	 * @param div_id div��id
	 * @param moveDivs_id ��ͼid
	 * @return
	 */
	public boolean dele(String div_id,String moveDivs_id);
}
