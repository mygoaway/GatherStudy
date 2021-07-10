package com.findMember.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.findMember.domain.FindDTO;
import com.findMember.domain.FindReplyDTO;

public interface FindDAO{
	// 1.글 목록 보기
	public List<FindDTO> findList(Map<String,Object>map) throws DataAccessException;
	public int getRowCount(Map<String,Object>map);
	
	// 2-1 글 상세보기 - 조회수 증가시키기
	public void readcntIncrease(int find_number) throws DataAccessException;

	// 2-2 글 상세보기 - 게시물 번호에 해당하는 레코드 한개 얻어오기
	public FindDTO getRetrieve(int find_number) throws DataAccessException;

	// 3. 글 수정하기 - 게시물 번호에 해당하는 레코드 수정하기
	public void findUpdate(FindDTO findDTO) throws DataAccessException;

	// 4. 글 등록하기 - 글쓰기
	public void findWrite(FindDTO findDTO) throws DataAccessException;
		
	// 5. 글 삭제하기
	public void findDelete(int find_number) throws DataAccessException;
	
	// 6. 댓글 출력하기
	public List<FindReplyDTO> replyList(int find_number) throws DataAccessException;

	// 7. 댓글 개수 확인하기
	public int replyCount(int find_number) throws DataAccessException;
	
	// 8. 댓글 작성하기
	public void replyWrite(FindReplyDTO findReplyDTO) throws DataAccessException;
	
	// 9. 댓글 삭제하기
	public void replyDelete(int find_reply_number) throws DataAccessException;
}

