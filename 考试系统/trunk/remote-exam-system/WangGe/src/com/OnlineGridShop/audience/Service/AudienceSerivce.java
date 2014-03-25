package com.OnlineGridShop.audience.Service;

import java.util.List;

import com.OnlineGridShop.audience.Entity.Audience;

public interface AudienceSerivce {
	public boolean save(Audience audience);
	public Audience find(String id);
	public Audience find_nickname(String audience_nickname);
	public Audience find_idcard(String audience_idcard);
	public int login(String audience_studentid , String audience_pw);  //1���ɹ� ��0 ���������-1���û�������
	public boolean update_exceptPw(Audience audience);   //���²���������
	public boolean updataPw(String audience_nickname,String oldPw,String newPw); //�޸�����
	public boolean updateIdcardAndTruename(Audience audience);//�޸����֤����ʵ����
	public void dele(String audience_nickname); 
	public int findAllAudiencePages();  //��ѯҳ��
	public long findAllAudienceCount();
	public List<Audience> showAudience_by_page(int page);  //����ҳ������
	public Integer findPoints(String audience_nickname);  //�����
	/**
	 * ע����Ա
	 * @param id
	 * @return
	 */
	public boolean AudienceCancel(String id);//ע����Ա
	/**
	 * �����Ա
	 * @param id
	 * @return
	 */
	public boolean AudienceActive(String id);// �����Ա
	
}
