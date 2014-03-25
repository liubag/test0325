package com.bookshop.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.bookshop.dao.CommentDao;
import com.bookshop.util.MyServiceParent;
/**
 * 评论信息Service层实现类
 * @author Winds
 *
 */
public class CommentServiceImpl extends MyServiceParent implements
		CommentService {
	@Resource
	private CommentDao commentDao;
	private String hql;
	/**
	 * 查找图书评论数和各星评论数
	 */
	public List<Integer> findStarList(String book_l) {
		// TODO Auto-generated method stub
		System.out.println(book_l);
		this.session=getSession();
		List<Integer> l = new ArrayList<Integer>();
		hql="select count(*) from Comment as c where c.book.book_id='"+book_l+"'";
		l.add(myDaoParent.findCount_all(session, hql).intValue());
		for(int i=1;i<=5;i++){
			hql="select count(*) from Comment as c where c.score='"+i+"' and c.book.book_id='"+book_l+"'";
			l.add(myDaoParent.findCount_all(session, hql).intValue());
		}
		return l;
	}
	
}
