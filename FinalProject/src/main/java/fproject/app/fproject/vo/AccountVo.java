package fproject.app.fproject.vo;

public class AccountVo{
	private int num;
	private String id;
	private String pwd;
	public AccountVo() {}
	public AccountVo(int num, String id, String pwd) {
		super();
		this.num = num;
		this.id = id;
		this.pwd = pwd;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}