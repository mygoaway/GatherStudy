package com.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.notice.domain.NoticeDTO;

public interface NoticeDAO{
	
	// 1. 공지사항 목록 보기(검색어에 해당하는 총 레코드수 구하기 포함)
	public List<NoticeDTO> noticeList(Map<String,Object>map) throws DataAccessException;
	public int getRowCount(Map<String,Object>map);
	
	// 2. 공지사항 쓰기
	public void noticeWrite(NoticeDTO noticeDTO) throws DataAccessException;
		
	// 3. 공지사항 상세보기 ( 조회수 증가 / 게시물 번호에 해당하는 레코드 한개 얻어오기 )
	public void updateReadcnt(int notice_number) throws DataAccessException;
	public NoticeDTO retrieve(int notice_number) throws DataAccessException;

	// 4. 공지사항 수정하기 - 게시물 번호에 해당하는 레코드 수정하기
	public void noticeUpdate(NoticeDTO noticeDTO) throws DataAccessException;

	// 5. 공지사항 삭제하기
	public void noticeDelete(int notice_number) throws DataAccessException;
	
}

