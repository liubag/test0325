package com.OnlineGridShop.util;

import com.OnlineGridShop.scattered.Entity.ScatteredGrid;
import com.OnlineGridShop.scattered.Entity.ScatteredGridAgreement;
import com.OnlineGridShop.scattered.Entity.ScatteredGridUser;

public class StatuChangeUtil {
	
	//1（正常）0（注销）,2(可修改状态：未过注册那天为准线)
	public static void accountStatuChange(ScatteredGridUser sguser,ScatteredGrid sg,ScatteredGridAgreement sga,String statu){
		sguser.setStatus(statu);
		sg.setStatus(statu);
		sga.setAccount_status(statu);
	}
}	
