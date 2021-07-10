package com.help.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.help.domain.HelpDTO;

public interface HelpDAO{
	// 1.글 목록 보기
	public List<HelpDTO> helpList(Map<String,Object>map) throws DataAccessException;
	public int getRowCount(Map<String,Object>map);
	
	// 2-1 글 상세보기 - 조회수 증가시키기
	public void updateReadcntUp(int help_number) throws DataAccessException;

	// 2-2 글 상세보기 - 게시물 번호에 해당하는 레코드 한개 얻어오기
	public HelpDTO retrieveGet(int help_number) throws DataAccessException;

	// 3. 글 수정하기 - 게시물 번호에 해당하는 레코드 수정하기
	public void helpUpdate(HelpDTO helpDTO) throws DataAccessException;

	// 4. 글 등록하기 - 글쓰기
	public void helpWrite(HelpDTO helpDTO) throws DataAccessException;
		
	// 5. 글 삭제하기
	public void helpDelete(int help_number) throws DataAccessException;
	
}