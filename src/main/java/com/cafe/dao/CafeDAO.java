package com.cafe.dao;
// List, ArrayList => 글 목록 보기
import java.util.List;

import org.springframework.dao.DataAccessException; // 스프링 전용 예외처리 클래스 -> try ~ catch를 사용 x => 예외가 발생이 될때 처리를 해준다.

import com.cafe.domain.CafeDTO;

public interface CafeDAO{
	// 1. 오늘의 추천 스터디 카페 출력하기
	public List<CafeDTO> recommendCafe() throws DataAccessException;	
	
	// 2. 카페 전체 출력하기
	public List<CafeDTO> lookcafe() throws DataAccessException;
	
	// 3. 새로 오프한 스터디 카페 출력하기
	public List<CafeDTO> newCafe() throws DataAccessException;
	
	// 4.카페 상세보기
	public CafeDTO list(String id) throws DataAccessException;
	
	// 5. 스터디 카페 ID로 스터디 카페 정보 갖고오기
	public CafeDTO getCafe(CafeDTO cafe);
}

