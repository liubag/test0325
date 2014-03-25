package com.OnlineGridShop.aahome.serivce;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.OnlineGridShop.aahome.Dao.AahomeDao;
import com.OnlineGridShop.aahome.JsonClass.JsonGoods;
import com.OnlineGridShop.aahome.JsonClass.JsonP;
import com.OnlineGridShop.brand.Entity.Brandgrid;
import com.OnlineGridShop.brand.Entity.BrandgridGoods;
import com.OnlineGridShop.brand.Entity.BrandgridPreferential;
import com.OnlineGridShop.scattered.Entity.ScatteredGridGoods;
import com.OnlineGridShop.scattered.Entity.ScatteredGridPreferential;
import com.OnlineGridShop.util.FileUtil;
import com.OnlineGridShop.util.MySerivceParent;
@SuppressWarnings("unchecked")
public class AahomeSerivceImpl extends MySerivceParent implements AahomeSerivce {

	@Resource
	private AahomeDao aahomeDao;
	
	public Map<String, List> showHome_aa() {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		Map<String, List> map = new HashMap<String, List>();
		int page = 1;
		int bperFolioAmount_g = 10;
		int sperFolioAmount_g = 10;
		int bperFolioAmount_p = 10;
		int sperFolioAmount_p = 10;
		String hql = "from BrandgridGoods bgg where bgg.status='5' order by bgg.LZ_datetime desc";
		List<BrandgridGoods> brandGoods_l = (List<BrandgridGoods>) this.aahomeDao.show_by_page_all(new ArrayList(), page, bperFolioAmount_g, session, hql);
		List<JsonGoods> js_bg = new ArrayList<JsonGoods>();
		for(BrandgridGoods bgg : brandGoods_l){
			JsonGoods jsg = new JsonGoods();
			jsg.setGoods_id(bgg.getBrandgrid_goods_id());
			jsg.setGoods_name(bgg.getGoods_name());
			jsg.setGoods_price(Float.toHexString(bgg.getGoods_price()));
			jsg.setOwner("[" + bgg.getBrandgrid().getBrandgrid_name() + bgg.getBrandgridGridOwner().getGrid_name() + "]");
			String zk = "";
			if(bgg.getGoods_ZK()!=10){
				zk = Float.toHexString(bgg.getGoods_ZK());
			}
			jsg.setZk(zk);
			js_bg.add(jsg);
		}
		map.put("brandGoods_l", js_bg);
		
		hql = "from ScatteredGridGoods sgg where sgg.Status='1' order by sgg.LZ_datetime desc";
		List<ScatteredGridGoods> scatteredGoods_l = (List<ScatteredGridGoods>) this.aahomeDao.show_by_page_all(new ArrayList(), page, sperFolioAmount_g, session, hql);
		List<JsonGoods> js_sg = new ArrayList<JsonGoods>();
		for(ScatteredGridGoods sgg : scatteredGoods_l){
			JsonGoods jsg = new JsonGoods();
			jsg.setGoods_id(sgg.getGoods_id());
			jsg.setGoods_name(sgg.getGoods_name());
			jsg.setGoods_price(Float.toHexString(sgg.getGoods_price()));
			jsg.setOwner("[" + sgg.getScatteredGrid().getGrid_name() + "]");
			jsg.setZk("");
			js_sg.add(jsg);
		}
		map.put("scatteredGoods_l", js_sg);
		
		hql = "from BrandgridPreferential bgp where bgp.sure_status='7' order by bgp.LZ_datetime desc";
		List<BrandgridPreferential> brandP_l = (List<BrandgridPreferential>) this.aahomeDao.show_by_page_all(new ArrayList(), page, bperFolioAmount_p, session, hql);
		List<JsonP> js_bp = new ArrayList<JsonP>();
		for(BrandgridPreferential bgp : brandP_l){
			JsonP js_p = new JsonP();
			js_p.setOwner("[" + bgp.getBrandgrid().getBrandgrid_name() + bgp.getBrandgridGridOwner().getGrid_name() + "]");
			js_p.setP_id(bgp.getBrandgrid_preferential_id());
			String text = bgp.getBrandgrid_preferential();
			if(bgp.getBrandgrid_qcStatus().equals("1")){
				text = text + "{[全场优惠:" + bgp.getBrandgrid_qcZK() + "]}";
			}else if(bgp.getBrandgrid_zhekou().length() > 0){
				text = text + "{[" + bgp.getBrandgrid_zhekou() + "]}";
			}
			js_p.setP_text(text);
			js_bp.add(js_p);
		}
		map.put("brandP_l", js_bp);
		hql = "from ScatteredGridPreferential sgp where sgp.status='1' order by sgp.LZ_datetime desc";
		List<ScatteredGridPreferential> scatteredP_l = (List<ScatteredGridPreferential>) this.aahomeDao.show_by_page_all(new ArrayList(), page, sperFolioAmount_p, session, hql);
		List<JsonP> js_sp = new ArrayList<JsonP>();
		for(ScatteredGridPreferential sgp : scatteredP_l){
			JsonP js_p = new JsonP();
			js_p.setOwner("[" + sgp.getScatteredGrid().getGrid_name() + "]");
			js_p.setP_id(sgp.getId());
			js_p.setP_text(sgp.getPreferential_text());
			js_sp.add(js_p);
		}
		map.put("scatteredP_l", js_sp);
		return map;
	}

