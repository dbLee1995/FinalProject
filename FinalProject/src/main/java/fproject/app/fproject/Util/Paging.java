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
	private int totalCount; // �� �׸� ��
	private int pageRow; // �������� �׸� ��
	private int totalPageCount; // ��ü ������ ��
	private int thisPage; // ���� ������ ��ȣ(�ʱⰪ 1�� @RequestParam����)
	private int startRow; // �������� ù �׸�
	private int endRow;
	private int startPage; // ������ ����� ù ������
	private int endPage;
	
	public Paging() {}
	
	/**
	 * <p>������ ������ ����Դϴ�.<br>������ ��� ���̴� startPage�� endPage�� �����մϴ�.<p>
	 * @param pageRow - �� �������� �׸� ��
	 * @param totalCount - ��ü �׸� ��
	 * @param indexLength - ������ ��� ����. ¦�� ���� �� +1 Ȧ���� ����
	 * @param thisPage - ���� ������
	 */
	public Paging(int pageRow, int totalCount, int indexLength, int thisPage) {
		this.pageRow = pageRow;
		this.thisPage = thisPage;
		this.totalPageCount = totalCount%pageRow>0 ? totalCount/pageRow+1 : totalCount/pageRow;
		if(thisPage > totalPageCount) thisPage = totalPageCount;
		this.startPage = thisPage<1 ? 1:(thisPage-indexLength/2<=0 ? 1:thisPage-indexLength/2);
		this.endPage = thisPage+indexLength/2;
		if(endPage>totalPageCount) endPage=totalPageCount;
		this.endRow = thisPage*pageRow;
		if(endRow<1) endRow = 1;
		this.startRow = endRow-(pageRow-1);
		if(startRow<1) startRow = 1;
		if(endRow>totalCount) endRow = totalCount;
	}
	
	/**
	 * <p>�Һ��� ������ ����Դϴ�.<br>������ ��� ���̴� startPage�� endPage�� �����մϴ�.<p>
	 * @param pageRow - �� �������� �׸� ��
	 * @param totalCount - ��ü �׸� ��
	 * @param indexLength - ������ ��� ����
	 * @param thisPage - ���� ������
	 * @param changing - �����ε��� �������̹Ƿ� �ƹ��ų� �־��ּ���.
	 */
	public Paging(int pageRow, int totalCount, int indexLength, int thisPage, int changing) {
		this.pageRow = pageRow;
		this.thisPage = thisPage;
		this.totalPageCount = totalCount%pageRow>0 ? totalCount/pageRow+1:totalCount/pageRow;
		if(thisPage > totalPageCount) thisPage = totalPageCount;
		this.startPage = ((thisPage-1)/indexLength)*indexLength + 1;
		this.endPage = startPage+indexLength-1;
		if(endPage>totalPageCount) endPage = totalPageCount;
		this.endRow = thisPage * pageRow;
		this.startRow = endRow - (pageRow-1);
		if(endRow>totalCount) endRow = totalCount;
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
