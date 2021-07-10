package com.evaluation.domain;

public class EvaluationReplyDTO {
	private String order_eval_reply_content, order_eval_reply_regdate, cafe_id;
	private int order_eval_id;
	public String getOrder_eval_reply_content() {
		return order_eval_reply_content;
	}
	public void setOrder_eval_reply_content(String order_eval_reply_content) {
		this.order_eval_reply_content = order_eval_reply_content;
	}
	public String getOrder_eval_reply_regdate() {
		return order_eval_reply_regdate;
	}
	public void setOrder_eval_reply_regdate(String order_eval_reply_regdate) {
		this.order_eval_reply_regdate = order_eval_reply_regdate;
	}
	public String getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}
	public int getOrder_eval_id() {
		return order_eval_id;
	}
	public void setOrder_eval_id(int order_eval_id) {
		this.order_eval_id = order_eval_id;
	}
	@Override
	public String toString() {
		return "EvaluationReplyDTO [order_eval_reply_content=" + order_eval_reply_content
				+ ", order_eval_reply_regdate=" + order_eval_reply_regdate + ", cafe_id=" + cafe_id + ", order_eval_id="
				+ order_eval_id + "]";
	}
}
