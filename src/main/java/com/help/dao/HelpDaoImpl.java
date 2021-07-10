package com.help.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.help.domain.HelpDTO;



@Repository
public class HelpDaoImpl implements HelpDAO {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HelpDTO> helpList(Map<String,Object>map) throws DataAccessException {
		return sqlSession.selectList("helpList", map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return sqlSession.selectOne("selectAll",map);
	}
	
	@Override
	public void updateReadcntUp(int help_number) throws DataAccessException {
		sqlSession.update("updateReadcntUp", help_number);
	}

	@Override
	public HelpDTO retrieveGet(int help_number) throws DataAccessException {
		return (HelpDTO)sqlSession.selectOne("retrieveGet", help_number);
	}

	@Override
	public void helpUpdate(HelpDTO helpDTO) throws DataAccessException {
		sqlSession.update("helpUpdate", helpDTO);
	}

	@Override
	public void helpWrite(HelpDTO helpDTO) throws DataAccessException {
		sqlSession.insert("helpWrite", helpDTO);
	}
	
	@Override
	public void helpDelete(int help_number) throws DataAccessException {
		sqlSession.delete("helpDelete", help_number);
	}
}