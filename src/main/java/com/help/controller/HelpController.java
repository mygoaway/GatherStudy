package com.help.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.help.dao.HelpDAO;
import com.help.domain.HelpDTO;
import com.help.util.PagingUtil;

@Controller
public class HelpController{

	private Log log = LogFactory.getLog(getClass());
	HelpDAO dao;
	
	@Required
	@Autowired
	public void setDao(HelpDAO dao) {
		this.dao = dao;
	}

	// By Ysh_도움말 호출관련 메서드_20210503
	@RequestMapping(value="help/list.do", method = RequestMethod.GET)
	public String helpList(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
		    @RequestParam(value="keyField",defaultValue="") String keyField,
		    @RequestParam(value="keyWord",defaultValue="") String keyWord, Model model) {
		if(log.isDebugEnabled()) { 
			log.info("HelpController의 helpList()호출됨");
			log.debug("currentPage:"+currentPage); 
			log.debug("keyField:"+keyField);
			log.debug("keyWord:"+keyWord);
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);
		
		int count=dao.getRowCount(map);
		log.info(count);
		PagingUtil page=new PagingUtil(keyField, keyWord, currentPage,count,10,3,"list.do");
		
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<HelpDTO> list=null;
		if(count > 0) {
			System.out.println("리스트 담김");
			list=dao.helpList(map);
		}else {
			list=Collections.emptyList();
		}
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("pagingHtml",page.getPagingHtml());
		return "help/list";
	}
	
	// By Ysh_도움말 상세페이지로 이동 관련 메서드_20210503
	@RequestMapping(value="help/details.do", method = RequestMethod.GET)
	public String helpDetails(@RequestParam int help_number, Model model) {
		log.info("HelpController의 helpDetails()호출됨");
		dao.updateReadcntUp(help_number); 
		HelpDTO help = dao.retrieveGet(help_number);
		model.addAttribute("help", help);
		return "help/details";
	}	
	
	// By Ysh_도움말 작성하기_20210503
	@RequestMapping(value="help/write.do", method = RequestMethod.POST)
	@ResponseBody
	public String helpWrite(@ModelAttribute HelpDTO helpDTO) {
		log.info("HelpController의 helpWrite()호출됨");
		
		dao.helpWrite(helpDTO);
		return "success";
	}	
	
	// By Ysh_도움말 삭제하기 폼으로 이동_20210503
	@RequestMapping(value="help/write.do", method = RequestMethod.GET)
	public String helpWriteForm() {
		log.info("HelpController의 helpWriteForm()호출됨");
		return "help/write";
	}		
	
	// By Ysh_도움말 수정하기 폼으로 이동_20210503
	@RequestMapping(value="help/update.do", method = RequestMethod.GET)
	public String helpUpdateForm(@RequestParam("help_number") int help_number, Model model) {
		log.info("HelpController의 helpUpdateForm()호출됨");
		HelpDTO help = dao.retrieveGet(help_number);
		model.addAttribute("help", help);
		return "help/update";
	}	
	
	// By Ysh_도움말 수정하기_20210503
	@RequestMapping(value="help/update.do", method = RequestMethod.POST)
	@ResponseBody
	public String helpUpdate(@ModelAttribute HelpDTO helpDTO) {
		log.info("HelpController의 helpUpdate()호출됨");
		dao.helpUpdate(helpDTO);
		return "success";
	}
	
	// By Jay_도움말 삭제하기_20210503
	@RequestMapping(value="help/delete.do", method = RequestMethod.GET)
	public String helpDelete(@RequestParam("help_number") int help_number) {
		log.info("HelpController의 helpDelete()호출됨");
		dao.helpDelete(help_number);
		return "redirect:/help/list.do";
	}	
}
