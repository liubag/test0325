package com.OnlineGridShop.util;

public enum MyStringAppConfigs {
	enroll_success("ע��ɹ���"),
	nickname_repeat("���ǳ��Ѿ�ע�����"),
	update_audiencec_info_fail("�޸Ļ�Ա��Ϣ����"),
	update_audiencec_info_success("�޸Ļ�Ա��Ϣ�ɹ���"),
	login_success("��¼�ɹ���"),
	pw_error("����ȷ�����˺ź����룡"),
	user_null("����ȷ�����˺ź����룡"),
	user_cancel("�û��Ѿ������ã�����ϵ�ͷ���"),
	user_logout("�˺��ѹ��ڣ�"),
	updataPw_success("�޸�����ɹ���"),
	updataPw_fail("ԭ�������"),
	idcard_repeat("�����֤��ע�����"),
	truename_repeat("��������ע�����"),
	show_audience_info_fail("��ʾ�û���Ϣʧ�ܣ�"),
	updata_success("������Ϣ�ɹ���"),
	gridname_repeat("�ø�������ע�ᣡ"),
	gridtype_repeat("���������Ѿ����ڣ�"),
	dele_gridtyp_fail("ɾ����������ʧ�ܣ�"),
	canshowgoods_repeat("�����������������Ѿ����ڣ�"),
	username_repeat("���û����Ѿ�ע�ᣡ"),
	username_success("����ʹ�ã�"),
	rendtype_repeat("�������ͣ�"),
	months_repeat("�ó�������ʱ���Ѵ��ڣ�"),
	amount_relating("�ø���������ʹ�ø��Ӵ��ڣ�����ɾ����"),
	goodsType_repeat("����Ʒ�����Ѿ����ڣ�"),
	goodsName_repeat("����Ʒ�����Ѿ����ڣ�"),
	upload_fail("�ϴ�ʧ�ܣ�"),
	undercarriage_fail("����Ʒ �����ڻ����Ѿ��¼��ˣ�"),
	putaway_fail("����Ʒ�����ڻ����Ѿ��ϼ��ˣ�"),
	todayHasSendPreferential("�����Ѿ������������Ż��ˣ�"),
	preferential_id_fail("���������"),
	dele_goods_fail("ɾ����Ʒ�����г���"),
	rollback_fail("�ع�ʧ�ܣ�"),
	UPLOAD_PHOTO_FAIL("�ϴ�����ʧ�ܣ�"),
	UPLOAD_PHOTO_PLACEFULLY("��ʹ�ÿռ�������"),
	
	brandgridname_repeat("��Ʒ�Ƶ��Ѿ�����"),
	brandgridownername_repeat("���������Ѿ�����"),
	brandgridownerusername_repeat("��¼���Ѿ�����"),
	brandgrid_xuyue_fail("Ʒ�Ƶ��ѹ��ڣ�"),
	
	add_audience_success("������Ա�ɹ�."),
	add_audience_fail("������Աʧ��."),
	
	ip_fail("�õ���δ�����������¼����"),
	ip_null("����δ�󶨵�¼���ԣ�");
	

	private String value;
	MyStringAppConfigs(String value){
		this.value = value;
	}
	public String getValue() {
		return value;
	}
	
}
