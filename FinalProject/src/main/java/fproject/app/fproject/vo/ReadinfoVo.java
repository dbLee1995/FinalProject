package fproject.app.fproject.vo;

public class ReadinfoVo{
	private int cnum;
	private int clnum;
	private int num;
	public ReadinfoVo() {}
	public ReadinfoVo(int cnum, int clnum, int num) {
		super();
		this.cnum = cnum;
		this.clnum = clnum;
		this.num = num;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
