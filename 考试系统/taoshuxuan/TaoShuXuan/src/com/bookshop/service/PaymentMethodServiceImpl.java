package com.bookshop.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import com.bookshop.dao.PaymentMethodDao;
import com.bookshop.entity.PaymentMethod;
import com.bookshop.util.MyServiceParent;
/**
 * ���ʽService��ʵ����
 * @author Winds
 *
 */
public class PaymentMethodServiceImpl extends MyServiceParent implements
		PaymentMethodService {
	@Resource
	private PaymentMethodDao paymentMethodDao;
	private String hql;
	
	/**
	 * ����֧�����Ʋ�ѯ
	 */
	public PaymentMethod find(String name) {
		// TODO Auto-generated method stub
		session = getSession();
		hql="from PaymentMethod as pm where pm.name='"+name+"'";
		PaymentMethod pm = (PaymentMethod) paymentMethodDao.find(hql, session);
		return pm;
	}

	/**
	 * ���֧����ʽ
	 */
	public boolean add(PaymentMethod paymentMethod) {
		// TODO Auto-generated method stub
		session = getSession();
		paymentMethod.setCreate_date(new Date());
		paymentMethodDao.save(paymentMethod, session);
		return true;
	}

	/**
	 * �޸�֧����ʽ
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
	 * �鿴֧����ʽ��û��ʹ��
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
	 * ɾ��֧����ʽ
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
	 * ����ID��ȡ֧����ʽ
	 */
	public PaymentMethod findById(int payment_method_id){
		session = getSession();
		hql="from PaymentMethod as pm where pm.payment_method_id='"+payment_method_id+"'";
		PaymentMethod pm = (PaymentMethod) paymentMethodDao.find(hql, session);
		return pm;
	}
		
	
	
}
