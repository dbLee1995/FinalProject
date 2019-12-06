package fproject.app.fproject.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.RequestBody;

public class CalenderVo{
	 private int anivernum;
	 private int num;
	 private String anivername;
	 private String aniverstartdate;
	 private String aniverenddate;
	 private String anivercontent;
	 private String aniverimpor;
	 private String anivertype;
	 private String aniverback;
	 private String anivertext;
	 private String allday;
	 private int aniveralarm;
	 public CalenderVo() {}
	public CalenderVo(int anivernum, int num, String anivername, String aniverstartdate, String aniverenddate,
			String anivercontent, String aniverimpor, String anivertype, String aniverback, String anivertext,
			String allday, int aniveralarm) {
		super();
		this.anivernum = anivernum;
		this.num = num;
		this.anivername = anivername;
		this.aniverstartdate = aniverstartdate;
		this.aniverenddate = aniverenddate;
		this.anivercontent = anivercontent;
		this.aniverimpor = aniverimpor;
		this.anivertype = anivertype;
		this.aniverback = aniverback;
		this.anivertext = anivertext;
		this.allday = allday;
		this.aniveralarm = aniveralarm;
	}
	public int getAnivernum() {
		return anivernum;
	}
	public void setAnivernum(int anivernum) {
		this.anivernum = anivernum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getAnivername() {
		return anivername;
	}
	public void setAnivername(String anivername) {
		this.anivername = anivername;
	}
	public String getAniverstartdate() {
		return aniverstartdate;
	}
	public void setAniverstartdate(String aniverstartdate) {
		this.aniverstartdate = aniverstartdate;
	}
	public String getAniverenddate() {
		return aniverenddate;
	}
	public void setAniverenddate(String aniverenddate) {
		this.aniverenddate = aniverenddate;
	}
	public String getAnivercontent() {
		return anivercontent;
	}
	public void setAnivercontent(String anivercontent) {
		this.anivercontent = anivercontent;
	}
	public String getAniverimpor() {
		return aniverimpor;
	}
	public void setAniverimpor(String aniverimpor) {
		this.aniverimpor = aniverimpor;
	}
	public String getAnivertype() {
		return anivertype;
	}
	public void setAnivertype(String anivertype) {
		this.anivertype = anivertype;
	}
	public String getAniverback() {
		return aniverback;
	}
	public void setAniverback(String aniverback) {
		this.aniverback = aniverback;
	}
	public String getAnivertext() {
		return anivertext;
	}
	public void setAnivertext(String anivertext) {
		this.anivertext = anivertext;
	}
	public String getAllday() {
		return allday;
	}
	public void setAllday(String allday) {
		this.allday = allday;
	}
	public int getAniveralarm() {
		return aniveralarm;
	}
	public void setAniveralarm(int aniveralarm) {
		this.aniveralarm = aniveralarm;
	}
	@Override
	public String toString() {
		return "CalenderVo [anivernum=" + anivernum + ", num=" + num + ", anivername=" + anivername
				+ ", aniverstartdate=" + aniverstartdate + ", aniverenddate=" + aniverenddate + ", anivercontent="
				+ anivercontent + ", aniverimpor=" + aniverimpor + ", anivertype=" + anivertype + ", aniverback="
				+ aniverback + ", anivertext=" + anivertext + ", allday=" + allday + ", aniveralarm=" + aniveralarm
				+ "]";
	}
	 
	
	
}
