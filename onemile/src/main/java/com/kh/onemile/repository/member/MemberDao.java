package com.kh.onemile.repository.member;

import java.util.Map;

import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.vo.MemberJoinVO;
import com.kh.onemile.vo.MemberVO;
import com.kh.onemile.vo.member.LoginVO;

public interface MemberDao {
	//회원가입
	void join(MemberJoinVO memberJoinVO);
	
	//로그인
	MemberDTO login(LoginVO loginVO);
	
	//회원탈퇴
	boolean quit(String email);
	
	// 아이디 찾기
	MemberDTO findId(MemberDTO memberDTO);
	
	//이메일 회원번호 가져오기
	int getMemberNo(String email);
	
	//단일조회
	MemberDTO get(String email);
	//닉네임 중복체크
	MemberDTO get2(String nick);
	//전화번호 중복체크
	MemberDTO get3(String phone);
	
	//비밀번호변경
	boolean changePw(Map<String, Object> param);
	
	//커뮤 글 작성자, 소모임 모임장, 마일즈 모임장 표기를 위해 닉네임 가져오기
	String getNick(int memberNo);
	
	//회원정보 가져오기
	MemberDTO profile(int memberNo);
	
	
	//회원정보 수정하기
	boolean changeInformation(MemberDTO memberDTO);
	
	//회원정보 불러오기(사진 포함)
	MemberVO imageProfile(int memberNo);
	
	//닉네임 변경
	int getNickModi(int memberNo);

	boolean emailChangePw(Map<String, Object> param);

	//숨김처리
	void memberHidden(int memberNo);
	
}