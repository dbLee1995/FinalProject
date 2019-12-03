package fproject.app.fproject.vo;

import java.sql.Date;

public class QnaVo{
	private int qnanum;
	private int num;
	private int qnacategory;
	private String qnatitle;
	private String qnacontent;
	private Date qnaregdate;
	private String qnaanswer;
	private Date qnaanswerregdate;
	public QnaVo() {}
	public QnaVo(int qnanum, int num, int qnacategory, String qnatitle, String qnacontent, Date qnaregdate,
			String qnaanswer, Date qnaanswerregdate) {
		super();
		this.qnanum = qnanum;
		this.num = num;
		this.qnacategory = qnacategory;
		this.qnatitle = qnatitle;
		this.qnacontent = qnacontent;
		this.qnaregdate = qnaregdate;
		this.qnaanswer = qnaanswer;
		this.qnaanswerregdate = qnaanswerregdate;
	}
	public int getQnanum() {
		return qnanum;
	}
	public void setQnanum(int qnanum) {
		this.qnanum = qnanum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getQnacategory() {
		return qnacategory;
	}
	public void setQnacategory(int qnacategory) {
		this.qnacategory = qnacategory;
	}
	public String getQnatitle() {
		return qnatitle;
	}
	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}
	public String getQnacontent() {
		return qnacontent;
	}
	public void setQnacontent(String qnacontent) {
		this.qnacontent = qnacontent;
	}
	public Date getQnaregdate() {
		return qnaregdate;
	}
	public void setQnaregdate(Date qnaregdate) {
		this.qnaregdate = qnaregdate;
	}
	public String getQnaanswer() {
		return qnaanswer;
	}
	public void setQnaanswer(String qnaanswer) {
		this.qnaanswer = qnaanswer;
	}
	public Date getQnaanswerregdate() {
		return qnaanswerregdate;
	}
	public void setQnaanswerregdate(Date qnaanswerregdate) {
		this.qnaanswerregdate = qnaanswerregdate;
	}
	
}
