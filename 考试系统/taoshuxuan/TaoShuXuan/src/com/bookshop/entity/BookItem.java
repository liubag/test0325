package com.bookshop.entity;

public class BookItem {
	private Book book;
	private int amount;
	public BookItem(){}
	public BookItem(Book book,int amount){
		this.book = book;
		this.amount = amount;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public float getTotal(){
		return this.book.getPrice() * this.amount;
	}
}
