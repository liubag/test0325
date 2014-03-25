package com.searchEngine.service;

import java.util.List;

import com.searchEngine.entity.KeyWord;

public interface KeyWordService {
	public void gainGoods_by_keyWord(String keyword_content,int rowNames);
	public List<KeyWord> findKeyWord_By_Rate(String keyWord);
	public KeyWord find(String keyWord);
	public boolean addSystemKeyWord(String keyword_content);
	public List<List<?>> showAll(String keyword_content,int page,int perFolioAmount,String otherOrderBy,int rowName);
	public Long findCount(String keyword_content,int rowName);
	public String findFridKeyWord();
	public boolean updataKeyWord_max();
	public boolean updataKeyWord_Click();
	public Long findKeyWordCount();
	public List<KeyWord> showKeyWord_by_page(int page,int perFolioAmount);
	public boolean deleKeyWord(String keyword_id);
	
}
