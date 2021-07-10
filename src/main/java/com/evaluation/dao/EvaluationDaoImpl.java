package com.evaluation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.evaluation.domain.EvaluationDTO;
import com.evaluation.domain.EvaluationReplyDTO;
import com.evaluation.domain.TotalEvaluationDTO;

@Repository
public class EvaluationDaoImpl implements EvaluationDAO {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<EvaluationDTO> evaluation_list(String cafe_id) throws DataAccessException {
		return sqlSession.selectList("evaluation_list", cafe_id);
	}

	@Override
	public List<TotalEvaluationDTO> total_evaluation_list() throws DataAccessException {
		return sqlSession.selectList("evaluation_total_list");
	}

	@Override
	public List<EvaluationReplyDTO> evaluation_reply_list(String cafe_id) throws DataAccessException {
		return sqlSession.selectList("evaluation_reply_list", cafe_id);
	}

	@Override
	public int getEvaluationRows(String cafe_id) throws DataAccessException {
		return sqlSession.selectOne("getEvaluationRows", cafe_id);
	}

	@Override
	public void evaluationWrite(EvaluationDTO evaluationDTO) throws DataAccessException {
		sqlSession.insert("evaluationWrite", evaluationDTO);
	}

	@Override
	public void evaluationCheckChange(int reser_number) throws DataAccessException {
		sqlSession.update("evaluationCheckChange", reser_number);
	}

	@Override
	public List<TotalEvaluationDTO> evaluation_list_byMemberId(String member_id) throws DataAccessException {
		return sqlSession.selectList("evaluation_list_byMemberId", member_id);
	}

	@Override
	public List<EvaluationReplyDTO> evaluation_reply_Entrylist() throws DataAccessException {
		return sqlSession.selectList("evaluation_reply_Entrylist");
	}

	@Override
	public void evaluationReplyWrite(EvaluationReplyDTO EvaluationReplyDTO) throws DataAccessException {
		sqlSession.insert("evaluationReplyWrite", EvaluationReplyDTO);
	}

	
	

	
}
