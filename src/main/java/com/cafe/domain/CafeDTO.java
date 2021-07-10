package com.cafe.domain;

public class CafeDTO { 
	private String cafe_id; // 카페_아이디
	private String cafe_name; // 카페_이름
	private String cafe_pwd; // 카페_패스워드
	private String cafe_linescription; // 카페_한줄설명서
	private String cafe_spaceintroduction; // 카페_공간소개
	private String cafe_address;	 // 카페_주소
	private String cafe_contact; // 카페_연락처
	private String cafe_time; // 카페_영업시간
	private String cafe_rest; // 카페_휴무일
	private String cafe_infrainformation; // 카페_시설안내
	private String cafe_note; // 카페_유의사항
	private String cafe_refund; // 카페_환불정책
	private String cafe_regdate; // 카페_등록일
	private String cafe_image1; // 카페_s이미지1번
	private String cafe_image2; // 카페_이미지2번
	private String cafe_image3; // 카페_이미지3번
	private String cafe_hashtag1; // 카페_해쉬태그 1번
	private String cafe_hashtag2; // 카페_해쉬태그 2번
	private String cafe_hashtag3; // 카페_해시태그 3번
	private String cafe_hashtag4; // 카페_해시태그 4번
	private String cafe_category1; // 카페_카테고리 1번
	private int cafe_category1Price; // 카페_카테고리 1번_가격
	private String cafe_category2; // 카페_카테고리 2번
	private int cafe_category2Price; // 카페_카테고리 2번_가격
	public String getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(String cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getCafe_name() {
		return cafe_name;
	}
	public void setCafe_name(String cafe_name) {
		this.cafe_name = cafe_name;
	}
	public String getCafe_pwd() {
		return cafe_pwd;
	}
	public void setCafe_pwd(String cafe_pwd) {
		this.cafe_pwd = cafe_pwd;
	}
	public String getCafe_linescription() {
		return cafe_linescription;
	}
	public void setCafe_linescription(String cafe_linescription) {
		this.cafe_linescription = cafe_linescription;
	}
	public String getCafe_spaceintroduction() {
		return cafe_spaceintroduction;
	}
	public void setCafe_spaceintroduction(String cafe_spaceintroduction) {
		this.cafe_spaceintroduction = cafe_spaceintroduction;
	}
	public String getCafe_address() {
		return cafe_address;
	}
	public void setCafe_address(String cafe_address) {
		this.cafe_address = cafe_address;
	}
	public String getCafe_contact() {
		return cafe_contact;
	}
	public void setCafe_contact(String cafe_contact) {
		this.cafe_contact = cafe_contact;
	}
	public String getCafe_time() {
		return cafe_time;
	}
	public void setCafe_time(String cafe_time) {
		this.cafe_time = cafe_time;
	}
	public String getCafe_rest() {
		return cafe_rest;
	}
	public void setCafe_rest(String cafe_rest) {
		this.cafe_rest = cafe_rest;
	}
	public String getCafe_infrainformation() {
		return cafe_infrainformation;
	}
	public void setCafe_infrainformation(String cafe_infrainformation) {
		this.cafe_infrainformation = cafe_infrainformation;
	}
	public String getCafe_note() {
		return cafe_note;
	}
	public void setCafe_note(String cafe_note) {
		this.cafe_note = cafe_note;
	}
	public String getCafe_refund() {
		return cafe_refund;
	}
	public void setCafe_refund(String cafe_refund) {
		this.cafe_refund = cafe_refund;
	}
	public String getCafe_regdate() {
		return cafe_regdate;
	}
	public void setCafe_regdate(String cafe_regdate) {
		this.cafe_regdate = cafe_regdate;
	}
	public String getCafe_image1() {
		return cafe_image1;
	}
	public void setCafe_image1(String cafe_image1) {
		this.cafe_image1 = cafe_image1;
	}
	public String getCafe_image2() {
		return cafe_image2;
	}
	public void setCafe_image2(String cafe_image2) {
		this.cafe_image2 = cafe_image2;
	}
	public String getCafe_image3() {
		return cafe_image3;
	}
	public void setCafe_image3(String cafe_image3) {
		this.cafe_image3 = cafe_image3;
	}
	public String getCafe_hashtag1() {
		return cafe_hashtag1;
	}
	public void setCafe_hashtag1(String cafe_hashtag1) {
		this.cafe_hashtag1 = cafe_hashtag1;
	}
	public String getCafe_hashtag2() {
		return cafe_hashtag2;
	}
	public void setCafe_hashtag2(String cafe_hashtag2) {
		this.cafe_hashtag2 = cafe_hashtag2;
	}
	public String getCafe_hashtag3() {
		return cafe_hashtag3;
	}
	public void setCafe_hashtag3(String cafe_hashtag3) {
		this.cafe_hashtag3 = cafe_hashtag3;
	}
	public String getCafe_hashtag4() {
		return cafe_hashtag4;
	}
	public void setCafe_hashtag4(String cafe_hashtag4) {
		this.cafe_hashtag4 = cafe_hashtag4;
	}
	public String getCafe_category1() {
		return cafe_category1;
	}
	public void setCafe_category1(String cafe_category1) {
		this.cafe_category1 = cafe_category1;
	}
	public int getCafe_category1Price() {
		return cafe_category1Price;
	}
	public void setCafe_category1Price(int cafe_category1Price) {
		this.cafe_category1Price = cafe_category1Price;
	}
	public String getCafe_category2() {
		return cafe_category2;
	}
	public void setCafe_category2(String cafe_category2) {
		this.cafe_category2 = cafe_category2;
	}
	public int getCafe_category2Price() {
		return cafe_category2Price;
	}
	public void setCafe_category2Price(int cafe_category2Price) {
		this.cafe_category2Price = cafe_category2Price;
	}
	@Override
	public String toString() {
		return "Cafe [cafe_id=" + cafe_id + ", cafe_name=" + cafe_name + ", cafe_pwd=" + cafe_pwd
				+ ", cafe_linescription=" + cafe_linescription + ", cafe_spaceintroduction=" + cafe_spaceintroduction
				+ ", cafe_address=" + cafe_address + ", cafe_contact=" + cafe_contact + ", cafe_time=" + cafe_time
				+ ", cafe_rest=" + cafe_rest + ", cafe_infrainformation=" + cafe_infrainformation + ", cafe_note="
				+ cafe_note + ", cafe_refund=" + cafe_refund + ", cafe_regdate=" + cafe_regdate + ", cafe_image1="
				+ cafe_image1 + ", cafe_image2=" + cafe_image2 + ", cafe_image3=" + cafe_image3 + ", cafe_hashtag1="
				+ cafe_hashtag1 + ", cafe_hashtag2=" + cafe_hashtag2 + ", cafe_hashtag3=" + cafe_hashtag3
				+ ", cafe_hashtag4=" + cafe_hashtag4 + ", cafe_category1=" + cafe_category1 + ", cafe_category1Price="
				+ cafe_category1Price + ", cafe_category2=" + cafe_category2 + ", cafe_category2Price="
				+ cafe_category2Price + "]";
	}
}
