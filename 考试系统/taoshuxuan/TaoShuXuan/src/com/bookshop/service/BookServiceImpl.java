package com.bookshop.service;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.bookshop.dao.BookDao;
import com.bookshop.entity.Book;
import com.bookshop.entity.Catagory;
import com.bookshop.util.MyServiceParent;
/**
 * 图书信息Service层实现类
 * @author Winds
 *
 */
public class BookServiceImpl extends MyServiceParent implements BookService {
	@Resource
	private BookDao bookDao;
	private String hql;
	
	/**
	 * 查找图书库存
	 */
	public int findInventory(String book_id) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="select b.storage_num from Book as b where b.book_id='"+book_id+"'";
		return (Integer)bookDao.find(hql, session);
	}

	/**
	 * 修改图书状态
	 */
	public boolean updateStatus(String book_id,int status) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="from Book as b where b.book_id='"+book_id+"'";
		Book b=(Book)bookDao.find(hql, session);
		if(b!=null){
			System.out.println(status);
			b.setStatus(status);
			bookDao.update(b, session);
		}
		return true;
	}

	/**
	 * 添加图书
	 */
	public boolean add(Book book,int catagory_id) {
		// TODO Auto-generated method stub
		session = getSession();
		Book b = new Book("add");
		b.setAuthor(book.getAuthor());
		System.out.println(book.getBook_image());
		b.setBook_image(book.getBook_image());
		hql="from Catagory as c where c.catagory_id='"+catagory_id+"'";
		Catagory c= (Catagory)bookDao.find(hql, session);
		b.setCatagory(c);
		b.setContent_summary(book.getContent_summary());
		b.setDiscount(1);	
		b.setDiscount_date(new Date());
		b.setIs_foreign(book.getIs_foreign());
		b.setIs_import(book.getIs_import());
		b.setIsbn(book.getIsbn());
		b.setName(book.getName());
		b.setPrice(book.getPrice());
		b.setPublish_company(book.getPublish_company());
		b.setPublish_date(book.getPublish_date());
		b.setSell_date(new Date());
		b.setStatus(0);
		b.setStorage_date(new Date());
		b.setStorage_num(book.getStorage_num());
		b.setTranslator(book.getTranslator());
		bookDao.save(b, session);
		return true;
	}

	/**
	 * 给图书打折
	 */
	public boolean updateDiscount(Book book) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Book as b where b.book_id='"+book.getBook_id()+"'";
		Book b = (Book)bookDao.find(hql, session);
		if(b!=null){
			b.setDiscount(book.getDiscount());
			b.setDiscount_date(new Date());
			bookDao.update(b, session);
			return true;
		}else
			return false;
	}

	/**
	 * 给图书添加库存
	 */
	public boolean updateStorage_num(String book_id,int storage_num) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Book as b where b.book_id='"+book_id+"'";
		Book b = (Book)bookDao.find(hql, session);
		if(b!=null){
			b.setStorage_num(b.getStorage_num()+storage_num);
			bookDao.update(b, session);
			return true;
		}else
			return false;
	}

	/**
	 * 获取图书
	 */
	public Book find(String book_id) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="from Book as b where b.book_id='"+book_id+"'";
		return (Book)bookDao.find(hql, session);
	}

	/**
	 * 修改图书
	 */
	public boolean update(Book book, int catagory_id) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Book as b where b.book_id='"+book.getBook_id()+"'";
		Book b = (Book)bookDao.find(hql, session);
		if(b!=null){
			b.setName(book.getName());
			if(book.getBook_image().length()>0){
				//删除原先的图书封面
				String savePath= ServletActionContext.getServletContext().getRealPath("/../BookImages/cover/"+b.getBook_image());
				savePath=savePath.replace("\\", "/");
				File imageFile=new File( savePath);
				if(imageFile!=null){
					imageFile.delete();
				}
				b.setBook_image(book.getBook_image());
			}
			b.setContent_summary(book.getContent_summary());
			b.setIsbn(book.getIsbn());
			b.setAuthor(book.getAuthor());
			b.setIs_import(book.getIs_import());
			b.setIs_foreign(book.getIs_foreign());
			System.out.println(book.getTranslator());
			if(book.getIs_foreign()==0){
				b.setTranslator(null);
			}else if(book.getIs_foreign()==1){
				b.setTranslator(book.getTranslator());
			}
			b.setPublish_company(book.getPublish_company());
			b.setPublish_date(book.getPublish_date());
			if(catagory_id!=0){
				hql="from Catagory as c where c.catagory_id='"+catagory_id+"'";
				Catagory c= (Catagory)bookDao.find(hql, session);
				b.setCatagory(c);
			}
			b.setPrice(book.getPrice());
			bookDao.update(b, session);
			return true;
		}else
			return false;
	}

	

}
