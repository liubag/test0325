package com.OnlineGridShop.util;

import com.OnlineGridShop.scattered.Entity.ScatteredGrid;
import com.OnlineGridShop.scattered.Entity.ScatteredGridAgreement;
import com.OnlineGridShop.scattered.Entity.ScatteredGridUser;

public class StatuChangeUtil {
	
	//1��������0��ע����,2(���޸�״̬��δ��ע������Ϊ׼��)
	public static void accountStatuChange(ScatteredGridUser sguser,ScatteredGrid sg,ScatteredGridAgreement sga,String statu){
		sguser.setStatus(statu);
		sg.setStatus(statu);
		sga.setAccount_status(statu);
	}
}	
