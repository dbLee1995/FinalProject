package fproject.app.fproject.vo;

public class ChatlistVo{
	private int clnum;
	private String name;
	public ChatlistVo() {}
	public ChatlistVo(int clnum, String name) {
		super();
		this.clnum = clnum;
		this.name = name;
	}
	public int getClnum() {
		return clnum;
	}
	public void setClnum(int clnum) {
		this.clnum = clnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
