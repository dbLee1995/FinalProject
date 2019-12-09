package fproject.app.fproject.vo;

public class ChattimeVo {
	private int cnum;
	private int clnum;
	private String time;
	public ChattimeVo() {}
	public ChattimeVo(int cnum, int clnum, String time) {
		super();
		this.cnum = cnum;
		this.clnum = clnum;
		this.time = time;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getClnum() {
		return clnum;
	}
	public void setClnum(int clnum) {
		this.clnum = clnum;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
