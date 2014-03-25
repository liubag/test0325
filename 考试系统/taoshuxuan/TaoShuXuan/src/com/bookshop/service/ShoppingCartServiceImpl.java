package com.bookshop.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bookshop.entity.Book;
import com.bookshop.entity.BookItem;
import com.bookshop.entity.ShoppingCart;
import com.bookshop.util.MyServiceParent;

public class ShoppingCartServiceImpl extends MyServiceParent implements ShoppingCartService{
	private Map <String,BookItem> bookItems;
	public boolean addBookToCart( ShoppingCart shoppingCart,Book book,int num) {
		String book_id =book.getBook_id();
		bookItems = shoppingCart.getBookItems();
		if(bookItems.containsKey(book_id)){
			BookItem bookItem=(BookItem)bookItems.get(book_id);
			bookItem.setAmount(bookItem.getAmount()+num);
		}else{
			bookItems.put(book_id, new BookItem(book,num));
		}
		return true;
	}

	public List<BookItem> getBookFromCart(ShoppingCart shoppingCart) {
		bookItems = shoppingCart.getBookItems();
		List<BookItem> bookItemList = new ArrayList<BookItem>();
		for(String s :bookItems.keySet()){
			bookItemList.add(bookItems.get(s));
		}
		return bookItemList;
	}

	public boolean removeBookToCart(ShoppingCart shoppingCart, Book book) {
		String book_id =book.getBook_id();
		bookItems = shoppingCart.getBookItems();
		if(bookItems.containsKey(book_id)){
			bookItems.remove(book_id);
			return true;
		}else{
			return false;
		}
	}
	public boolean updateBookAmountToCart(ShoppingCart shoppingCart,Book book,int amount) {
		String book_id =book.getBook_id();
		bookItems = shoppingCart.getBookItems();
		if(bookItems.containsKey(book_id)){
			BookItem bookItem=(BookItem)bookItems.get(book_id);
			bookItem.setAmount(amount);
			bookItems.put(book_id, bookItem);
			return true;
		}else{
			return false;
		}
	}
	public float countTotal(List<BookItem> bookItems){
		float totalAccount = 0;
		for (BookItem bookItem : bookItems){
			totalAccount += bookItem.getBook().getPrice()*bookItem.getBook().getDiscount()*bookItem.getAmount();
		}
		return totalAccount;
	}

	
	
}
