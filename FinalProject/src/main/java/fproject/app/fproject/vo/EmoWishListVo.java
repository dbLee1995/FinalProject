package fproject.app.fproject.vo;


public class EmoWishListVo {
	private int rnum;
	private int num;
	private int emogNum;
	private String category;
	private String name;
	private int price;
	
	public EmoWishListVo() {
		super();
	}
	public EmoWishListVo(int rnum, int num, int emogNum, String category, String name, int price) {
		super();
		this.rnum = rnum;
		this.num = num;
		this.emogNum = emogNum;
		this.category = category;
		this.name = name;
		this.price = price;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getEmogNum() {
		return emogNum;
	}
	public void setEmogNum(int emogNum) {
		this.emogNum = emogNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
