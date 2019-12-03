package fproject.app.fproject.vo;

import java.sql.Date;

public class AdVo{
	private int adnum;
	private String adname;
	private String adorgimg;
	private String adsaveimg;
	private long adimgsize;
	private Date addadregdate;
	private Date deladregdate;
	public AdVo() {}
	public AdVo(int adnum, String adname, String adorgimg, String adsaveimg, long adimgsize, Date addadregdate,
			Date deladregdate) {
		super();
		this.adnum = adnum;
		this.adname = adname;
		this.adorgimg = adorgimg;
		this.adsaveimg = adsaveimg;
		this.adimgsize = adimgsize;
		this.addadregdate = addadregdate;
		this.deladregdate = deladregdate;
	}
	public int getAdnum() {
		return adnum;
	}
	public void setAdnum(int adnum) {
		this.adnum = adnum;
	}
	public String getAdname() {
		return adname;
	}
	public void setAdname(String adname) {
		this.adname = adname;
	}
	public String getAdorgimg() {
		return adorgimg;
	}
	public void setAdorgimg(String adorgimg) {
		this.adorgimg = adorgimg;
	}
	public String getAdsaveimg() {
		return adsaveimg;
	}
	public void setAdsaveimg(String adsaveimg) {
		this.adsaveimg = adsaveimg;
	}
	public long getAdimgsize() {
		return adimgsize;
	}
	public void setAdimgsize(long adimgsize) {
		this.adimgsize = adimgsize;
	}
	public Date getAddadregdate() {
		return addadregdate;
	}
	public void setAddadregdate(Date addadregdate) {
		this.addadregdate = addadregdate;
	}
	public Date getDeladregdate() {
		return deladregdate;
	}
	public void setDeladregdate(Date deladregdate) {
		this.deladregdate = deladregdate;
	}
	
}
