package com.members.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.members.domain.AdminDTO;
import com.members.domain.MembersDTO;

@Repository
public class MembersDaoImpl implements MembersDAO {

	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public int idCheck(MembersDTO members) {
		return sqlSession.selectOne("idCheck",members);
		}
	
	@Override
	public void userJoin(MembersDTO members) {
		sqlSession.insert("userJoin",members);
	}

	@Override
	public MembersDTO getOne(MembersDTO members) {
		return sqlSession.selectOne("getOne",members);
	}
	
	@Override
	public MembersDTO getMember(String member_id) {
	     return sqlSession.selectOne("getMember",member_id);
	 }
	

	@Override
  	public void updateMember(MembersDTO members) {
	     sqlSession.update("updateMember", members);
	}
	   
	@Override
	public void deleteMember(MembersDTO members) {
	   sqlSession.delete("deleteMember", members);
	}
	   
	@Override
	public AdminDTO adminGetOne(AdminDTO admins) {
		return sqlSession.selectOne("adminGetOne",admins);
		}

	@Override
	   public List<MembersDTO> idSearch(MembersDTO members) {
	      return sqlSession.selectList("idSearch", members);
	   }
}
