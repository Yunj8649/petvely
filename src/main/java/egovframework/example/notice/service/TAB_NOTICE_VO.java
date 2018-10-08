package egovframework.example.notice.service;

import java.util.Date;

public class TAB_NOTICE_VO {
	private int ntSeq = 0;
	private String ntTtl = "";
	private String ntCtt = "";
	private String ntWtrId = "";
	private int ntHit = 1;
	private String ntFle = "";
	private Date ntCrtDate;
	private Date ntStaDate;
	private Date ntEndDate;
	private String ntWtrNm = "";
	private String ntDel = "";
	
	public String getNtDel() {
		return ntDel;
	}
	public void setNtDel(String ntDel) {
		this.ntDel = ntDel;
	}
	public String getNtWtrId() {
		return ntWtrId;
	}
	public void setNtWtrId(String ntWtrId) {
		this.ntWtrId = ntWtrId;
	}
	public String getNtWtrNm() {
		return ntWtrNm;
	}
	public void setNtWtrNm(String ntWtrNm) {
		this.ntWtrNm = ntWtrNm;
	}
	public int getNtSeq() {
		return ntSeq;
	}
	public void setNtSeq(int ntSeq) {
		this.ntSeq = ntSeq;
	}
	public String getNtTtl() {
		return ntTtl;
	}
	public void setNtTtl(String ntTtl) {
		this.ntTtl = ntTtl;
	}
	public String getNtCtt() {
		return ntCtt;
	}
	public void setNtCtt(String ntCtt) {
		this.ntCtt = ntCtt;
	}
	public int getNtHit() {
		return ntHit;
	}
	public void setNtHit(int ntHit) {
		this.ntHit = ntHit;
	}
	public String getNtFle() {
		return ntFle;
	}
	public void setNtFle(String ntFle) {
		this.ntFle = ntFle;
	}
	public Date getNtCrtDate() {
		return ntCrtDate;
	}
	public void setNtCrtDate(Date ntCrtDate) {
		this.ntCrtDate = ntCrtDate;
	}
	public Date getNtStaDate() {
		return ntStaDate;
	}
	public void setNtStaDate(Date ntStaDate) {
		this.ntStaDate = ntStaDate;
	}
	public Date getNtEndDate() {
		return ntEndDate;
	}
	public void setNtEndDate(Date ntEndDate) {
		this.ntEndDate = ntEndDate;
	}
}