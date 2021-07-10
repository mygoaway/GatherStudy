package com.findMember.controller;

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

import com.findMember.dao.FindDAO;
import com.findMember.domain.FindDTO;
import com.findMember.domain.FindReplyDTO;
import com.findMember.util.PagingUtil;

@Controller
public class FindController{

	private Log log = LogFactory.getLog(getClass());
	private final FindDAO findDAO;

	@Autowired
	public FindController(FindDAO findDAO) {
		super();
		this.findDAO = findDAO;
	}

	// By Ysh_멤버구하기 게시글 호출관련 메서드_20210503
	@RequestMapping(value="findMember/list.do", method = RequestMethod.GET)
	public String findList(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
		    @RequestParam(value="keyField",defaultValue="") String keyField,
		    @RequestParam(value="keyWord",defaultValue="") String keyWord,Model model) {
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);
		
		int count=findDAO.getRowCount(map);
		PagingUtil page=new PagingUtil(keyField, keyWord, currentPage,count,10,3,"list.do");
		
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<FindDTO> list=null;
		if(count > 0) {
			System.out.println("리스트 담김");
			list=findDAO.findList(map);
		}else {
			list=Collections.emptyList();
		}
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("pagingHtml",page.getPagingHtml());
		
		return "findMember/list";
	}
	
	// By Ysh_멤버구하기 게시글 작성하기 폼으로 이동_20210503
	@RequestMapping(value="findMember/write.do", method = RequestMethod.GET)
	public String findWriteForm() {
		log.info("findController의 findWriteForm()호출됨");
		return "findMember/write";
	}		
	
	// By Ysh_멤버구하기 게시글 작성하기_20210503
	@RequestMapping(value="findMember/write.do", method = RequestMethod.POST)
	@ResponseBody
	public String findWrite(@ModelAttribute FindDTO findDTO) {
		log.info("findController의 findWrite()호출됨");
		findDAO.findWrite(findDTO);
		
		return "success";
	}	
	
	// By Ysh_멤버구하기 상세페이지로 이동 관련 메서드_20210503
	@RequestMapping(value="findMember/details.do", method = RequestMethod.GET)
	public String findDetails(@RequestParam int find_number, Model model) {
		log.info("findController의 findDetails()호출됨");
		findDAO.readcntIncrease(find_number); 
		FindDTO find = findDAO.getRetrieve(find_number);
		List<FindReplyDTO> replyList = findDAO.replyList(find_number);
		int count = findDAO.replyCount(find_number);

		model.addAttribute("find", find);
		model.addAttribute("replyList", replyList);
		model.addAttribute("count", count);
		
		return "findMember/details";
	}	
	
	// By Ysh_멤버구하기 게시글 수정하기 폼으로 이동_20210503
	@RequestMapping(value="findMember/update.do", method = RequestMethod.GET)
	public String findUpdateForm(@RequestParam("find_number") int find_number, Model model) {
		log.info("findController의 findUpdateForm()호출됨");
		FindDTO find = findDAO.getRetrieve(find_number);
		model.addAttribute("find", find);
		return "findMember/update";
	}	
	
	// By Ysh_멤버구하기 게시글 수정하기_20210503
	@RequestMapping(value="findMember/update.do", method = RequestMethod.POST)
	@ResponseBody
	public String findUpdate(@ModelAttribute FindDTO findDTO) {
		log.info("findController의 findUpdate()호출됨");
		findDAO.findUpdate(findDTO);
		return "success";
	}
	
	// By Ysh_멤버구하기 게시글 삭제하기_20210503
	@RequestMapping(value="findMember/delete.do", method = RequestMethod.GET)
	public String findDelete(@RequestParam("find_number") int find_number) {
		log.info("findController의 findDelete()호출됨");
		findDAO.findDelete(find_number);
		return "redirect:/findMember/list.do";
	}	
	
	
	// By Jay_댓글 작성하기_20210507
	@RequestMapping(value="findMember/replyWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public String findReplyWrite(@ModelAttribute FindReplyDTO findReplyDTO) {
		log.info("findController의 findReplyWrite()호출됨");
		
		if(findReplyDTO.getMember_id() == "") {
			return "fail";
		} else {
			findDAO.replyWrite(findReplyDTO);
		}
		
		return "success";
	}	
	
	// By Jay_댓글 삭제하기_20210503
	@RequestMapping(value="findMember/replyDelete.do", method = RequestMethod.GET)
	public String findReplyDelete(@RequestParam int find_number, @RequestParam int find_reply_number) {
		log.info("findController의 findReplyDelete()호출됨");
		findDAO.replyDelete(find_reply_number);
		return "redirect:/findMember/details.do?find_number="+find_number;
	}	
}





