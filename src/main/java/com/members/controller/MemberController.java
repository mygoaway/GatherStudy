package com.members.controller;

import java.io.IOException;
import java.util.HashMap;
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

import com.evaluation.dao.EvaluationDAO;
import com.evaluation.domain.EvaluationDTO;
import com.evaluation.domain.EvaluationReplyDTO;
import com.evaluation.domain.TotalEvaluationDTO;
import com.members.dao.MembersDAO;
import com.members.domain.AdminDTO;
import com.members.domain.MembersDTO;
import com.members.util.SHA256;
import com.reservation.dao.ReservationDAO;
import com.reservation.domain.MemberOrderListDTO;

@Controller
public class MemberController{

	private Log log = LogFactory.getLog(getClass());
	private final MembersDAO membersDAO;
	private final ReservationDAO reservationDAO;
	private final EvaluationDAO evaluationDAO;
	
	@Autowired
	public MemberController(MembersDAO membersDAO, ReservationDAO reservationDAO, EvaluationDAO evaluationDAO) {
		super();
		this.membersDAO = membersDAO;
		this.reservationDAO = reservationDAO;
		this.evaluationDAO = evaluationDAO;
	}
	
	// By Jay_회원가입 폼 호출 하기_20210405
	@RequestMapping(value="/user/register.do", method = RequestMethod.GET)
	public String form() {
		log.info("MemberController의 form()호출됨");
		return "user/registration";
	}
	
	// By Jay_회원가입 이용약관 호출 하기_20210405
	@RequestMapping(value="user/registration_term.do", method = RequestMethod.GET)
	public String registration_term() {
		log.info("MemberController의 registration_term()호출됨");
		return "user/registration_term";
	}	
	
