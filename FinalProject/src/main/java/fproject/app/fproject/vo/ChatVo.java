package fproject.app.fproject.vo;

import java.sql.Date;

public class ChatVo{
	private int cnum;
	private int state;
	private String content;
	private Date regdate;
	private int emoticonnum;
	private String orgimg;
	private String saveimg;
	private long imgsize;
	private int clnum;
	private int num;
	public ChatVo() {}
	public ChatVo(int cnum, int state, String content, Date regdate, int emoticonnum, String orgimg, String saveimg,
			long imgsize, int clnum, int num) {
		super();
		this.cnum = cnum;
		this.state = state;
		this.content = content;
		this.regdate = regdate;
		this.emoticonnum = emoticonnum;
		this.orgimg = orgimg;
		this.saveimg = saveimg;
		this.imgsize = imgsize;
		this.clnum = clnum;
		this.num = num;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getEmoticonnum() {
		return emoticonnum;
	}
	public void setEmoticonnum(int emoticonnum) {
		this.emoticonnum = emoticonnum;
	}
	public String getOrgimg() {
		return orgimg;
	}
	public void setOrgimg(String orgimg) {
		this.orgimg = orgimg;
	}
	public String getSaveimg() {
		return saveimg;
	}
	public void setSaveimg(String saveimg) {
		this.saveimg = saveimg;
	}
	public long getImgsize() {
		return imgsize;
	}
	public void setImgsize(long imgsize) {
		this.imgsize = imgsize;
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
