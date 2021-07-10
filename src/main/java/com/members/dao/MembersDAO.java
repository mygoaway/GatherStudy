package com.members.dao;
import java.util.List;

import com.members.domain.AdminDTO;
import com.members.domain.MembersDTO;

public interface MembersDAO{
	// 1. 회원가입 ( 중복id값 확인, 회원가입 하기)
	public int idCheck(MembersDTO members);
	public void userJoin(MembersDTO members);
	
	// 2. 아이디 값으로 아이디, 비밀번호 값 갖고오기(로그인시 아이디, 비밀번호 확인)
	public MembersDTO getOne(MembersDTO members);

	// 3. 마이페이지(회원정보보기)
	public MembersDTO getMember(String member_id);
	
	// 4.회원정보수정
	public void updateMember(MembersDTO members);
	   
	// 5.회원탈퇴
	public void deleteMember(MembersDTO members);
	 
	// 6. 관리자 계정으로 아이디, 비밀번호 값 갖고오기(로그인시 아이디, 비밀번호 확인)
	public AdminDTO adminGetOne(AdminDTO admins);
	
	// 7. 아이디 찾기
	public List<MembersDTO>idSearch(MembersDTO members);
}
