package fproject.app.fproject.vo;

public class EmoshopVo{
	private int emognum;
	private int price;
	private String name;
	private String category;
	private String repreImg;
	public EmoshopVo() {}
	public EmoshopVo(int emognum, int price, String name, String category, String repreImg) {
		super();
		this.emognum = emognum;
		this.price = price;
		this.name = name;
		this.category = category;
		this.repreImg = repreImg;
	}
	public int getEmognum() {
		return emognum;
	}
	public void setEmognum(int emognum) {
		this.emognum = emognum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRepreImg() {
		return repreImg;
	}
	public void setRepreImg(String repreImg) {
		this.repreImg = repreImg;
	}
}
