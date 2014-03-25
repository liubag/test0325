package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Book;
import com.bookshop.entity.BookItem;
import com.bookshop.entity.ShoppingCart;

public interface ShoppingCartService {
	/**
	 * 把图书加入购物车
	 * @param shoppingCart
	 * @param book
	 * @return
	 */
	public boolean addBookToCart( ShoppingCart shoppingCart,Book book ,int num);
	/**
	 * 从购物车中删除图书
	 * @param shoppingCart
	 * @param book
	 * @return
	 */
	public boolean removeBookToCart(ShoppingCart shoppingCart,Book book);
	/**
	 * 获取购物车中的图书列表
	 * @param shoppingCart
	 * @return
	 */
	public List<BookItem> getBookFromCart(ShoppingCart shoppingCart);
	/**
	 * 更新购物车中某本图书的数量
	 * @param shoppingCart
	 * @param book
	 * @param amount
	 * @return
	 */
	public boolean updateBookAmountToCart(ShoppingCart shoppingCart,Book book,int amount);
	
	/**
	 * 计算购物车里物品的总额
	 * @param price
	 * @param discount
	 * @param amount
	 * @return
	 */
	public float countTotal(List<BookItem> bookItems);
}
