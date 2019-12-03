package fproject.app.fproject.vo;

import java.sql.Date;

public class NoticeVo{
	private int noticenum;
	private String noticetitle;
	private String noticecontent;
	private Date noticeregdate;
	private int noticestate;
	public NoticeVo() {}
	public NoticeVo(int noticenum, String noticetitle, String noticecontent, Date noticeregdate, int noticestate) {
		super();
		this.noticenum = noticenum;
		this.noticetitle = noticetitle;
		this.noticecontent = noticecontent;
		this.noticeregdate = noticeregdate;
		this.noticestate = noticestate;
	}
	public int getNoticenum() {
		return noticenum;
	}
	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}
	public String getNoticetitle() {
		return noticetitle;
	}
	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}
	public String getNoticecontent() {
		return noticecontent;
	}
	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}
	public Date getNoticeregdate() {
		return noticeregdate;
	}
	public void setNoticeregdate(Date noticeregdate) {
		this.noticeregdate = noticeregdate;
	}
	public int getNoticestate() {
		return noticestate;
	}
	public void setNoticestate(int noticestate) {
		this.noticestate = noticestate;
	}
	
}
