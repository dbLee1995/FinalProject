package fproject.app.fproject.vo;

public class ChatstateVo{
	private int alarm;
	private int favo;
	private int clnum;
	private int num;
	public ChatstateVo() {}
	public ChatstateVo(int alarm, int favo, int clnum, int num) {
		super();
		this.alarm = alarm;
		this.favo = favo;
		this.clnum = clnum;
		this.num = num;
	}
	public int getAlarm() {
		return alarm;
	}
	public void setAlarm(int alarm) {
		this.alarm = alarm;
	}
	public int getFavo() {
		return favo;
	}
	public void setFavo(int favo) {
		this.favo = favo;
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
