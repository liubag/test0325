package com.bookshop.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.bookshop.dao.PaymentMethodDao;
import com.bookshop.entity.PaymentMethod;
import com.bookshop.util.MyServiceParent;
/**
 * 付款方式Service层实现类
 * @author Winds
 *
 */
public class PaymentMethodServiceImpl extends MyServiceParent implements
		PaymentMethodService {
	@Resource
	private PaymentMethodDao paymentMethodDao;
	private String hql;
	
	/**
	 * 根据支付名称查询
	 */
	public PaymentMethod find(String name) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="from PaymentMethod as pm where pm.name='"+name+"'";
		PaymentMethod pm = (PaymentMethod) paymentMethodDao.find(hql, session);
		return pm;
	}

	/**
	 * 添加支付方式
	 */
	public boolean add(PaymentMethod paymentMethod) {
		// TODO Auto-generated method stub
		session = getSession();
		paymentMethod.setCreate_date(new Date());
		paymentMethodDao.save(paymentMethod, session);
		return true;
	}

	/**
	 * 修改支付方式
	 */
	public boolean update(PaymentMethod paymentMethod) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="from PaymentMethod as pm where pm.payment_method_id='"+paymentMethod.getPayment_method_id()+"'";
		PaymentMethod pm = (PaymentMethod) paymentMethodDao.find(hql, session);
		if(pm!=null){
			pm.setName(paymentMethod.getName());
			paymentMethodDao.update(pm, session);
		}
		return true;
	}
	
	/**
	 * 查看支付方式有没有使用
	 * @return
	 */
	public boolean findPaymentMethod_use(int id) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="select count(*) from Order as o where o.paymentMethod.payment_method_id='"+id+"'";
		if(myDaoParent.findCount_all(session, hql)>0){
			return true;
		}else
			return false;
	}

	/**
	 * 删除支付方式
	 */
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="from PaymentMethod as pm where pm.payment_method_id='"+id+"'";
		PaymentMethod pm = (PaymentMethod) paymentMethodDao.find(hql, session);
		paymentMethodDao.dele(pm, session);
		return true;
	}

	@SuppressWarnings("unchecked")
	public List<PaymentMethod> findAll() {
		try{
			session = getSession();
			hql="from PaymentMethod";
			return (List<PaymentMethod>)paymentMethodDao.findAll(hql, session);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 根据ID获取支付方式
	 */
	public PaymentMethod findById(int payment_method_id){
		session = getSession();
		hql="from PaymentMethod as pm where pm.payment_method_id='"+payment_method_id+"'";
		PaymentMethod pm = (PaymentMethod) paymentMethodDao.find(hql, session);
		return pm;
	}
		
	
	
}
