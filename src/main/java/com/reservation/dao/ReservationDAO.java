package com.reservation.dao;

import java.util.List;

import org.springframework.dao.DataAccessException; // 스프링 전용 예외처리 클래스 -> try ~ catch를 사용 x => 예외가 발생이 될때 처리를 해준다.

import com.evaluation.domain.EvaluationDTO;
import com.reservation.domain.MemberOrderListDTO;
import com.reservation.domain.ReservationDTO;

public interface ReservationDAO {

    // 카페 예약하기
    public void reservate(ReservationDTO reservation) throws DataAccessException;

	// 현재일 기준으로 사용일이 지난 예약은 USED로 변경하기(단, 예약이 READY인것만!!)
	public void orderUsed();
	
    // 회원이 예약한 정보 불러오기
	public List<MemberOrderListDTO> getMemberOrders(String member_id);
    
	// 예약 내역 갯수 확인하기
	public int getOrderNum(String member_id);
	
	// 예약 취소하기
	public void orderCancel(String reser_number);
	  
	// 회원당 구매후기 관련 리스트 불러오기(사용한 예약만 불러오기)
	public List<MemberOrderListDTO> orderEvaluationList(String member_id);
    
	// 예약 내역 갯수 확인하기(사용한 예약만)
	public int orderEvaluationNum(String member_id);
	    
	// 예약번호로 예약한 내용 갖고오기
	public MemberOrderListDTO getOrderOneByReser_number(int reser_number);

	// 스터디 카페 예약한 정보 갖고오기
	public List<MemberOrderListDTO> getCafeOrders(String cafe_id);
	
	// 스터디 카페당 구매후기 관련 리스트 불러오기(사용한 예약만 불러오기)
	public List<MemberOrderListDTO> getCafeOrdersUsed(String cafe_id);
	    
	// 스터디 카페 예약번호로 고객이 작성한 댓글 불러오기
	public EvaluationDTO getEvaluationOneByReser_number(int reser_number);
}

