package fproject.app.fproject.vo;

public class EmoticonVo{
	private int emonum;
	private int emognum;
	private String emoorgimg;
	private String emosaveimg;
	private long emoimgsize;
	public EmoticonVo() {}
	public EmoticonVo(int emonum, int emognum, String emoorgimg, String emosaveimg, long emoimgsize) {
		super();
		this.emonum = emonum;
		this.emognum = emognum;
		this.emoorgimg = emoorgimg;
		this.emosaveimg = emosaveimg;
		this.emoimgsize = emoimgsize;
	}
	public int getEmonum() {
		return emonum;
	}
	public void setEmonum(int emonum) {
		this.emonum = emonum;
	}
	public int getEmognum() {
		return emognum;
	}
	public void setEmognum(int emognum) {
		this.emognum = emognum;
	}
	public String getEmoorgimg() {
		return emoorgimg;
	}
	public void setEmoorgimg(String emoorgimg) {
		this.emoorgimg = emoorgimg;
	}
	public String getEmosaveimg() {
		return emosaveimg;
	}
	public void setEmosaveimg(String emosaveimg) {
		this.emosaveimg = emosaveimg;
	}
	public long getEmoimgsize() {
		return emoimgsize;
	}
	public void setEmoimgsize(long emoimgsize) {
		this.emoimgsize = emoimgsize;
	}
	
}
