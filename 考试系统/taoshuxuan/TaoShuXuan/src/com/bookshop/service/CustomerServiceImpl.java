package com.bookshop.service;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bookshop.dao.CustomerDao;
import com.bookshop.entity.Customer;
import com.bookshop.util.CryptoUtils;
import com.bookshop.util.MyAuthenticator;
import com.bookshop.util.MyServiceParent;
import com.opensymphony.xwork2.ActionContext;
/**
 * 会员信息Service层实现类
 * @author Winds
 *
 */
public class CustomerServiceImpl extends MyServiceParent implements
		CustomerService {
	@Resource
	private CustomerDao customerDao;
	private String hql;
	/**
	 * 用户登录
	 */
	public boolean login(String email,String pw){
		this.session=getSession();
		String pw_k=CryptoUtils.getEncryptPwd(pw);
		hql="from Customer as c where c.email='"+email+"' " +
				"and c.pw='"+pw_k+"' and c.status=1";
		if(customerDao.find(hql,session)!=null)
		{
				return true;
		}else{
			return false;
		}
	}
	/**
	 * 
	 * 改变会员的状态
	 */
	public int updateState(String email) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Customer as c where c.email='"+email+"'";
		Customer c = (Customer)customerDao.find(hql, session);
		if(c!=null){
			if(c.getStatus()==1){
				c.setStatus(0);
			}else if(c.getStatus()==0){
				c.setStatus(1);
			}			
			customerDao.update(c, session);
			return c.getStatus();
		}else
			return -1;
	}

	/**
	 * 查找会员信息
	 */
	public Customer find(String email) {
		// TODO Auto-generated method stub
		this.session=getSession();
		hql="from Customer as c where c.email='"+email+"'";
		return (Customer)customerDao.find(hql, session);
	}

	public int findPages(int perFolioAmount, String entityName, String parameter) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		int pagenum;
		hql="select count(*) from "+entityName + " as entity where entity.customer.email ='"+parameter+"'";
		Long num1 = myDaoParent.findCount_all(session, hql);
		int num = num1.intValue();
		pagenum = num/perFolioAmount;
		num = num%perFolioAmount;
		if(num>0){
			pagenum++;
		}
		return pagenum;
	}

	public Long hasNumbers(String entityName, String parameter) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		hql="select count(*) from "+entityName +" as entity where entity.customer.email ='"+parameter+"'";	
		return myDaoParent.findCount_all(session, hql);
	}

	public List<?> show_by_page(int page, int perFolioAmount,
			String entityName, String parameter) {
		// TODO Auto-generated method stub
		this.session=this.getSession();	
		hql="from "+entityName+ " as entity where entity.customer.email ='"+parameter+"'";
		return myDaoParent.show_by_page_all( page, perFolioAmount, session, hql);
	}
	public boolean save(Customer customer) {
		// TODO Auto-generated method stub
		this.session=getSession();
		customer.setStatus(2);
		customer.setJoin_date(new Date());
		customerDao.save(customer, session);
		return true;
	}
	public boolean check_email(String email) {
		// TODO Auto-generated method stub
		this.session =getSession();
		if(this.find(email)==null){
			return true;
		}
		return false;
	}
	public void sendEmail(String email,HttpSession httpSession) {
		String toMail = email;
        String userName = "a3838049@163.com";  
        String password = "liuhongji3838049";  
        String url = "http://localhost:8080/TaoShuXuan/activityCustomer.do?customer.email=" + toMail;//待会用户点在邮箱中点击这个链接回到你的网站。  
        httpSession.setMaxInactiveInterval(600);  
          
        Properties props = new Properties();  
        props.setProperty("mail.smtp.host", "smtp.163.com");  
        props.setProperty("mail.smtp.auth", "true");  
          
        Authenticator authenticator = new MyAuthenticator(userName, password);  
          
        javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,authenticator);  
        session.setDebug(true);  
          
        try{  
            Address from = new InternetAddress(userName);  
            Address to = new InternetAddress(toMail);  
              
            MimeMessage msg = new MimeMessage(session);  
            msg.setFrom(from);  
            msg.setSubject("淘书轩注册");  
            msg.setSentDate(new Date());  
            msg.setContent("淘书轩注册"+"<a href='" + url + "'>点击" + url + "完成注册</a>", "text/html;charset=utf-8");  
            msg.setRecipient(RecipientType.TO, to);  
            /* 
            Transport transport = session.getTransport("smtp"); 
            transport.connect("smtp.163.com", userName, password); 
            transport.sendMessage(msg,msg.getAllRecipients()); 
            transport.close(); 
            */  
            Transport.send(msg);  
        } catch(MessagingException e){  
            e.printStackTrace();  
        }  

		
	}
	public boolean activityCustomer(String email) {
		// TODO Auto-generated method stub
		session=getSession();
		Customer c =find(email);
		if(c!=null && c.getStatus()==2){
			c.setStatus(1);
			customerDao.update(c, session);
			return true;
		}
		
			return false;
	}
	
	
}
