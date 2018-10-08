package egovframework.example.event.service;

import egovframework.example.cmmn.service.PagingVO;

public class Event_Paging_VO extends PagingVO {
	private String evDel = "";

	public String getEvDel() {
		return evDel;
	}
	public void setEvDel(String evDel) {
		this.evDel = evDel;
	}
}
