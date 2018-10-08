package egovframework.example.qaMgr.service;

import java.util.Date;

public class TAB_QA_VO {
	private int qaSeq 		= 0;
	private String qaCtt	= "";
	private String qaWtrId	= "";
	private String qaWtrNm	= "";
	private int qaStt		= 0;
	private Date qaCrtDate;
	private String qaDel	= "";
	public int getQaSeq() {
		return qaSeq;
	}
	public void setQaSeq(int qaSeq) {
		this.qaSeq = qaSeq;
	}
	public String getQaCtt() {
		return qaCtt;
	}
	public void setQaCtt(String qaCtt) {
		this.qaCtt = qaCtt;
	}
	public String getQaWtrId() {
		return qaWtrId;
	}
	public void setQaWtrId(String qaWtrId) {
		this.qaWtrId = qaWtrId;
	}
	public String getQaWtrNm() {
		return qaWtrNm;
	}
	public void setQaWtrNm(String qaWtrNm) {
		this.qaWtrNm = qaWtrNm;
	}
	public int getQaStt() {
		return qaStt;
	}
	public void setQaStt(int qaStt) {
		this.qaStt = qaStt;
	}
	public Date getQaCrtDate() {
		return qaCrtDate;
	}
	public void setQaCrtDate(Date qaCrtDate) {
		this.qaCrtDate = qaCrtDate;
	}
	public String getQaDel() {
		return qaDel;
	}
	public void setQaDel(String qaDel) {
		this.qaDel = qaDel;
	}
}
