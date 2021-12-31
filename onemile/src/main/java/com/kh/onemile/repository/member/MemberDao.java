package com.kh.onemile.repository.member;

import java.util.Map;

import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.vo.MemberJoinVO;

public interface MemberDao {
	//회원가입
	void join(MemberJoinVO memberJoinVO);
	//로그인
	MemberDTO login(MemberDTO memberDTO);
	//회원탈퇴
	boolean quit(String email);
	// 아이디 찾기
	MemberDTO findId(MemberDTO memberDTO);
	//이메일 회원번호 가져오기
	int getMemberNo(String email);
	//단일조회
	MemberDTO get(String email);
	//비밀번호변경
	boolean changePw(Map<String, Object> param);
	//회원 정보 가져오기
	String getNick(int memberNo);

}