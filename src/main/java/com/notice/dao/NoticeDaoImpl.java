package com.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.notice.domain.NoticeDTO;

@Repository
public class NoticeDaoImpl implements NoticeDAO {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<NoticeDTO> noticeList(Map<String,Object>map) throws DataAccessException {
		return sqlSession.selectList("noticeList", map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return sqlSession.selectOne("selectCount",map);
	}
	
	@Override
	public void updateReadcnt(int notice_number) throws DataAccessException {
		sqlSession.update("updateReadcnt", notice_number);
	}

	@Override
	public NoticeDTO retrieve(int notice_number) throws DataAccessException {
		return (NoticeDTO)sqlSession.selectOne("retrieve", notice_number);
	}

	@Override
	public void noticeUpdate(NoticeDTO noticeDTO) throws DataAccessException {
		sqlSession.update("noticeUpdate", noticeDTO);
	}

	@Override
	public void noticeWrite(NoticeDTO noticeDTO) throws DataAccessException {
		sqlSession.insert("noticeWrite", noticeDTO);
	}
	
	@Override
	public void noticeDelete(int notice_number) throws DataAccessException {
		sqlSession.delete("noticeDelete", notice_number);
	}
}
