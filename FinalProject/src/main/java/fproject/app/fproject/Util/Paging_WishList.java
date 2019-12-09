package fproject.app.fproject.Util;

public class Paging_WishList {
	private int pageRow; // 페이지당 항목 수
	private int totalCount; // 총 항목 수
	private int totalPageCount; // 전체 페이지 수
	private int thisPage = 1; // 현재 페이지 번호(기본 1)
	int startPage;
	int endPage;
	
	public Paging_WishList() {}
	
	/**
	 * <p>  페이지 목록 길이는 startPage와 endPage로 수정합니다.<p>
	 * @param pageRow 한 페이지당 항목 수
	 * @param totalCount 전체 항목 수
	 * @param thisPage 현재 페이지
	 */
	public Paging_WishList(int pageRow, int totalCount, int thisPage) {
		this.thisPage = thisPage;
		this.totalPageCount = totalCount%pageRow>0 ? totalCount/pageRow+1 : totalCount/pageRow;
		if(thisPage > totalPageCount) thisPage = totalPageCount;
		this.startPage = thisPage==1 ? 1: thisPage-3;
		this.endPage = thisPage+3;
		if(endPage>totalPageCount) endPage=totalPageCount;
	}

	public int getPageRow() {
		return pageRow;
	}

	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getThisPage() {
		return thisPage;
	}

	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
}
