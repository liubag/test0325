package com.bookshop.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.Comment;
import com.bookshop.service.CommentService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * ������ϢAction��
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class CommentAction extends ActionSupport {
	@Resource
	private CommentService commentService;
	private Comment comment;
	private String book_id;
	private List<Integer> starList; //starList.get(0):���ۼ�¼����  1:1�������� 2:2�������� 3:3�������� 4:4�������� 5:5��������
	private List<Comment> comment_l;
	
	/**
	 * ��ȡͼ�������
	 * @return
	 */
	public void findComment(){
		try{
			String[] parms = new String[]{"book.book_id"};
			String[] values = new String[]{book_id};
			this.starList=commentService.findStarList(book_id);
			this.comment_l=(List<Comment>)commentService.show_by_page(1, 5, "Comment", parms, values, false);
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("starList", starList);
			request.setAttribute("comment_l", comment_l);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public List<Integer> getStarList() {
		return starList;
	}
	public void setStarList(List<Integer> starList) {
		this.starList = starList;
	}
	public List<Comment> getComment_l() {
		return comment_l;
	}
	public void setComment_l(List<Comment> comment_l) {
		this.comment_l = comment_l;
	}
}
