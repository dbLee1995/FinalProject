package fproject.app.fproject.vo;

import java.sql.Date;

public class StoryVo{
	private int storynum;
	private int num;
	private String stitle;
	private String scontent;
	private Date sregdate;
	private String orgimg;
	private String saveimg;
	private long imgsize;
	public StoryVo() {}
	public StoryVo(int storynum, int num, String stitle, String scontent, Date sregdate, String orgimg, String saveimg,
			long imgsize) {
		super();
		this.storynum = storynum;
		this.num = num;
		this.stitle = stitle;
		this.scontent = scontent;
		this.sregdate = sregdate;
		this.orgimg = orgimg;
		this.saveimg = saveimg;
		this.imgsize = imgsize;
	}
	public int getStorynum() {
		return storynum;
	}
	public void setStorynum(int storynum) {
		this.storynum = storynum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	public Date getSregdate() {
		return sregdate;
	}
	public void setSregdate(Date sregdate) {
		this.sregdate = sregdate;
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
	
}
