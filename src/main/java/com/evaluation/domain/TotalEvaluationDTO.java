package com.evaluation.domain;

public class TotalEvaluationDTO {
	private String  order_eval_content;
	private int order_eval_score, order_eval_id;
	private String order_eval_regdate;
	private String member_id;
	private String cafe_id;
	private String cafe_name;
	private String cafe_image1;

	public int getOrder_eval_id() {
		return order_eval_id;
	}
	public void setOrder_eval_id(int order_eval_id) {
		this.order_eval_id = order_eval_id;
	}
	public String getOrder_eval_regdate() {
		return order_eval_regdate;
	}
	public void setOrder_eval_regdate(String order_eval_regdate) {
		this.order_eval_regdate = order_eval_regdate;
	}
	public String getOrder_eval_content() {
		return order_eval_content;
	}
	public void setOrder_eval_content(String order_eval_content) {
		this.order_eval_content = order_eval_content;
	}
	public int getOrder_eval_score() {
		return order_eval_score;
	}
	public void setOrder_eval_score(int order_eval_score) {
		this.order_eval_score = order_eval_score;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getCafe_image1() {
		return cafe_image1;
	}
	public void setCafe_image1(String cafe_image1) {
		this.cafe_image1 = cafe_image1;
	}
	public String getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}
	@Override
	public String toString() {
		return "TotalEvaluationDTO [order_eval_content=" + order_eval_content + ", order_eval_score=" + order_eval_score
				+ ", order_eval_id=" + order_eval_id + ", order_eval_regdate=" + order_eval_regdate + ", member_id="
				+ member_id + ", cafe_id=" + cafe_id + ", cafe_name=" + cafe_name + ", cafe_image1=" + cafe_image1
				+ "]";
	}
	
	
	
}
