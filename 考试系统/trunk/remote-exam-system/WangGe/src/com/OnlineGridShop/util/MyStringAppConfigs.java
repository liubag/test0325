package com.OnlineGridShop.util;

public enum MyStringAppConfigs {
	enroll_success("注册成功！"),
	nickname_repeat("该昵称已经注册过！"),
	update_audiencec_info_fail("修改会员信息出错！"),
	update_audiencec_info_success("修改会员信息成功！"),
	login_success("登录成功！"),
	pw_error("请正确输入账号和密码！"),
	user_null("请正确输入账号和密码！"),
	user_cancel("用户已经被禁用！请联系客服。"),
	user_logout("账号已过期！"),
	updataPw_success("修改密码成功！"),
	updataPw_fail("原密码错误！"),
	idcard_repeat("该身份证已注册过！"),
	truename_repeat("该姓名已注册过！"),
	show_audience_info_fail("显示用户信息失败！"),
	updata_success("更新信息成功！"),
	gridname_repeat("该格子名已注册！"),
	gridtype_repeat("格子类型已经存在！"),
	dele_gridtyp_fail("删除格子类型失败！"),
	canshowgoods_repeat("该容纳数量的类型已经存在！"),
	username_repeat("该用户名已经注册！"),
	username_success("可以使用！"),
	rendtype_repeat("出租类型！"),
	months_repeat("该出租类型时间已存在！"),
	amount_relating("该格子类型有使用格子存在，不可删除！"),
	goodsType_repeat("该商品类型已经存在！"),
	goodsName_repeat("该商品名称已经存在！"),
	upload_fail("上传失败！"),
	undercarriage_fail("该商品 不存在或者已经下架了！"),
	putaway_fail("该商品不存在或者已经上架了！"),
	todayHasSendPreferential("今天已经发布过最新优惠了！"),
	preferential_id_fail("错误操作！"),
	dele_goods_fail("删除商品过程中出错！"),
	rollback_fail("回滚失败！"),
	UPLOAD_PHOTO_FAIL("上传操作失败！"),
	UPLOAD_PHOTO_PLACEFULLY("可使用空间已满！"),
	
	brandgridname_repeat("该品牌店已经存在"),
	brandgridownername_repeat("法人名称已经存在"),
	brandgridownerusername_repeat("登录名已经存在"),
	brandgrid_xuyue_fail("品牌店已过期！"),
	
	add_audience_success("新增会员成功."),
	add_audience_fail("新增会员失败."),
	
	ip_fail("该电脑未经店主允许登录管理！"),
	ip_null("店主未绑定登录电脑！");
	

	private String value;
	MyStringAppConfigs(String value){
		this.value = value;
	}
	public String getValue() {
		return value;
	}
	
}
