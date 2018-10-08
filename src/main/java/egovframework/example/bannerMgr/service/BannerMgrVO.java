package egovframework.example.bannerMgr.service;

public class BannerMgrVO {
	private String page = "";
	private String rows;
	private String totalTotCnt;
	private String totalPage;
	
	private String param = "";
	private String selectedBanLoc = "";
	private String selectedBanType = "";
	private String sidx = "";
	private String sord = "";
	
	private String banNm = "";
	private String banLocNm = "";
	private String banTypeNm = "";
	// private String banImg1 = "";
	private String banImg1Src = "";
	private String banChecked = "";
	private String banSlide = "";
	
	private int banLocCd;
	private int banTypeCd;
	
	
	
	public String getBanImg1Src() {
		return banImg1Src;
	}
	public void setBanImg1Src(String banImg1Src) {
		this.banImg1Src = banImg1Src;
	}
	public String getBanNm() {
		return banNm;
	}
	public void setBanNm(String banNm) {
		this.banNm = banNm;
	}
	public String getBanLocNm() {
		return banLocNm;
	}
	public void setBanLocNm(String banLocNm) {
		this.banLocNm = banLocNm;
	}
	public String getBanTypeNm() {
		return banTypeNm;
	}
	public void setBanTypeNm(String banTypeNm) {
		this.banTypeNm = banTypeNm;
	}
/*	public String getBanImg1() {
		return banImg1;
	}
	public void setBanImg1(String banImg1) {
		this.banImg1 = banImg1;
	}*/
	public String getBanChecked() {
		return banChecked;
	}
	public void setBanChecked(String banChecked) {
		this.banChecked = banChecked;
	}
	public String getBanSlide() {
		return banSlide;
	}
	public void setBanSlide(String banSlide) {
		this.banSlide = banSlide;
	}
	public int getBanLocCd() {
		return banLocCd;
	}
	public void setBanLocCd(int banLocCd) {
		this.banLocCd = banLocCd;
	}
	public int getBanTypeCd() {
		return banTypeCd;
	}
	public void setBanTypeCd(int banTypeCd) {
		this.banTypeCd = banTypeCd;
	}
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
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getSelectedBanLoc() {
		return selectedBanLoc;
	}
	public void setSelectedBanLoc(String selectedBanLoc) {
		this.selectedBanLoc = selectedBanLoc;
	}
	public String getSelectedBanType() {
		return selectedBanType;
	}
	public void setSelectedBanType(String selectedBanType) {
		this.selectedBanType = selectedBanType;
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
	
}
