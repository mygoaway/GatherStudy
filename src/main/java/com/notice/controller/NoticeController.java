package com.notice.controller;

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

import com.notice.dao.NoticeDAO;
import com.notice.domain.NoticeDTO;
import com.notice.util.PagingUtil;

@Controller
public class NoticeController{

	private Log log = LogFactory.getLog(getClass());
	private final NoticeDAO noticeDAO;
	
	@Autowired
	public NoticeController(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	// By Jay_공지사항 호출관련 메서드_20210415
	@RequestMapping(value="notice/list.do", method = RequestMethod.GET)
	public String noticeList(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
		    @RequestParam(value="keyField",defaultValue="") String keyField,
		    @RequestParam(value="keyWord",defaultValue="") String keyWord, Model model) {
		if(log.isDebugEnabled()) { 
			log.info("NoticeController의 noticeList()호출됨");
			log.debug("currentPage:"+currentPage); 
			log.debug("keyField:"+keyField);
			log.debug("keyWord:"+keyWord);
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);
		
		int count=noticeDAO.getRowCount(map);
		log.info(count);
		PagingUtil page=new PagingUtil(keyField, keyWord, currentPage,count,10,3,"list.do");
		
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<NoticeDTO> list=null;
		if(count > 0) {
			list=noticeDAO.noticeList(map);
		}else {
			list=Collections.emptyList();
		}
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("pagingHtml",page.getPagingHtml());
		return "/notice/list";
	}
		
	// By Jay_공지사항 작성하기 폼으로 이동_20210417
	@RequestMapping(value="notice/write.do", method = RequestMethod.GET)
	public String noticeWriteForm() {
		log.info("NoticeController의 noticeWriteForm()호출됨");
		return "notice/write";
	}		
	
	// By Jay_공지사항 작성하기_20210416
	@RequestMapping(value="notice/write.do", method = RequestMethod.POST)
	@ResponseBody
	public String noticeWrite(@ModelAttribute NoticeDTO noticeDTO) {
		log.info("NoticeController의 noticeWrite()호출됨");
	
		noticeDAO.noticeWrite(noticeDTO);	
		return "success";
	}	
	
	// By Jay_공지사항 상세페이지로 이동 관련 메서드_20210415
	@RequestMapping(value="notice/details.do", method = RequestMethod.GET)
	public String noticeDetails(@RequestParam int notice_number, Model model) {
		log.info("NoticeController의 noticeDetails()호출됨");
		noticeDAO.updateReadcnt(notice_number); 
		NoticeDTO notice = noticeDAO.retrieve(notice_number);
		model.addAttribute("notice", notice);
		return "notice/details";
	}	
	
	// By Jay_공지사항 수정하기 폼으로 이동_20210417
	@RequestMapping(value="notice/update.do", method = RequestMethod.GET)
	public String noticeUpdateForm(@RequestParam("notice_number") int notice_number, Model model) {
		log.info("NoticeController의 noticeUpdateForm()호출됨");
		NoticeDTO notice = noticeDAO.retrieve(notice_number);
		model.addAttribute("notice", notice);
		return "notice/update";
	}	
	
	// By Jay_공지사항 수정하기_20210417
	@RequestMapping(value="notice/update.do", method = RequestMethod.POST)
	@ResponseBody
	public String noticeUpdate(@ModelAttribute NoticeDTO noticeDTO) {
		log.info("NoticeController의 noticeUpdate()호출됨");
		noticeDAO.noticeUpdate(noticeDTO);
		return "success";
	}
	
	// By Jay_공지사항 삭제하기_20210417
	@RequestMapping(value="notice/delete.do", method = RequestMethod.GET)
	public String noticeDelete(@RequestParam("notice_number") int notice_number) {
		log.info("NoticeController의 noticeDelete()호출됨");
		noticeDAO.noticeDelete(notice_number);
		return "redirect:/notice/list.do";
	}	
}



