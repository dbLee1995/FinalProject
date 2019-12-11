package fproject.app.fproject.Util;

/**
 * @author JHTA
 *
 */
/**
 * @author JHTA
 *
 */
public class Paging {
	private int pageRow; // �������� �׸� ��
	private int startRow;
	private int endRow;
	private int totalCount; // �� �׸� ��
	private int totalPageCount; // ��ü ������ ��
	private int thisPage; // ���� ������ ��ȣ(�⺻�� 1�� @RequestParam����)
	private int startPage;
	private int endPage;
	
	public Paging() {}
	
	/**
	 * <p>������ ������ ���. ������ ��� ���̴� startPage�� endPage�� �����մϴ�.<p>
	 * @param pageRow �� �������� �׸� ��
	 * @param totalCount ��ü �׸� ��
	 * @param thisPage ���� ������
	 */
	public Paging(int pageRow, int totalCount, int thisPage) {
		this.pageRow = pageRow;
		this.thisPage = thisPage;
		this.totalPageCount = totalCount%pageRow>0 ? totalCount/pageRow+1 : totalCount/pageRow;
		if(thisPage > totalPageCount) thisPage = totalPageCount;
		this.startPage = thisPage==1 ? 1: thisPage-3;
		this.endPage = thisPage+3;
		if(endPage>totalPageCount) endPage=totalPageCount;
		this.endRow = thisPage * pageRow;
		this.startRow = endRow - (pageRow-1);
	}
	
	/**
	 * <p>�Һ��� ������ ���. ������ ��� ���̴� startPage�� endPage�� �����մϴ�.<p>
	 * @param basket - �����ε��� �������̹Ƿ� null �־��ּ���.
	 */
	public Paging(int pageRow, int totalCount, int thisPage, String basket) {
		this.pageRow = pageRow;
		this.thisPage = thisPage;
		this.totalPageCount = totalCount%pageRow>0 ? totalCount/pageRow+1 : totalCount/pageRow;
		if(thisPage > totalPageCount) thisPage = totalPageCount;
		this.startPage = ((thisPage-1)%10)*10 + 1;
		this.endPage = startPage-9;
		if(endPage>totalPageCount) endPage = totalPageCount;
		this.endRow = thisPage * pageRow;
		this.startRow = endRow - (pageRow-1);
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

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
}
