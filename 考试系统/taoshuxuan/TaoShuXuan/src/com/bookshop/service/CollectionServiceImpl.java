package com.bookshop.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;

import com.bookshop.dao.BookDao;
import com.bookshop.dao.CollectionDao;
import com.bookshop.entity.Book;
import com.bookshop.entity.Collection;
import com.bookshop.entity.Customer;
import com.bookshop.util.MyServiceParent;
import com.bookshop.util.StringUtil;
/**
 * 收藏信息Service层实现类
 * @author Winds
 *
 */
public class CollectionServiceImpl extends MyServiceParent implements
		CollectionService {

	@Resource
	private CollectionDao collectionDao;
	@Resource
	private BookService bookService;
	@Resource
	private CustomerService customerService;
	private String hql;
	private Session session;
	
	@SuppressWarnings("unchecked")
	public List<Object> getHotCollection() {
		// TODO Auto-generated method stub
		this.session=this.getSession();
		hql="select b.book_id,b.name,b.book_image,b.price*b.discount,b.discount*100,count(c.book.book_id) as collection_num " +
				"from Collection as c inner join c.book as b where c.book.book_id=b.book_id " +
				"group by c.book.book_id order by collection_num desc";
		return (List<Object>)collectionDao.findHotCollection(hql, session, 12);
	}

	/**
	 * 分页数据中的各图书的收藏数
	 */
	public List<Long> findColletionNum(List<Collection> collection_l) {
		// TODO Auto-generated method stub
		List<Long> l=new ArrayList<Long>();
		this.session=this.getSession();
		if(collection_l!=null){
			for(Collection c : collection_l){ 
				hql="select count(*) from Collection as c where c.book.book_id='"+c.getBook().getBook_id()+"'";
				System.out.println(hql);
				l.add(myDaoParent.findCount_all(session, hql));
			}
		}		
		return l;
	}

	/**
	 * 删除会员图书收藏记录
	 */
	public boolean delete(String collection_id) {
		// TODO Auto-generated method stub
		this.session=this.getSession();
		hql="from Collection as c where c.collection_id='"+collection_id+"'";
		Collection c=(Collection)collectionDao.find(hql, session);
		collectionDao.dele(c, session);
		return true;
	}

	/**
	 * 批量删除会员图书收藏记录
	 */
	public boolean deleteBatch(String collectionIdStr) {
		// TODO Auto-generated method stub
		this.session=this.getSession();
		List<String> idList=StringUtil.getOption(collectionIdStr, ",");
		if(idList!=null){
			for(String id : idList){
				hql="from Collection as c where c.collection_id='"+id+"'";
				Collection c=(Collection)collectionDao.find(hql, session);
				collectionDao.dele(c, session);
			}
			return true;
		}else
			return false;
	}

	public int addToCollection(String book_id,String customer_email) {
		this.session=this.getSession();
		try{
			hql = "from Collection as c where c.book.book_id ='"+book_id+"' and c.customer.email = '"+customer_email+"'";
			Collection c=(Collection)collectionDao.find(hql, session);
			if(c!=null){
				return 0;
			}else{
				Book book = bookService.find(book_id);
				Customer customer = customerService.find(customer_email);
				Collection collection = new Collection("sb");
				collection.setBook(book);
				collection.setCollection_date(new Date());
				collection.setCustomer(customer);
				collection.setCollection_price(book.getPrice());
				collectionDao.save(collection, session);
				return 1;
			}
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
		
	}
	

}
