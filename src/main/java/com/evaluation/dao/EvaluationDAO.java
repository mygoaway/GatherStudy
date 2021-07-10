package com.evaluation.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.evaluation.domain.EvaluationDTO;
import com.evaluation.domain.EvaluationReplyDTO;
import com.evaluation.domain.TotalEvaluationDTO;

public interface EvaluationDAO{
	// 1.스터디 카페당 후기 보기
	public List<EvaluationDTO> evaluation_list(String cafe_id) throws DataAccessException;

	// 2. 전체 스터디 카페 후기 보기
	public List<TotalEvaluationDTO> total_evaluation_list() throws DataAccessException;

	// 3.스터디 카페당 댓글 불러오기
	public List<EvaluationReplyDTO> evaluation_reply_list(String cafe_id) throws DataAccessException;
		
	// 4. 스터디 카페당 후기 개수 추출하기
	public int getEvaluationRows(String cafe_id) throws DataAccessException;
	
	// 5. 글 등록하기 - 글쓰기
	public void evaluationWrite(EvaluationDTO evaluationDTO) throws DataAccessException;
	
	// 6. 후기 작성 후 후기작성 여부 YES로 변경
	public void evaluationCheckChange(int reser_number) throws DataAccessException;
	
	// 7. 회원이 작성한 스터디 카페 후기 보기
	public List<TotalEvaluationDTO> evaluation_list_byMemberId(String member_id) throws DataAccessException;

	// 8. 회원이 작성한 스터디 카페 후기에 대한 댓글 보기(스터디 카페 전체 댓글 불러오기)
	public List<EvaluationReplyDTO> evaluation_reply_Entrylist() throws DataAccessException;

	// 9. 고객이 남겨주신 후기에 댓글 남기기
	public void evaluationReplyWrite(EvaluationReplyDTO EvaluationReplyDTO) throws DataAccessException;
	
}

