package com.findMember.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.findMember.domain.FindDTO;
import com.findMember.domain.FindReplyDTO;



@Repository
public class FindDaoImpl implements FindDAO {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<FindDTO> findList(Map<String,Object>map) throws DataAccessException {
		return sqlSession.selectList("findList", map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return sqlSession.selectOne("allSelect",map);
	}
	
	@Override
	public void readcntIncrease(int find_number) throws DataAccessException {
		sqlSession.update("readcntIncrease", find_number);
	}

	@Override
	public FindDTO getRetrieve(int find_number) throws DataAccessException {
		return (FindDTO)sqlSession.selectOne("getRetrieve", find_number);
	}

	@Override
	public void findUpdate(FindDTO findDTO) throws DataAccessException {
		sqlSession.update("findUpdate", findDTO);
	}

	@Override
	public void findWrite(FindDTO findDTO) throws DataAccessException {
		sqlSession.insert("findWrite", findDTO);
	}
	
	@Override
	public void findDelete(int find_number) throws DataAccessException {
		sqlSession.delete("findDelete", find_number);
	}

	@Override
	public List<FindReplyDTO> replyList(int find_number) throws DataAccessException {
		return sqlSession.selectList("replyList", find_number);
	}
	
	@Override
	public int replyCount(int find_number) throws DataAccessException {
		return sqlSession.selectOne("replyCount",find_number);
	}
	
	@Override
	public void replyWrite(FindReplyDTO findReplyDTO) throws DataAccessException {
		sqlSession.insert("replyWrite", findReplyDTO);
	}
	
	@Override
	public void replyDelete(int find_reply_number) throws DataAccessException {
		sqlSession.delete("replyDelete", find_reply_number);
	}
}
