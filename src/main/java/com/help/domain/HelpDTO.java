package com.help.domain;

public class HelpDTO {
	private int help_number;
	private String help_title, help_content;
	private String help_regdate;
	private int help_hit;
	private String admin_id;
	
	public int getHelp_number() {
		return help_number;
	}
	public void setHelp_number(int help_number) {
		this.help_number = help_number;
	}
	public String getHelp_title() {
		return help_title;
	}
	public void setHelp_title(String help_title) {
		this.help_title = convert(help_title);
	}
	public String getHelp_content() {
		return help_content;
	}
	public void setHelp_content(String help_content) {
		this.help_content = convert(help_content);
	}
	public String getHelp_regdate() {
		return help_regdate;
	}
	public void setHelp_regdate(String help_regdate) {
		this.help_regdate = help_regdate;
	}
	public int getHelp_hit() {
		return help_hit;
	}
	public void setHelp_hit(int help_hit) {
		this.help_hit = help_hit;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	@Override
	public String toString() {
		return "HostDTO [help_number=" + help_number + ", help_title=" + help_title + ", help_content="
				+ help_content + ", help_regdate=" + help_regdate + ", help_hit=" + help_hit + ", admin_id="
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