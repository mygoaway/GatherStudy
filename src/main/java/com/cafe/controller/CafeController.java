package com.cafe.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe.dao.CafeDAO;
import com.cafe.domain.CafeDTO;
import com.evaluation.dao.EvaluationDAO;
import com.evaluation.domain.EvaluationDTO;
import com.evaluation.domain.EvaluationReplyDTO;
import com.evaluation.domain.TotalEvaluationDTO;
import com.reservation.dao.ReservationDAO;
import com.reservation.domain.MemberOrderListDTO;

@Controller
public class CafeController{

	private Log log = LogFactory.getLog(getClass());
	private final CafeDAO cafeDAO;
	private final EvaluationDAO evaluationDAO;
	private final ReservationDAO reservationDAO;

	@Autowired
	public CafeController(CafeDAO cafeDAO, EvaluationDAO evaluationDAO, ReservationDAO reservationDAO) {
		super();
		this.cafeDAO = cafeDAO;
		this.evaluationDAO = evaluationDAO;
		this.reservationDAO = reservationDAO;
	}

	// By Jay_카페구경하기 페이지 출력하기_20210423
	@RequestMapping("/cafe/list.do")
	public String cafeEntireList(Model model){
		log.info("CafeController의 cafeEntireList()호출됨");
		List<CafeDTO> list = cafeDAO.lookcafe();
		List<CafeDTO> newList = cafeDAO.newCafe();
		model.addAttribute("list", list);
		model.addAttribute("newList", newList);
		return "cafe/list";
	}
	
	// By Jay_카페 상세페이지 출력하기_20210423
	@RequestMapping("cafe/detail.do")
	public String listBoard(@RequestParam String cafe_id, Model model){
		log.info("Controller의 cafeDetails()호출됨");
		CafeDTO cafe = cafeDAO.list(cafe_id);
		List<EvaluationDTO> evaluation_list = evaluationDAO.evaluation_list(cafe_id);
		List<EvaluationReplyDTO> evaluation_reply_list = evaluationDAO.evaluation_reply_list(cafe_id);
		int count = evaluationDAO.getEvaluationRows(cafe_id);
		model.addAttribute("cafe", cafe);
		model.addAttribute("evaluation_list", evaluation_list);
		model.addAttribute("evaluation_reply_list", evaluation_reply_list);
		model.addAttribute("count", count);
		return "cafe/detail";
	}
	
	// By Jay_호스트 로그인 페이지로 이동_20210503
	@RequestMapping(value="cafe/login.do", method = RequestMethod.GET)
	public String cafeLoginForm(){
		log.info("CafeController의 cafeLoginForm()호출됨");
		return "cafe/cafe_login";
	}
	
	// By Jay_호스트 로그인 하기_20210503
	@RequestMapping(value="cafe/login.do", method = RequestMethod.POST)
	@ResponseBody
	public String cafeLogin(@ModelAttribute CafeDTO cafe, HttpSession session, HttpServletRequest request,
			HttpServletResponse response){
		log.info("CafeController의 cafeLogin()호출됨");
		
		// cafe_login.jsp에서 아이디 기억하기 여부(true/false) 가져오기
		String cafe_check = request.getParameter("remember_cafeId");
		
		String result = null;
		CafeDTO cafeInformation = cafeDAO.getCafe(cafe);
		log.info(cafeInformation);
		if(cafeInformation == null) {
			result= "idFail";
			return result;
		}
		
		if(cafe.getCafe_pwd().equals(cafeInformation.getCafe_pwd())) {
			session.setAttribute("loginCafe", cafeInformation);
			result = "success";
			
			if(cafe_check.equals("true")) {
				Cookie cookie = new Cookie("cafe_check", cafe.getCafe_id());
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("cafe_check", cafe.getCafe_id());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		} else {
			result = "pwdFail";
		}
		log.info(result);
		return result;
	}	
	
	// By Jay_스터디 카페 당 예약내역 불러오기_20210503
	@RequestMapping(value="cafe/reservationList.do", method = RequestMethod.GET)
	public String cafe_reservationList(@RequestParam String cafe_id, Model model) {
	   log.info("CafeController의 cafe_reservationList()호출됨");
	   
	   List<MemberOrderListDTO> OrderList = reservationDAO.getCafeOrders(cafe_id);
	   reservationDAO.orderUsed();
	   
	   model.addAttribute("OrderList", OrderList);

	   return "cafe/reservationList";
	 }
	
	// By Jay_스터디 카페에서 예약 내역 취소하기_20210503
	@RequestMapping(value="cafe/reservationCancel.do", method = RequestMethod.GET)
	public String orderCancel(@RequestParam String cafe_id, @RequestParam String reser_number, Model model) {
	   log.info("CafeController의 orderCancel()호출됨");
	   reservationDAO.orderCancel(reser_number);
	   
	   List<MemberOrderListDTO> OrderList = reservationDAO.getCafeOrders(cafe_id);

	   model.addAttribute("OrderList", OrderList);
	   return "cafe/reservationList";
	 }
	
	// By Jay_스터디 카페당 구매후기 관련 리스트로 이동_20210503
	@RequestMapping(value="cafe/evaluationList.do", method = RequestMethod.GET)
	public String orderEvaluationList(@RequestParam String cafe_id, Model model) {
	   log.info("CafeController의 cafeEvaluationList()호출됨");
	   
	   List<MemberOrderListDTO> OrderList = reservationDAO.getCafeOrdersUsed(cafe_id);  
	   List<EvaluationDTO> evaluationList = evaluationDAO.evaluation_list(cafe_id);
	   List<EvaluationReplyDTO> replyList = evaluationDAO.evaluation_reply_list(cafe_id);
		
	   model.addAttribute("evaluationList", evaluationList);  
	   model.addAttribute("replyList", replyList); 
	   model.addAttribute("OrderList", OrderList);
	   
	   log.info(evaluationList);
	   log.info(replyList);
	   
	   return "cafe/evaluationList";
	 }
	
	
	// By Jay_스터디 카페 호스트가 구매후기 관련 댓글 작성 페이지로 이동_20210504
	@RequestMapping(value="cafe/evaluationReplyWrite.do", method = RequestMethod.GET)
	public String orderEvaluationReplyWriteForm(@RequestParam int reser_number, Model model) {
	   log.info("MemberController의 orderEvaluationReplyWriteForm()호출됨");
	   EvaluationDTO evaluation = reservationDAO.getEvaluationOneByReser_number(reser_number);
	   log.info(evaluation);
	   model.addAttribute("evaluation", evaluation);
	   
	   return "cafe/evaluationReplyWrite";
	 }
	
	// By Jay_스터디 카페 호스트가 구매후기 관련 댓글 작성하기_20210505
	@RequestMapping(value="cafe/evaluationReplyWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public String orderEvaluationReplyWrite(@ModelAttribute EvaluationReplyDTO EvaluationReplyDTO) {
	   log.info("MemberController의 orderEvaluationReplyWrite()호출됨");
	   evaluationDAO.evaluationReplyWrite(EvaluationReplyDTO);

	   return "success";
	 }
	
	
	
	
	
	
	
}



