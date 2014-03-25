package com.bookshop.service;

import java.util.List;

import com.bookshop.entity.Book;
import com.bookshop.entity.BookItem;
import com.bookshop.entity.ShoppingCart;

public interface ShoppingCartService {
	/**
	 * ��ͼ����빺�ﳵ
	 * @param shoppingCart
	 * @param book
	 * @return
	 */
	public boolean addBookToCart( ShoppingCart shoppingCart,Book book ,int num);
	/**
	 * �ӹ��ﳵ��ɾ��ͼ��
	 * @param shoppingCart
	 * @param book
	 * @return
	 */
	public boolean removeBookToCart(ShoppingCart shoppingCart,Book book);
	/**
	 * ��ȡ���ﳵ�е�ͼ���б�
	 * @param shoppingCart
	 * @return
	 */
	public List<BookItem> getBookFromCart(ShoppingCart shoppingCart);
	/**
	 * ���¹��ﳵ��ĳ��ͼ�������
	 * @param shoppingCart
	 * @param book
	 * @param amount
	 * @return
	 */
	public boolean updateBookAmountToCart(ShoppingCart shoppingCart,Book book,int amount);
	
	/**
	 * ���㹺�ﳵ����Ʒ���ܶ�
	 * @param price
	 * @param discount
	 * @param amount
	 * @return
	 */
	public float countTotal(List<BookItem> bookItems);
}
