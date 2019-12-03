package fproject.app.fproject.vo;

public class CommentsVo{
	private int commnum;
	private int storynum;
	private int num;
	private String commcontent;
	private int commref;
	private int commlev;
	private int commstep;
	public CommentsVo() {}
	public CommentsVo(int commnum, int storynum, int num, String commcontent, int commref, int commlev, int commstep) {
		super();
		this.commnum = commnum;
		this.storynum = storynum;
		this.num = num;
		this.commcontent = commcontent;
		this.commref = commref;
		this.commlev = commlev;
		this.commstep = commstep;
	}
	public int getCommnum() {
		return commnum;
	}
	public void setCommnum(int commnum) {
		this.commnum = commnum;
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
	public String getCommcontent() {
		return commcontent;
	}
	public void setCommcontent(String commcontent) {
		this.commcontent = commcontent;
	}
	public int getCommref() {
		return commref;
	}
	public void setCommref(int commref) {
		this.commref = commref;
	}
	public int getCommlev() {
		return commlev;
	}
	public void setCommlev(int commlev) {
		this.commlev = commlev;
	}
	public int getCommstep() {
		return commstep;
	}
	public void setCommstep(int commstep) {
		this.commstep = commstep;
	}
	
}
