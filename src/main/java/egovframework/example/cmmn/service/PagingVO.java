package egovframework.example.cmmn.service;

public class PagingVO {
	private long rows = 10;
	private long page = 1;
	private long totalPage = 1;
	private long startPage = 1;
	private long endPage = 1;
	private long pageScale = 5;
	private long fstpage = 1;

	public long getFstpage() {
		return fstpage;
	}
	public void setFstpage(long fstpage) {
		this.fstpage = fstpage;
	}
	public long getRows() {
		return rows;
	}
	public void setRows(long rows) {
		this.rows = rows;
	}
	public long getPage() {
		return page;
	}
	public void setPage(long page) {
		this.page = page;
	}
	public long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
	public long getStartPage() {
		return startPage;
	}
	public void setStartPage(long startPage) {
		this.startPage = startPage;
	}
	public long getEndPage() {
		return endPage;
	}
	public void setEndPage(long endPage) {
		this.endPage = endPage;
	}
	public long getPageScale() {
		return pageScale;
	}
	public void setPageScale(long pageScale) {
		this.pageScale = pageScale;
	}
}