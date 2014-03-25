package com.bookshop.entity;


import java.util.Map;


public class ShoppingCart{
	private Map<String ,BookItem> bookItems;

	public ShoppingCart(Map<String,BookItem> bookItems){
		this.bookItems = bookItems;
	}
	public Map<String, BookItem> getBookItems() {
		return bookItems;
	}

	public void setBookItems(Map<String, BookItem> bookItems) {
		this.bookItems = bookItems;
	}
	
	
}
