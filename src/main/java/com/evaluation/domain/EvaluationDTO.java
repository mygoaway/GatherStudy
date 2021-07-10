package com.evaluation.domain;

public class EvaluationDTO {
	private int order_eval_id;
	private String order_eval_title, order_eval_content, order_eval_regdate;
	private int order_eval_score;
	private int reser_number;
	private String cafe_id, member_id;
	
	public int getOrder_eval_id() {
		return order_eval_id;
	}
	public void setOrder_eval_id(int order_eval_id) {
		this.order_eval_id = order_eval_id;
	}
	
	public String getOrder_eval_title() {
		return order_eval_title;
	}
	public void setOrder_eval_title(String order_eval_title) {
		this.order_eval_title = convert(order_eval_title);
	}
	public String getOrder_eval_content() {
		return order_eval_content;
	}
	public void setOrder_eval_content(String order_eval_content) {
		this.order_eval_content = convert(order_eval_content);
	}
	public String getOrder_eval_regdate() {
		return order_eval_regdate;
	}
	public void setOrder_eval_regdate(String order_eval_regdate) {
		this.order_eval_regdate = order_eval_regdate;
	}
	public int getOrder_eval_score() {
		return order_eval_score;
	}
	public void setOrder_eval_score(int order_eval_score) {
		this.order_eval_score = order_eval_score;
	}
	public String getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getReser_number() {
		return reser_number;
	}
	public void setReser_number(int reser_number) {
		this.reser_number = reser_number;
	}
	@Override
	public String toString() {
		return "EvaluationDTO [order_eval_id=" + order_eval_id 
				+ ", order_eval_title=" + order_eval_title + ", order_eval_content=" + order_eval_content
				+ ", order_eval_regdate=" + order_eval_regdate + ", order_eval_score=" + order_eval_score
				+ ", reser_number=" + reser_number + ", cafe_id=" + cafe_id + ", member_id=" + member_id + "]";
	}
	
	private static String convert(String name) {
		 if(name!=null){
	    	   name=name.replaceAll("<","&lt");
	    	   name=name.replaceAll(">","&gt");
	    	   name=name.replaceAll("\\(","&#40");
	    	   name=name.replaceAll("\\)","&#41");
	    	   name=name.replaceAll("\"","&quot");
	    	   name=name.replaceAll("\'","&apos");
	    	     
	       }else{
	    	   return null;
	       }  
		 return name;
	}
}
