package com.findMember.domain;

public class FindReplyDTO {
	private int find_reply_number;
	private String find_reply_content;
	private String find_reply_regdate;
	private int find_number;
	private String member_id;
	public int getFind_reply_number() {
		return find_reply_number;
	}
	public void setFind_reply_number(int find_reply_number) {
		this.find_reply_number = find_reply_number;
	}
	public String getFind_reply_content() {
		return find_reply_content;
	}
	public void setFind_reply_content(String find_reply_content) {
		this.find_reply_content = convert(find_reply_content);
	}
	public String getFind_reply_regdate() {
		return find_reply_regdate;
	}
	public void setFind_reply_regdate(String find_reply_regdate) {
		this.find_reply_regdate = find_reply_regdate;
	}
	public int getFind_number() {
		return find_number;
	}
	public void setFind_number(int find_number) {
		this.find_number = find_number;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "FindReplyDTO [find_reply_number=" + find_reply_number + ", find_reply_content=" + find_reply_content
				+ ", find_reply_regdate=" + find_reply_regdate + ", find_number=" + find_number + ", member_id="
				+ member_id + "]";
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
