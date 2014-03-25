package com.OnlineGridShop.util;

public enum YeJIXuanZhe {
	WEEK("['星期日','星期一', '星期二', '星期三', '星期四', '星期五', '星期六']"),   //按周
	MOUTH("['1日','2日', '3日', '4日', '5日', '6日', '7日','8日', '9日', '10日', '11日', '12日', '13日','14日', '15日', '16日', '17日', '18日', '19日','20日', '21日', '22日', '23日', '24日', '25日','26日', '27日', '28日', '29日', '30日', '31日']"),  //按月  
	YEAR("['1月','2月', '3月', '4月', '5月', '6月', '7月','8月', '9月', '10月', '11月', '12月']");    //按年
	private String value;
	YeJIXuanZhe(String value){
		this.value = value;
	}
	public String getValue() {
		return value;
	}
}
