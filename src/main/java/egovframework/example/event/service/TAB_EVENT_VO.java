package egovframework.example.event.service;

import java.util.Date;

public class TAB_EVENT_VO {
	private int evSeq = 0;
	private String evTtl = "";
	private String evCtt = "";
	private int evHit = 0;
	private String evFle = "";
	private Date evCrtDate;
	private String evStaDate;
	private String evEndDate;
	private String evWtrNm = "";
	private String evWtrId = "";
	private String evDel = "";
	
	public String getEvWtrId() {
		return evWtrId;
	}
	public void setEvWtrId(String evWtrId) {
		System.out.println("setEvWtrId()" + evWtrId);
		this.evWtrId = evWtrId;
	}
	public int getEvSeq() {
		return evSeq;
	}
	public void setEvSeq(int evSeq) {
		System.out.println("setEvSeq()" + evSeq);
		this.evSeq = evSeq;
	}
	public String getEvTtl() {
		return evTtl;
	}
	public void setEvTtl(String evTtl) {
		System.out.println("setEvTtl()" + evTtl);
		this.evTtl = evTtl;
	}
	public String getEvCtt() {
		return evCtt;
	}
	public void setEvCtt(String evCtt) {
		System.out.println("setEvCtt()" + evCtt);
		this.evCtt = evCtt;
	}
	public int getEvHit() {
		return evHit;
	}
	public void setEvHit(int evHit) {
		System.out.println("setEvHit()" + evHit);
		this.evHit = evHit;
	}
	public String getEvFle() {
		return evFle;
	}
	public void setEvFle(String evFle) {
		System.out.println("setEvFle()" + evFle);
		this.evFle = evFle;
	}
	public Date getEvCrtDate() {
		return evCrtDate;
	}
	public void setEvCrtDate(Date evCrtDate) {
		System.out.println("setEvCrtDate()" + evCrtDate);
		this.evCrtDate = evCrtDate;
	}
	public String getEvStaDate() {
		return evStaDate;
	}
	public void setEvStaDate(String evStaDate) {
		System.out.println("setEvStaDate()" + evStaDate);
		this.evStaDate = evStaDate;
	}
	public String getEvEndDate() {
		return evEndDate;
	}
	public void setEvEndDate(String evEndDate) {
		System.out.println("setEvEndDate()" + evEndDate);
		this.evEndDate = evEndDate;
	}
	public String getEvWtrNm() {
		return evWtrNm;
	}
	public void setEvWtrNm(String evWtrNm) {
		System.out.println("setEvWtrNm()" + evWtrNm);
		this.evWtrNm = evWtrNm;
	}
	public String getEvDel() {
		return evDel;
	}
	public void setEvDel(String evDel) {
		System.out.println("setEvDel()" + evDel);
		this.evDel = evDel;
	}
}
