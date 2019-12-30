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
	private int totalCount; // 총 항목 수
	private int pageRow; // 페이지당 항목 수
	private int totalPageCount; // 전체 페이지 수
	private int thisPage; // 현재 페이지 번호(초기값 1은 @RequestParam으로)
	private int startRow; // 페이지의 첫 항목
	private int endRow;
	private int startPage; // 페이지 목록의 첫 페이지
	private int endPage;
	
	public Paging() {}
	
	/**
	 * <p>가변형 페이지 목록입니다.<br>페이지 목록 길이는 startPage와 endPage로 수정합니다.<p>
	 * @param pageRow - 한 페이지당 항목 수
	 * @param totalCount - 전체 항목 수
	 * @param indexLength - 페이지 목록 길이. 짝수 넣을 시 +1 홀수로 적용
	 * @param thisPage - 현재 페이지
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
	 * <p>불변형 페이지 목록입니다.<br>페이지 목록 길이는 startPage와 endPage로 수정합니다.<p>
	 * @param pageRow - 한 페이지당 항목 수
	 * @param totalCount - 전체 항목 수
	 * @param indexLength - 페이지 목록 길이
	 * @param thisPage - 현재 페이지
	 * @param changing - 오버로딩용 구분자이므로 아무거나 넣어주세요.
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
