package egovframework.example.category.service;

import egovframework.example.cmmn.service.PagingVO;

public class Category_Paging_VO extends PagingVO{
	private int ctCd = 0;
	private int subCtCd = 0;
	private long rows = 16;
	public int getCtCd() {
		return ctCd;
	}
	public void setCtCd(int ctCd) {
		System.out.println("setCtCd() : " + ctCd);
		this.ctCd = ctCd;
	}
	public int getSubCtCd() {
		return subCtCd;
	}
	public void setSubCtCd(int subCtCd) {
		System.out.println("setSubCtCd() : " + subCtCd);
		this.subCtCd = subCtCd;
	}
	public long getRows() {
		return rows;
	}
	public void setRows(long rows) {
		this.rows = rows;
	}
}
