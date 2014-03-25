package com.OnlineGridShop.timer;

import java.util.TimerTask;

import com.OnlineGridShop.util.FileUtil;

public class CreateGoodsXQphotoTask extends TimerTask {

	public CreateGoodsXQphotoTask(){
		
	}

	public void run() {
		
		// TODO Auto-generated method stub	
		try {
			//¶¨Ê±Çå³ýÍ¼Æ¬µÄ»º´æ
			//Çå³ýÉ¢×âÍ¼Æ¬
			FileUtil.delFolder(FileUtil.getScatteredGoodsXqPhotoPsth1());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("¼ì²â²Ù×÷¹ý³ÌÊ§°Ü£¡");
		}
		
	}
}
