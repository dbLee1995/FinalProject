package fproject.app.fproject.vo;

public class PresentVo{
	private int presnum;
	private int emognum;
	private int gnum;
	private int rnum;
	public PresentVo() {}
	public PresentVo(int presnum, int emognum, int gnum, int rnum) {
		super();
		this.presnum = presnum;
		this.emognum = emognum;
		this.gnum = gnum;
		this.rnum = rnum;
	}
	public int getPresnum() {
		return presnum;
	}
	public void setPresnum(int presnum) {
		this.presnum = presnum;
	}
	public int getEmognum() {
		return emognum;
	}
	public void setEmognum(int emognum) {
		this.emognum = emognum;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
}
