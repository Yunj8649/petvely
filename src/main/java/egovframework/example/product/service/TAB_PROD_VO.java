package egovframework.example.product.service;

import java.util.Date;

public class TAB_PROD_VO {

	private int prCd = 0;
	private String prNm = "";
	private int brdNm = 0;
	private int ctCd = 0;
	private int subCtCd =0;
	private String prClr = "";
	private String prOpt = "";
	private int prPrc = 0;
	private Date prCrtDate;
	private Date prStaDate;
	private Date prEndDate;
	private int prCntSto = 0;
	private int prCntSel = 0;
	private String prImg1 = "";
	private String prImg2 = "";
	private String prDes1 = "";
	private String prDes2 = "";
	
	public int getPrCd() {
		return prCd;
	}
	public void setPrCd(int prCd) {
		System.out.println("setPrCd()");
		this.prCd = prCd;
	}
	public String getPrNm() {
		return prNm;
	}
	public void setPrNm(String prNm) {
		System.out.println("setPrNm()");
		this.prNm = prNm;
	}
	public int getBrdNm() {
		return brdNm;
	}
	public void setBrdNm(int brdNm){
		this.brdNm = brdNm;
	}
	public int getCtCd() {
		return ctCd;
	}
	public void setCtCd(int ctCd) {
		System.out.println("setCtCd()");
		this.ctCd = ctCd;
	}
	public String getPrClr() {
		return prClr;
	}
	public void setPrClr(String prClr) {
		System.out.println("setPrClr()");
		this.prClr = prClr;
	}
	public String getPrOpt() {
		return prOpt;
	}
	public void setPrOpt(String prOpt) {
		System.out.println("setPrOpt()");
		this.prOpt = prOpt;
	}
	public int getPrPrc() {
		return prPrc;
	}
	public void setPrPrc(int prPrc) {
		System.out.println("setPrPrc()");
		this.prPrc = prPrc;
	}
	public Date getPrCrtDate() {
		return prCrtDate;
	}
	public void setPrCrtDate(Date prCrtDate) {
		System.out.println("setPrCrtDate()");
		this.prCrtDate = prCrtDate;
	}
	public Date getPrStaDate() {
		return prStaDate;
	}
	public void setPrStaDate(Date prStaDate) {
		System.out.println("setPrStaDate()");
		this.prStaDate = prStaDate;
	}
	public Date getPrEndDate() {
		return prEndDate;
	}
	public void setPrEndDate(Date prEndDate) {
		System.out.println("setPrEndDate()");
		this.prEndDate = prEndDate;
	}
	public int getPrCntSto() {
		return prCntSto;
	}
	public void setPrCntSto(int prCntSto) {
		System.out.println("setPrCntSto()");
		this.prCntSto = prCntSto;
	}
	public int getPrCntSel() {
		return prCntSel;
	}
	public void setPrCntSel(int prCntSel) {
		System.out.println("setPrCntSel()");
		this.prCntSel = prCntSel;
	}
	public String getPrImg1() {
		return prImg1;
	}
	public void setPrImg1(String prImg1) {
		System.out.println("setprImg1()");
		this.prImg1 = prImg1;
	}
	public String getPrImg2() {
		return prImg2;
	}
	public void setPrImg2(String prImg2) {
		System.out.println("setPrImg2()");
		this.prImg2 = prImg2;
	}
	public String getPrDes1() {
		return prDes1;
	}
	public void setPrDes1(String prDes1) {
		System.out.println("setPrDes1()");
		this.prDes1 = prDes1;
	}
	public String getPrDes2() {
		return prDes2;
	}
	public void setPrDes2(String prDes2) {
		System.out.println("setPrDes2()");
		this.prDes2 = prDes2;
	}
	public int getSubCtCd() {
		return subCtCd;
	}
	public void setSubCtCd(int subCtCd) {
		this.subCtCd = subCtCd;
	}
	
}
