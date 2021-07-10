package com.findMember.domain;

public class FindDTO {
	private int find_number;
	private String find_title, find_content;
	private String find_regdate;
	private int find_hit;
	private String member_id;
	
	public int getFind_number() {
		return find_number;
	}
	public void setFind_number(int find_number) {
		this.find_number = find_number;
	}
	public String getFind_title() {
		return find_title;
	}
	public void setFind_title(String find_title) {
		this.find_title = convert(find_title);
	}
	public String getFind_content() {
		return find_content;
	}
	public void setFind_content(String find_content) {
		this.find_content = convert(find_content);
	}
	public String getFind_regdate() {
		return find_regdate;
	}
	public void setFind_regdate(String find_regdate) {
		this.find_regdate = find_regdate;
	}
	public int getFind_hit() {
		return find_hit;
	}
	public void setFind_hit(int find_hit) {
		this.find_hit = find_hit;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "findDTO [find_number=" + find_number + ", find_title=" + find_title + ", find_content="
				+ find_content + ", find_regdate=" + find_regdate + ", find_hit=" + find_hit + ", member_id="
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
