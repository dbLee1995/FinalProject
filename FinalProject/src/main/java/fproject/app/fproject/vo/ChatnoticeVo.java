package fproject.app.fproject.vo;

public class ChatnoticeVo{
	private int noticenum;
	private String notice;
	private int clnum;
	private int num;
	public ChatnoticeVo() {}
	public ChatnoticeVo(int noticenum, String notice, int clnum, int num) {
		super();
		this.noticenum = noticenum;
		this.notice = notice;
		this.clnum = clnum;
		this.num = num;
	}
	public int getNoticenum() {
		return noticenum;
	}
	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getClnum() {
		return clnum;
	}
	public void setClnum(int clnum) {
		this.clnum = clnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
