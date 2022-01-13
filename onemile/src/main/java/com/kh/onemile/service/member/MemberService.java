package com.kh.onemile.service.member;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.entity.member.certi.CertiDTO;
import com.kh.onemile.entity.member.membership.AdDTO;
import com.kh.onemile.vo.MemberJoinVO;
import com.kh.onemile.vo.MemberVO;
import com.kh.onemile.vo.social.category.CategoryVO;

public interface MemberService {
	
	//회원가입
	public void join(MemberJoinVO memberJoinVO) throws IllegalStateException, IOException;
	
	//로그인
	public MemberDTO login(MemberDTO memberDTO);
	
	//회원탈퇴
	public boolean quit(String email, String pw);
	
	//아이디찾기
	public MemberDTO findId(MemberDTO memberDTO);
	
	//이메일 전송 체크
	public boolean emailCheck(CertiDTO certiDTO);

	//비밀번호 변경
	public boolean changePw(String email, String nowPw, String changePw);

	//닉네임
	public String getNick(int memberNo);

	//멤버십 혜택 불러오는 기능
	public AdDTO membership(int memberNo);
	
	//회원정보 불러오기
	public MemberDTO profile(int memberNo);
	
	//회원정보 수정
	public boolean changeInformation(MemberDTO memberDTO);

	//소모임 대분류
	public List<CategoryVO> getfavorite();

	//회원정보 불러오기(사진 포함)
	public MemberVO imageProfile(int memberNo);

}