package egovframework.example.memberMgr.service;

public class MemberMgrVO {
	private String page = "";
	private String rows;
	private String totalTotCnt;
	private String totalPage;
	private String sidx = "";
	private String sord = "";
	
	private String param = "";

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getTotalTotCnt() {
		return totalTotCnt;
	}

	public void setTotalTotCnt(String totalTotCnt) {
		this.totalTotCnt = totalTotCnt;
	}

	public String getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(String totalPage) {
		this.totalPage = totalPage;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}
}
