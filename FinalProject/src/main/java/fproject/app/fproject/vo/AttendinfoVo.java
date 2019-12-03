package fproject.app.fproject.vo;

public class AttendinfoVo{
	private int clnum;
	private int num;
	private int state;
	public AttendinfoVo() {}
	public AttendinfoVo(int clnum, int num, int state) {
		super();
		this.clnum = clnum;
		this.num = num;
		this.state = state;
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
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
