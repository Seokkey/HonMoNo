package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.dto.MemberDto;

public interface MemberDao {

	MemberDto login(MemberDto mdto);

	List<MemberDto> mList1(MemberDto mDto);

	int memberRatingUp(String m_nick);

	List<MemberDto> mList2(MemberDto mDto);

	int mDel(String m_nick);
	
	List<MemberDto> mList3(MemberDto mDto);
	
	int msDel(String m_nick);
	
	
	//학준이.
	
	//마이 페이지 수정
	void update_mypage(MemberDto member);
	void update_mypage2(MemberDto member);
	
	//회원가입 입력
	int join_member(MemberDto member) throws Exception;
	//회원가입 사업자
	/*int join_member2(MemberDto member) throws Exception;*/
	// 아이디 중복 확인
	int check_id(String m_id);

	//닉네임 중복 확인
	int check_nick(String m_nick);

	//이메일 인증  
	int approval_member(MemberDto member) throws Exception;

	//아이디찾기
	String find_id(String m_phone);
	
	/*//비밀번호 찾기
	void find_pw(MemberDto member);*/
	
	//login
	MemberDto login(String m_id);
	
	//사업자 번호 중복 확인
	int check_conum(String ms_conum);

	int join_member2(MemberDto member);

	MemberDto myInfoPage1(String m_nick);

	MemberDto myInfoPage2(String m_nick);
	
	//update_pw 패스워드 변경
	int update_pw(MemberDto member);

	int update_pass(MemberDto member);

	String pwChk(String m_nick);
	
	int passChk(MemberDto memberdto);//입력한 패스워드가 회원의 패스워드가 맞는지 판단

	int conumChk(int ms_conum);




	

	






	
}
