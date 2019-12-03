package fproject.app.fproject.vo;

import java.sql.Date;

public class ProfilesVo{
	private int num;
	private String name;
	private String phone;
	private String email;
	private Date birth;
	private String profileimg;
	private String backimg;
	private String msg;
	public ProfilesVo() {}
	public ProfilesVo(int num, String name, String phone, String email, Date birth, String profileimg, String backimg,
			String msg) {
		super();
		this.num = num;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
		this.profileimg = profileimg;
		this.backimg = backimg;
		this.msg = msg;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	public String getBackimg() {
		return backimg;
	}
	public void setBackimg(String backimg) {
		this.backimg = backimg;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
