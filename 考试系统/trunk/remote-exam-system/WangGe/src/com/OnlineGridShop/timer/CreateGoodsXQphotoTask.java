package com.OnlineGridShop.timer;

import java.util.TimerTask;

import com.OnlineGridShop.util.FileUtil;

public class CreateGoodsXQphotoTask extends TimerTask {

	public CreateGoodsXQphotoTask(){
		
	}

	public void run() {
		
		// TODO Auto-generated method stub	
		try {
			//��ʱ���ͼƬ�Ļ���
			//���ɢ��ͼƬ
			FileUtil.delFolder(FileUtil.getScatteredGoodsXqPhotoPsth1());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("����������ʧ�ܣ�");
		}
		
	}
}
