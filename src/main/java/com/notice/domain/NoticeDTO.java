package com.notice.domain;

public class NoticeDTO {
	private int notice_number;
	private String notice_title, notice_content;
	private String notice_regdate;
	private int notice_hit;
	private String admin_id;
	public int getNotice_number() {
		return notice_number;
	}
	public void setNotice_number(int notice_number) {
		this.notice_number = notice_number;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = convert(notice_title);
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = convert(notice_content);
	}

	public String getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(String notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	@Override
	public String toString() {
		return "NoticeDTO [notice_number=" + notice_number + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_regdate=" + notice_regdate + ", notice_hit=" + notice_hit + ", admin_id="
				+ admin_id + "]";
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
