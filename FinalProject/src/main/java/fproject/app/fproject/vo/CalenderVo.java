package fproject.app.fproject.vo;

import java.sql.Date;

public class CalenderVo{
	 private int anivernum;
	 private int num;
	 private String anivername;
	 private Date aniverregdate;
	 private String anivercontent;
	 private int aniverstate;
	 private int alarm;
	 public CalenderVo() {}
	public CalenderVo(int anivernum, int num, String anivername, Date aniverregdate, String anivercontent,
			int aniverstate, int alarm) {
		super();
		this.anivernum = anivernum;
		this.num = num;
		this.anivername = anivername;
		this.aniverregdate = aniverregdate;
		this.anivercontent = anivercontent;
		this.aniverstate = aniverstate;
		this.alarm = alarm;
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
	public Date getAniverregdate() {
		return aniverregdate;
	}
	public void setAniverregdate(Date aniverregdate) {
		this.aniverregdate = aniverregdate;
	}
	public String getAnivercontent() {
		return anivercontent;
	}
	public void setAnivercontent(String anivercontent) {
		this.anivercontent = anivercontent;
	}
	public int getAniverstate() {
		return aniverstate;
	}
	public void setAniverstate(int aniverstate) {
		this.aniverstate = aniverstate;
	}
	public int getAlarm() {
		return alarm;
	}
	public void setAlarm(int alarm) {
		this.alarm = alarm;
	}
	 
}
