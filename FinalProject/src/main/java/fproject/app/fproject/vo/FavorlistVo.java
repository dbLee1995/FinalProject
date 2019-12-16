package fproject.app.fproject.vo;

public class FavorlistVo{
	private int favornum;
	private int favor;
	private int emognum;
	private int num;
	public FavorlistVo() {}
	public FavorlistVo(int favornum, int favor, int emognum, int num) {
		super();
		this.favornum = favornum;
		this.favor = favor;
		this.emognum = emognum;
		this.num = num;
	}
	public int getFavornum() {
		return favornum;
	}
	public void setFavornum(int favornum) {
		this.favornum = favornum;
	}
	public int getFavor() {
		return favor;
	}
	public void setFavor(int favor) {
		this.favor = favor;
	}
	public int getEmognum() {
		return emognum;
	}
	public void setEmognum(int emognum) {
		this.emognum = emognum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}
