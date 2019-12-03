package fproject.app.fproject.vo;

import java.sql.Date;

public class NationaldayVo{
	private int anivernum;
	private String anivername;
	private Date aniverregdate;
	private String anivercontent;
	public NationaldayVo() {}
	public NationaldayVo(int anivernum, String anivername, Date aniverregdate, String anivercontent) {
		super();
		this.anivernum = anivernum;
		this.anivername = anivername;
		this.aniverregdate = aniverregdate;
		this.anivercontent = anivercontent;
	}
	public int getAnivernum() {
		return anivernum;
	}
	public void setAnivernum(int anivernum) {
		this.anivernum = anivernum;
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
	
}
