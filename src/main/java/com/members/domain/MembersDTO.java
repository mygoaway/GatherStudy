package com.members.domain;

public class MembersDTO {
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String member_joindate;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = convert(member_id);
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_joindate() {
		return member_joindate;
	}
	public void setMember_joindate(String member_joindate) {
		this.member_joindate = member_joindate;
	}
	@Override
	public String toString() {
		return "MembersDTO [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_name=" + member_name
				+ ", member_phone=" + member_phone + ", member_email=" + member_email + ", member_joindate="
				+ member_joindate + "]";
	}
	
	// 모든 DTO에 static 정적메서드를 작성 -> 적용((,),>,<을 입력받지 못하게 코딩)
	// 이 메서드는 현재 있는 클래스에서만 사용이 가능하도록 설정
	private static String convert(String name) {
		 if(name!=null){
	    	   //문자열메서드->replaceAll(1.변경전문자열,2.변경후문자열) 
	    	   name=name.replaceAll("<","&lt");
	    	   name=name.replaceAll(">","&gt");
	    	   //추가 ->eval함수의 ()때문에 (,)
	    	   name=name.replaceAll("\\(","&#40");
	    	   name=name.replaceAll("\\)","&#41");
	    	   //추가2=>"test"<-\"test\" ,\'test\' =>'test'
	    	   name=name.replaceAll("\"","&quot");
	    	   name=name.replaceAll("\'","&apos");
	    	     
	       }else{//name==null
	    	   return null;//입력을 하지 않았따면 더 이상 실행X
	       }  
		 return name;
	}
}
