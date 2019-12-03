package fproject.app.fproject.vo;

public class OptionsVo{
	private int optionnum;
	private int num;
	private int fontsize;
	private String theme;
	public OptionsVo() {}
	public OptionsVo(int optionnum, int num, int fontsize, String theme) {
		super();
		this.optionnum = optionnum;
		this.num = num;
		this.fontsize = fontsize;
		this.theme = theme;
	}
	public int getOptionnum() {
		return optionnum;
	}
	public void setOptionnum(int optionnum) {
		this.optionnum = optionnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getFontsize() {
		return fontsize;
	}
	public void setFontsize(int fontsize) {
		this.fontsize = fontsize;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	
}