	public List<Long> hasGoods(Integer typeId, String filterType) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		List<Long> l = new ArrayList<Long>();
		String hql = "";
		if(filterType.equals("brand")){
			hql = "select count(*) from BrandgridGoods bgg where bgg.goodsType.id='" + typeId + "' and bgg.status='5'";
			l.add(aahomeDao.findCount_all(session, hql));
		}else if(filterType.equals("scattered")){
			hql = "select count(*) from ScatteredGridGoods sgg where sgg.goods_type_id='" + typeId + "' and sgg.Status='1'";
			l.add(aahomeDao.findCount_all(session, hql));
		}else{
			hql = "select count(*) from BrandgridGoods bgg where bgg.goodsType.id='" + typeId + "' and bgg.status='5'";
			l.add(aahomeDao.findCount_all(session, hql));
			hql = "select count(*) from ScatteredGridGoods sgg where sgg.goods_type_id='" + typeId + "' and sgg.Status='1'";
			l.add(aahomeDao.findCount_all(session, hql));
		}
		return l;
	}


	public List<List<?>> showGoods_by_page(Integer typeId, int page,
			int perFolioAmount, String filterType, String showType) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		List<List<?>> l = new ArrayList<List<?>>();
		String hql = "";
		String orderBy = "";
		if(showType.equals("LZ_time")){
			orderBy = "LZ_datetime desc";
		}else if(showType.equals("upload_time")){
			orderBy = "put_time desc";
		}else if(showType.equals("money_up")){
			orderBy = "goods_price asc";
		}else if(showType.equals("money_down")){
			orderBy = "goods_price desc";
		}else if(showType.equals("hot")){
//			orderBy = "hot desc";
		}
		if(filterType.equals("brand")){
			hql = "from BrandgridGoods bgg where bgg.goodsType.id='" + typeId + "' and bgg.status='5' order by bgg." + orderBy;
			l.add(aahomeDao.show_by_page_all(new ArrayList(), page, perFolioAmount, session, hql));
		}else if(filterType.equals("scattered")){
			hql = "from ScatteredGridGoods sgg where sgg.goods_type_id='" + typeId + "' and sgg.Status='1' order by sgg." + orderBy;
			l.add(aahomeDao.show_by_page_all(new ArrayList(), page, perFolioAmount, session, hql));
		}else{
			hql = "from BrandgridGoods bgg where bgg.goodsType.id='" + typeId + "' and bgg.status='5' order by bgg." + orderBy;
			l.add(aahomeDao.show_by_page_all(new ArrayList(), page, perFolioAmount, session, hql));
			hql = "from ScatteredGridGoods sgg where sgg.goods_type_id='" + typeId + "' and sgg.Status='1' order by sgg." + orderBy;
			l.add(aahomeDao.show_by_page_all(new ArrayList(), page, perFolioAmount, session, hql));
		}
		return l;
	}

	public Long showAllGrid_aa(String filterType) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		String hql = "";
		if(filterType.endsWith("brand")){
			hql = "select count(*) from Brandgrid bg where bg.brandgrid_status='1'";
			return this.aahomeDao.findCount_all(session, hql);
		}else if(filterType.endsWith("scattered")){
			hql = "select count(*) from ScatteredGrid sg where sg.status='1'";
			return this.aahomeDao.findCount_all(session, hql);
		}
		return new Long(0);
	}

	public List<?> showGoods_by_page(int page, int perFolioAmount,
			String filterType) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		String hql = "";
		if(filterType.endsWith("brand")){
			hql = "from Brandgrid bg where bg.brandgrid_status='1' order by bg.brandgrid_newtime desc";
			return this.aahomeDao.show_by_page_all(new ArrayList(), page, perFolioAmount, session, hql);
		}else if(filterType.endsWith("scattered")){
			hql = "from ScatteredGrid sg where sg.status='1' order by sg.scatteredGridAgreement.rendtype_starttime desc";
			return this.aahomeDao.show_by_page_all(new ArrayList(), page, perFolioAmount, session, hql);
		}
		return null;
	}

	public Long showAllBgGrid_aa(String brandgridId) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		String hql = "select count(*) from BrandgridGrid bgg where bgg.brandgrid.brandgrid_id='" + brandgridId + "'";
		return this.aahomeDao.findCount_all(session, hql);
	}

	public List showBgGrid_by_page(int page, int perFolioAmount,
			String brandgridId) {
		// TODO Auto-generated method stub
		this.session = this.getSession();
		List l_l = new ArrayList();
		String hql = "from Brandgrid bg where bg.brandgrid_id='" + brandgridId + "'";
		Brandgrid bgg = (Brandgrid) this.aahomeDao.find(hql, session);
		if(bgg==null){
			return l_l;
		}
		l_l.add(bgg);
		hql = "from BrandgridGrid bgg where bgg.brandgrid.brandgrid_id='" + brandgridId + "' order by bgg.brandgrid_grid_number asc";
		l_l.add(this.aahomeDao.show_by_page_all(new ArrayList(), page, perFolioAmount, session, hql));
		return l_l;
	}

	public String showToUpdata_aa() {
		// TODO Auto-generated method stub
		String str = FileUtil.showToUpdata_aa();
		String start = "<!--start-->";
		String end = "<!--end-->";
		str = str.substring(str.indexOf(start), str.indexOf(end));
		//替换img src路径
		StringBuilder str_b = new StringBuilder(str);
		HttpServletRequest request = (HttpServletRequest)ServletActionContext.getRequest();
		String beforeStr = "${pageContext.request.contextPath}";
		String afterStr = request.getContextPath();
		str = FileUtil.changeInfo(str_b, beforeStr, afterStr).toString();
		return str;
	}

	/*private String mytime;  //li_id
	private String add_type;  //目前分为：add(往下插入)，add_up（往上插入）
	private String li_id;   //参考物
	private String add;  //目前分为：1,2,3
	 * (non-Javadoc)
	 * @see com.OnlineGridShop.aahome.serivce.AahomeSerivce#addGuangGao_aa(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.util.List, java.util.List)
	 */
	public boolean addGuangGao_aa(String mytime, String addType, String liId, String add,
			List<File> file, List<String> href) {
		// TODO Auto-generated method stub
		if(file.size() == 0 || href.size() == 0 || file.size() != href.size()){
			return false;
		}
		String ggaoStr = "";
		List<String> rname = new ArrayList<String>();
		//制定广告位
		if(add.equals("1")){
			rname.add(mytime);
			ggaoStr = "\n<li class=\"ggao\" id=\""+ add +mytime+"\">\n" + 
				"<div style=\"left:0; top:0; width:780px; height:380px;\"><a href=\"" + href.get(0) +"\" target=\"_blank\"><img src=\"${pageContext.request.contextPath}/../WGPhoto/guanggao_img/"+mytime+".jpg\"/></a></div>\n</li>\n";
		}else if(add.equals("2")){
			for(int i = 1;i<=href.size();i++){
				rname.add(mytime + i);
			}
			ggaoStr = "\n<li class=\"ggao\" id=\""+ add + mytime +"\">\n";
			ggaoStr = ggaoStr + "<div style=\"left:0; top:0; width:560px; height:380px;\"><a href=\""+href.get(0)+"\" target=\"_blank\"><img src=\"${pageContext.request.contextPath}/../WGPhoto/guanggao_img/"+rname.get(0)+".jpg\" /></a></div>\n";
			ggaoStr = ggaoStr + "<div style=\"right:0; top:0; width:220px; height:140px;\"><a href=\""+href.get(1)+"\" target=\"_blank\"><img src=\"${pageContext.request.contextPath}/../WGPhoto/guanggao_img/"+rname.get(1)+".jpg\" /></a></div>\n";
			ggaoStr = ggaoStr + "<div style=\"right:0; top:140px; width:220px; height:140px;\"><a href=\""+href.get(2)+"\" target=\"_blank\"><img src=\"${pageContext.request.contextPath}/../WGPhoto/guanggao_img/"+rname.get(2)+".jpg\" /></a></div>\n";
			ggaoStr = ggaoStr + "<div style=\"right:0; bottom:0; width:220px; height:100px;\"><a href=\""+href.get(3)+"\" target=\"_blank\"><img src=\"${pageContext.request.contextPath}/../WGPhoto/guanggao_img/"+rname.get(3)+".jpg\" /></a></div>\n";
			ggaoStr = ggaoStr + "</li>";
		}else if(add.equals("3")){
			for(int i = 1;i<=href.size();i++){
				rname.add(mytime + i);
			}
			ggaoStr = "\n<li class=\"ggao\" id=\""+ add +mytime+"\">\n";
			ggaoStr = ggaoStr + "<div style=\"left:0; top:0; width:260px; height:210px;\"><a href=\""+href.get(0)+"\" target=\"_blank\"><img src=\"${pageContext.request.contextPath}/../WGPhoto/guanggao_img/"+rname.get(0)+".jpg\" /></a></div>\n";
			ggaoStr = ggaoStr + "<div style=\"left:260px; top:0; width:260px; height:210px;\"><a href=\""+href.get(1)+"\" target=\"_blank\"><img src=\"${pageContext.request.contextPath}/../WGPhoto/guanggao_img/"+rname.get(1)+".jpg\" /></a></div>\n";
			ggaoStr = ggaoStr + "<div style=\"left:0; top:210px; width:520px; height:170px;\"><a href=\""+href.get(2)+"\" target=\"_blank\"><img src=\"${pageContext.request.contextPath}/../WGPhoto/guanggao_img/"+rname.get(2)+".jpg\" /></a></div>\n";
			ggaoStr = ggaoStr + "<div style=\"right:0; top:0; width:260px; height:380px;\"><a href=\""+href.get(3)+"\" target=\"_blank\"><img src=\"${pageContext.request.contextPath}/../WGPhoto/guanggao_img/"+rname.get(3)+".jpg\" /></a></div>\n";
			ggaoStr = ggaoStr + "</li>";
		}
		//上传图片
		FileUtil.upload_guanggao(file, FileUtil.getSaveGuangGao_file(), rname);
		//获取guanggao  html 的String
		String ggao = FileUtil.readFile(FileUtil.getGuangGao_file()).toString();
		//追加广告位
		String li_start = "<li class=\"ggao\" id=\""+liId+"\">";  //参考物
		String li_end = "</li>";
		int li_index_start = ggao.indexOf(li_start);
		int li_index_end = 0;
		String ggao_tou = "";
		String ggao_wei = "";
		if(addType.equals("add")){  //追加到参考物后
			String mid = ggao.substring(li_index_start, ggao.length());
			li_index_end = mid.indexOf(li_end) + li_index_start + li_end.length();
			
			ggao_tou = ggao.substring(0, li_index_end);
			ggao_wei = ggao.substring(li_index_end, ggao.length());
		}else if(addType.equals("add_up")){
			ggao_tou = ggao.substring(0, li_index_start);
			ggao_wei = ggao.substring(li_index_start, ggao.length());
		}
		ggao = ggao_tou + ggaoStr + ggao_wei;
		ggao = ggao.substring(0, 2) + "<%" + ggao.substring(2, ggao.length());
		FileUtil.writeFile(new StringBuilder(ggao), FileUtil.getGuangGaoPath_file(), FileUtil.getGuangGao_name());
		return true;
	}

	public boolean dele_aa(String liId) {
		// TODO Auto-generated method stub
		if(liId == ""){
			return false;
		}
		//获取guanggao  html 的String
		String ggao = FileUtil.readFile(FileUtil.getGuangGao_file()).toString();
		String li_start = "<li class=\"ggao\" id=\""+liId+"\">";
		String li_end = "</li>";
		int li_index_start = ggao.indexOf(li_start);
		int li_index_end = 0;
		String mid = ggao.substring(li_index_start, ggao.length());
		li_index_end = mid.indexOf(li_end) + li_index_start + li_end.length();
		ggao = ggao.substring(0, li_index_start) + ggao.substring(li_index_end, ggao.length());
		ggao = ggao.substring(0, 2) + "<%" + ggao.substring(2, ggao.length());
		FileUtil.writeFile(new StringBuilder(ggao), FileUtil.getGuangGaoPath_file(), FileUtil.getGuangGao_name());
		return true;
	}
	
	

}
