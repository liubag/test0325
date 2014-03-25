package com.drag.service;

import com.drag.entity.MoveDivs;

public interface MoveDivsService {
	public boolean save(String div_content);
	/**
	 * 增加一张特定的地图
	 * @param moveDivs_id
	 * @param div_content
	 * @return
	 */
	public boolean save(String moveDivs_id,String div_content);
	public boolean update(String moveDivs_id,String div_content);
	public MoveDivs find(String moveDivs_id);
	/**
	 * 通过div_content查找MoveDivs
	 * @param div_content
	 * @return
	 */
	public MoveDivs findByDivContent(String div_content);
}
