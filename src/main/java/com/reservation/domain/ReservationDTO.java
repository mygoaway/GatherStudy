package com.reservation.domain;

public class ReservationDTO {
	private int reser_number;
	private int reser_price;
	private String reser_date;
	private String reser_time;
	private String reser_usertime;
	private String reser_category;
	private int reser_person;
	public int reser_categoryPersonPrice;
	private String reser_request;
	private String reser_orderDate;
	private String reser_status;
	private String member_id;
	private String cafe_id;
	private String reser_evaluationCheck;
	
	public String getReser_time() {
		return reser_time;
	}
	public void setReser_time(String reser_time) {
		this.reser_time = convert(reser_time);
	}
	public int getReser_number() {
		return reser_number;
	}
	public void setReser_number(int reser_number) {
		this.reser_number = reser_number;
	}
	public int getReser_price() {
		return reser_price;
	}
	public void setReser_price(int reser_price) {
		this.reser_price = reser_price;
	}
	public String getReser_date() {
		return reser_date;
	}
	public void setReser_date(String reser_date) {
		this.reser_date = convert(reser_date);
	}
	public String getReser_usertime() {
		return reser_usertime;
	}
	public void setReser_usertime(String reser_usertime) {
		this.reser_usertime = convert(reser_usertime);
	}
	public String getReser_category() {
		return reser_category;
	}
	public void setReser_category(String reser_category) {
		this.reser_category = convert(reser_category);
	}
	public int getReser_person() {
		return reser_person;
	}
	public void setReser_person(int reser_person) {
		this.reser_person = reser_person;
	}
	public String getReser_request() {
		return reser_request;
	}
	public void setReser_request(String reser_request) {
		this.reser_request = convert(reser_request);
	}
	public String getReser_orderDate() {
		return reser_orderDate;
	}
	public void setReser_orderDate(String reser_orderDate) {
		this.reser_orderDate = reser_orderDate;
	}
	public String getReser_status() {
		return reser_status;
	}
	public void setReser_status(String reser_status) {
		this.reser_status = reser_status;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getReser_evaluationCheck() {
		return reser_evaluationCheck;
	}
	public void setReser_evaluationCheck(String reser_evaluationCheck) {
		this.reser_evaluationCheck = reser_evaluationCheck;
	}
	
	public int getReser_categoryPersonPrice() {
		return reser_categoryPersonPrice;
	}
	public void setReser_categoryPersonPrice(int reser_categoryPersonPrice) {
		this.reser_categoryPersonPrice = reser_categoryPersonPrice;
	}
	@Override
	public String toString() {
		return "ReservationDTO [reser_number=" + reser_number + ", reser_price=" + reser_price + ", reser_date="
				+ reser_date + ", reser_time=" + reser_time + ", reser_usertime=" + reser_usertime + ", reser_category="
				+ reser_category + ", reser_person=" + reser_person + ", reser_request=" + reser_request
				+ ", reser_orderDate=" + reser_orderDate + ", reser_status=" + reser_status + ", member_id=" + member_id
				+ ", cafe_id=" + cafe_id + ", reser_evaluationCheck=" + reser_evaluationCheck + "]";
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
