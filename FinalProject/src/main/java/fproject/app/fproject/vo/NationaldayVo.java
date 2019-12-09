package fproject.app.fproject.vo;

import java.sql.Date;

public class NationaldayVo{
	private int anivernum;
	private String anivername;
	private String aniverstartdate;
	private String aniverenddate;
	private String anivercontent;
	public NationaldayVo() {}
	public NationaldayVo(int anivernum, String anivername, String aniverstartdate, String aniverenddate,
			String anivercontent) {
		super();
		this.anivernum = anivernum;
		this.anivername = anivername;
		this.aniverstartdate = aniverstartdate;
		this.aniverenddate = aniverenddate;
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
	
	
}
