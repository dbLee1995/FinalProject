package fproject.app.fproject.vo;

public class FriendlistVo{
	private int num;
	private int fnum;
	private int favo;
	private int spam;
	private int approv;
	public FriendlistVo() {}
	public FriendlistVo(int num, int fnum, int favo, int spam, int approv) {
		super();
		this.num = num;
		this.fnum = fnum;
		this.favo = favo;
		this.spam = spam;
		this.approv = approv;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	public int getFavo() {
		return favo;
	}
	public void setFavo(int favo) {
		this.favo = favo;
	}
	public int getSpam() {
		return spam;
	}
	public void setSpam(int spam) {
		this.spam = spam;
	}
	public int getApprov() {
		return approv;
	}
	public void setApprov(int approv) {
		this.approv = approv;
	}
	
}
