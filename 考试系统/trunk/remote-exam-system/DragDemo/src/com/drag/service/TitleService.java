package com.drag.service;

import com.drag.entity.Title;

public interface TitleService {
	public Title findTitle(String div_id,String moveDivs_id);
	public boolean updateTitle(Title title);
	/**
	 * 新增一个Title
	 * @param title
	 * @return
	 */
	public boolean save(Title title);
	
	/**
	 * 删除地图中的某个div
	 * @param div_id div的id
	 * @param moveDivs_id 地图id
	 * @return
	 */
	public boolean dele(String div_id,String moveDivs_id);
}
