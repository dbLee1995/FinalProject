package fproject.app.fproject.Util;

public class Paging_WishList {
	private int pageRow; // �������� �׸� ��
	private int totalCount; // �� �׸� ��
	private int totalPageCount; // ��ü ������ ��
	private int thisPage = 1; // ���� ������ ��ȣ(�⺻ 1)
	int startPage;
	int endPage;
	
	public Paging_WishList() {}
	
	/**
	 * <p>  ������ ��� ���̴� startPage�� endPage�� �����մϴ�.<p>
	 * @param pageRow �� �������� �׸� ��
	 * @param totalCount ��ü �׸� ��
	 * @param thisPage ���� ������
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
