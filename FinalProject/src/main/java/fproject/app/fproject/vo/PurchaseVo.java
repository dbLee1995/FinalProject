package fproject.app.fproject.vo;

import java.sql.Date;
import java.util.List;

public class PurchaseVo {
	private int purcahsenum;
	private Date purchasedate;
	private int emognum;
	private int num;
	private List<PurchaseVo> list;
	
	public PurchaseVo(){}

	public PurchaseVo(int purcahsenum, Date purchasedate, int emognum, int num) {
		super();
		this.purcahsenum = purcahsenum;
		this.purchasedate = purchasedate;
		this.emognum = emognum;
		this.num = num;
	}

	public int getPurcahsenum() {
		return purcahsenum;
	}

	public void setPurcahsenum(int purcahsenum) {
		this.purcahsenum = purcahsenum;
	}

	public Date getPurchasedate() {
		return purchasedate;
	}

	public void setPurchasedate(Date purchasedate) {
		this.purchasedate = purchasedate;
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

	public List<PurchaseVo> getList() {
		return list;
	}

	public void setList(List<PurchaseVo> list) {
		this.list = list;
	}
}
