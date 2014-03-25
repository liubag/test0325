package com.bookshop.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bookshop.entity.Order;
import com.bookshop.entity.Staff;
import com.bookshop.entity.StaffHandleRecord;
import com.bookshop.service.StaffHandleRecordService;
import com.bookshop.util.PageUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 员工处理会员订单和会员退货申请记录Action层
 * @author Winds
 *
 */
@SuppressWarnings("serial")
public class StaffHandleRecordAction extends ActionSupport {
	@Resource
	private StaffHandleRecordService staffHandleRecordService;
	private StaffHandleRecord staffHandleRecord;
	
	private Long hasRecord; // 数据的条数
	private int page; // 当前页
	private int hasPages; // 页数
	private int perFolioAmount; // 每页数据的条数
	private List<Integer> page_l;
	private List Record_l;
	private Integer handle_type;
	private String staffId;
	private Integer type;//0为 处理订单，1为处理退货 2查询员工个人的处理记录
	private Map<String,Object> session;
	private boolean isLike;
	
	private String parm =null;//筛选所需的参数
	private String value = null;//筛选所需的值
	private String beginTime;
	private String endTime;
	private boolean clear;//清楚筛选的参数
	/**
	 * 分页获取员工处理记录信息
	 * @return
	 */
	public String showStaffHandleRecord_by_page() {
		try{
			perFolioAmount = 2; // 每页显示条数
			String[] parms = null;
			String[] values = null;
			if(type==0){
				parms=new String[]{"handle_type"};
				values=new String[]{String.valueOf(handle_type)};
//				this.hasRecord = staffHandleRecordService.hasNumbers(handle_type); // 获取数据条数
//				hasPages = staffHandleRecordService.findPages(perFolioAmount,handle_type); // 获取页数
			}else if(type==1){
				parms=new String[]{"handle_type","staff.staff_id"};
				values=new String[]{String.valueOf(handle_type),staffId};
//				this.hasRecord = staffHandleRecordService.hasNumbers(staffId,handle_type); // 获取数据条数
//				hasPages = staffHandleRecordService.findPages(perFolioAmount,staffId,handle_type); // 获取页数
			}
		
			this.hasRecord = staffHandleRecordService.hasNumbers("StaffHandleRecord", parms, values, isLike); 
			hasPages = PageUtil.findAllPages(perFolioAmount, hasRecord); // 获取页数
			this.page_l = PageUtil.getPageList(hasPages); // 获取一个从1到hasPages的数组
			if (page <= 0) {
				page = 1;
			}
			if (hasPages == 0) {
				page = 0;
			} else {
				if (page <= 0) {
					page = 1;
				} else if (page > hasPages) {
					page = hasPages;
				}
			}
			// 获取当前页的数据
			this.Record_l =  staffHandleRecordService.show_by_page(page, perFolioAmount, "StaffHandleRecord", parms, values, isLike);						
			if(handle_type==1){
				return "success1";
			}else if(handle_type==2){
				return "success2";
			}else{
				return "input";
			}
			}catch(Exception e){
				e.printStackTrace();
				return "input";
			}
	}
	
	
	@SuppressWarnings("unchecked")
	public String showStaffHandleRecord_by_id(){
		if(clear){
			parm = null;
			value = null;
			clear=false;
		}
		try{
		session = ActionContext.getContext().getSession();
		if(session.get("staff_id")==null){
			return "input";
		}
		String staff_id = session.get("staff_id").toString();
		String[] parms = new String[]{"staff.staff_id"};
		String[] values =new String[]{staff_id};
		boolean isLike = false;
		
		
		if(perFolioAmount <=0)
			perFolioAmount =4;
		if(parm !=null && parm.equals("handle_date")){
			hasRecord = staffHandleRecordService.hasNumbers("StaffHandleRecord", "handle_date", beginTime, endTime, "staff.staff_id", staff_id);
			hasPages = PageUtil.findAllPages(perFolioAmount, hasRecord);
			page_l = PageUtil.getPageList(hasPages);
			if (hasPages == 0) {
				hasPages = 1;
				page = 0;
			} 
			if (page <= 0) {
				page = 1;
			}else if (page > hasPages) {
				page = hasPages;
			}
			this.Record_l =staffHandleRecordService.show_by_page(page,perFolioAmount,"StaffHandleRecord", "handle_date", beginTime, endTime, "staff.staff_id", staff_id);
			return SUCCESS;
		}
		if(parm !=null && value !=null && !value.trim().equals("")){
			parms = new String []{parm,"staff.staff_id"};
			values = new String[]{value,staff_id};
			isLike = true;
		}
		hasRecord = staffHandleRecordService.hasNumbers("StaffHandleRecord", parms, values,isLike);
		hasPages = PageUtil.findAllPages(perFolioAmount, hasRecord);
		page_l = PageUtil.getPageList(hasPages);
		if (hasPages == 0) {
			hasPages = 1;
			page = 0;
		} 
		if (page <= 0) {
			page = 1;
		}else if (page > hasPages) {
			page = hasPages;
		}
		this.Record_l =staffHandleRecordService.show_by_page(page, perFolioAmount, "StaffHandleRecord", parms, values,isLike);
		return SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			return "input";
		}
	}
	

	public StaffHandleRecord getStaffHandleRecord() {
		return staffHandleRecord;
	}
	public void setStaffHandleRecord(StaffHandleRecord staffHandleRecord) {
		this.staffHandleRecord = staffHandleRecord;
	}
	public Long getHasRecord() {
		return hasRecord;
	}
	public void setHasRecord(Long hasRecord) {
		this.hasRecord = hasRecord;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getHasPages() {
		return hasPages;
	}
	public void setHasPages(int hasPages) {
		this.hasPages = hasPages;
	}
	public int getPerFolioAmount() {
		return perFolioAmount;
	}
	public void setPerFolioAmount(int perFolioAmount) {
		this.perFolioAmount = perFolioAmount;
	}
	public List<Integer> getPage_l() {
		return page_l;
	}
	public void setPage_l(List<Integer> page_l) {
		this.page_l = page_l;
	}

	public Integer getHandle_type() {
		return handle_type;
	}
	public void setHandle_type(Integer handle_type) {
		this.handle_type = handle_type;
	}

	public String getStaffId() {
		return staffId;
	}

	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}



	public StaffHandleRecordService getStaffHandleRecordService() {
		return staffHandleRecordService;
	}


	public void setStaffHandleRecordService(
			StaffHandleRecordService staffHandleRecordService) {
		this.staffHandleRecordService = staffHandleRecordService;
	}


	public String getParm() {
		return parm;
	}


	public void setParm(String parm) {
		this.parm = parm;
	}


	public String getValue() {
		return value;
	}


	public void setValue(String value) {
		this.value = value;
	}


	public String getBeginTime() {
		return beginTime;
	}


	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public boolean isClear() {
		return clear;
	}


	public void setClear(boolean clear) {
		this.clear = clear;
	}



	public List getRecord_l() {
		return Record_l;
	}


	public void setRecord_l(List record_l) {
		Record_l = record_l;
	}

	
	
}