	// By Jay_회원 가입하기_20210405
	   @RequestMapping(value="/user/register.do", method = RequestMethod.POST)
	   @ResponseBody
	   public String signUp(MembersDTO members) {
	      log.info("MemberController의 signUp()호출됨");
	      
	      int result = membersDAO.idCheck(members);

	      // 1이면 아이디 중복, 0이면 아이디 없음
	      if(result == 1) {
	         return "fail";
	      } else if (result == 0) {
	         String nPwd = "";
	         
	         // 암호화 작업 진행
	         try {
	            nPwd = SHA256.pwD(members.getMember_pwd());
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         members.setMember_pwd(nPwd);
	         membersDAO.userJoin(members);
	      }
	      return "success";
	   }

	// By Jay_로그인 폼 호출 하기_20210406
	@RequestMapping(value="/user/login.do", method = RequestMethod.GET)
	public String login() {
		log.info("MemberController의 login()호출됨");
		return "user/user_login";
	}	
	
	// By Jay_로그인 하기_20210406
	@RequestMapping(value="/user/login.do", method = RequestMethod.POST)
	@ResponseBody
	public String singIn (@ModelAttribute MembersDTO members, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		log.info("MemberController의 signIn()호출됨");
		
	      // page_login.jsp에서 아이디 기억하기 name값(remember) 가져오기
	      String user_check = request.getParameter("remember_userId");
	      
	      String result = null;
	      String nPwd = "";
	      
	      // 암호화 작업 진행
	      try {
	         nPwd = SHA256.pwD(members.getMember_pwd());
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      members.setMember_pwd(nPwd);
	      MembersDTO userIdCheck = membersDAO.getOne(members);
	      log.info(userIdCheck);
	      if(userIdCheck == null) {
	         result= "idFail";
	         return result;
	      }
		
		if(members.getMember_pwd().equals(userIdCheck.getMember_pwd())) {
			session.setAttribute("loginUser", userIdCheck);
			result = "success";
			
			if(user_check.equals("true")) {
				Cookie cookie = new Cookie("user_check", members.getMember_id());
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("user_check", members.getMember_id());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
	
		} else {
			result = "pwdFail";
		}
		log.info(result);
		return result;
	}
	
	// By Jay_로그아웃 하기_20210408
	@RequestMapping(value="/user/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession Session) throws IOException {
		log.info("MemberController의 logout()호출됨");
		Session.invalidate();
		return "user/logout";
	}	
	
	// By Lsh_마이페이지에서 로그인한 회원정보 뿌리기_20210429
	@RequestMapping(value="/user/mypage_info.do", method = RequestMethod.GET)
	public String getMember(@RequestParam String member_id, Model model) {
	     log.info("MemberController의 ()호출됨");
	     MembersDTO member=membersDAO.getMember(member_id);
	     model.addAttribute("member", member);
	     return "user/mypage_info";
	}
	   
	// By Lsh_회원 수정 하기 폼으로 이동_20210429
	@RequestMapping(value="/user/mypage_infoModify.do", method = RequestMethod.GET)
	public String Modify(@RequestParam String member_id, Model model) {
	     log.info("MemberController의 ()호출됨");

	     MembersDTO member=membersDAO.getMember(member_id);
	     model.addAttribute("member", member);
	     return "user/mypage_modify";
	}
	   
	// By Lsh_회원 수정 하기_20210429
	@RequestMapping(value="/user/mypage_infoModify.do", method = RequestMethod.POST)
	@ResponseBody
	public String update(@ModelAttribute MembersDTO members) {
		membersDAO.updateMember(members);
	    return "success";
	}
	   
	// By Lsh_회원 탈퇴 하기 폼으로 이동_20210429
	@RequestMapping(value="/user/mypage_infoDelete.do", method = RequestMethod.GET)
	public String deleteForm(@RequestParam String member_id, Model model) {
	    log.info("MemberController의 deleteForm()호출됨");

	    MembersDTO member=membersDAO.getMember(member_id);
	    model.addAttribute("member", member);
	    return "user/mypage_delete";
	}
	   
	// By Lsh_회원 탈퇴 하기_20210429
	@RequestMapping(value="/user/mypage_infoDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String deleteUp(@ModelAttribute MembersDTO members, HttpSession session) {
	    log.info("MemberController의 deleteUp()호출됨");
	      
	    String result = null;
	    MembersDTO userIdCheck = membersDAO.getOne(members);
	      
	    //db에 담겨져있는 비밀번호와 입력한 비밀번호가 같다면 
	    //success(탈퇴) 틀리다면 pwdFail떨어져서 다시입력해야된다
	    if(members.getMember_pwd().equals(userIdCheck.getMember_pwd())) {
	       session.invalidate();
	       membersDAO.deleteMember(members);
	       result = "success";
	    } else {
	       result = "pwdFail";
	    }
	    return result;
	   }
	   
	// By Jay_관리자 로그인창 호출 하기_20210503
	@RequestMapping(value="user/adminLogin.do", method = RequestMethod.GET)
	public String adminLoginForm() {
		log.info("MemberController의 adminLoginform()호출됨");
		return "user/admin_login";
	}
	
	// By Jay_관리자 로그인 하기_20210503
	@RequestMapping(value="user/adminLogin.do", method = RequestMethod.POST)
	@ResponseBody
	public String adminLogin (@ModelAttribute AdminDTO admins, HttpSession session) {
		log.info("MemberController의 adminLogin()호출됨");
		
		String result = null;
		AdminDTO userIdCheck = membersDAO.adminGetOne(admins);
		log.info(userIdCheck);
		if(userIdCheck == null) {
			result= "idFail";
			return result;
		}
		
		if(admins.getAdmin_pwd().equals(userIdCheck.getAdmin_pwd())) {
			session.setAttribute("loginAdmin", userIdCheck);
			result = "success";
			
		} else {
			result = "pwdFail";
		}
		return result;
	}
		
	// By Jay_회원 당 예약내역 불러오기_20210430
	@RequestMapping(value="/user/mypage_reservation.do", method = RequestMethod.GET)
	public String resForm(@RequestParam String member_id, Model model) {
	   log.info("MemberController의 reservationList()호출됨");
	   
	   reservationDAO.orderUsed();
	   List<MemberOrderListDTO> OrderList=reservationDAO.getMemberOrders(member_id);
	   int count = reservationDAO.getOrderNum(member_id);
	   model.addAttribute("OrderList", OrderList);
	   model.addAttribute("count", count);   
	   
	   return "user/mypage_reservation";
	 }
	
	// By Jay_회원 당 예약 내역 취소하기_20210430
	@RequestMapping(value="/user/mypage_reservationCancel.do", method = RequestMethod.GET)
	public String orderCancel(@RequestParam String member_id, @RequestParam String reser_number, Model model) {
	   log.info("MemberController의 orderCancel()호출됨");
	   reservationDAO.orderCancel(reser_number);
	   
	   reservationDAO.orderUsed();
	   List<MemberOrderListDTO> OrderList=reservationDAO.getMemberOrders(member_id);
	   int count = reservationDAO.getOrderNum(member_id);
	   model.addAttribute("OrderList", OrderList);
	   model.addAttribute("count", count);   
	   
	   return "user/mypage_reservation";
	 }
	
	// By Jay_회원 당 구매후기 관련 리스트로 이동_20210430
	@RequestMapping(value="user/mypage_evaluation.do", method = RequestMethod.GET)
	public String orderEvaluationList(@RequestParam String member_id, Model model) {
	   log.info("MemberController의 orderEvaluationList()호출됨");
	   List<MemberOrderListDTO> OrderList = reservationDAO.orderEvaluationList(member_id);
	   int count = reservationDAO.orderEvaluationNum(member_id);
	   List<TotalEvaluationDTO> evaluationList =  evaluationDAO.evaluation_list_byMemberId(member_id);
	   List<EvaluationReplyDTO> replyList = evaluationDAO.evaluation_reply_Entrylist();
	   reservationDAO.orderUsed();
	   
	   model.addAttribute("OrderList", OrderList);
	   model.addAttribute("count", count);  
	   model.addAttribute("evaluationList", evaluationList);  
	   model.addAttribute("replyList", replyList);  
	   
	   return "user/mypage_evaluation";
	 }
	
	// By Jay_회원 당 구매후기 관련 작성 페이지로 이동_20210501
	@RequestMapping(value="user/mypage_evaluationWrite.do", method = RequestMethod.GET)
	public String EvaluationWriteForm(@RequestParam int reser_number, Model model) {
	   log.info("MemberController의 EvaluationWriteForm()호출됨");
	   MemberOrderListDTO memberOrder = reservationDAO.getOrderOneByReser_number(reser_number);
	   model.addAttribute("memberOrder", memberOrder);
	   return "user/mypage_evaluationWrite";
	 }
	
	// By Jay_회원 당 구매후기 관련 작성하기_20210501
	@RequestMapping(value="user/mypage_evaluationWrite.do", method = RequestMethod.POST)
	@ResponseBody
	public String EvaluationWrite(@ModelAttribute EvaluationDTO evaluationDTO) {
	   log.info("MemberController의 EvaluationWrite()호출됨");
	   evaluationDAO.evaluationWrite(evaluationDTO);
	   evaluationDAO.evaluationCheckChange(evaluationDTO.getReser_number());
	   
	   return "success";
	 }	

	// By Jay_아이디 찾기 페이지로 이동_20210626
	@RequestMapping(value="/user/idSearchForm.do", method = RequestMethod.GET)
	public String idSearchForm() {
	   log.info("MemberController의 idSearchForm()호출됨");
	   return "user/idSearch";
	}
		
	// By Jay_아이디 찾기_20210626
	@RequestMapping(value="/user/idSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> idSearch (@ModelAttribute MembersDTO members, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
	   log.info("MemberController의 idSearch()호출됨");
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   String result = "";
	   String id = "";
	   
	  
	   try {
	      List<MembersDTO> list = membersDAO.idSearch(members);
	      if(list.size() != 0) {
	         for(int i=0; i<list.size(); i++){
	            MembersDTO userInfo = list.get(i);
	     	   log.info(userInfo);
	            
	             if(userInfo.getMember_phone().equals(members.getMember_phone())) {
	                id = userInfo.getMember_id();
	                result = "success";
	                
	             } else {
	                // 아이디는 존재하지만, 핸드폰번호가 다른 경우
	                result = "phoneFail";
	             }
	        }
	             
	      }else {
	         // 아이디가 없는 경우
	         result = "idFail";
	      }
	          
	   }catch (Exception e) {
	      e.printStackTrace();
	      result = "error";
	   }
	       
	   map.put("id", id);
	   map.put("result", result);
	       
	   return map;
	}
	
	
	
}



