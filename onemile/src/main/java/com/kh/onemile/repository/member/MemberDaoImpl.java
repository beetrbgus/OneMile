package com.kh.onemile.repository.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.vo.MemberJoinVO;
import com.kh.onemile.vo.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	@Override
	public void join(MemberJoinVO memberJoinVO) {
		sqlSession.insert("member.join",memberJoinVO);
	}
	//로그인
	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		return sqlSession.selectOne("member.get",memberDTO.getEmail());
	}
	//아이디 찾기
	@Override
	public MemberDTO findId(MemberDTO memberDTO) {
		Map<String, Object> param = new HashMap<>();
		param.put("nick", memberDTO.getNick());
		param.put("phone", memberDTO.getPhone());
		MemberDTO findDto = sqlSession.selectOne("member.findId",param);
		return findDto;
	}
	//이메일 회원번호 가져오기
	@Override
	public int getMemberNo(String email) {
		return sqlSession.selectOne("member.memberNoByEmail", email);
		
	}
	//회원탈퇴
	@Override
	public boolean quit(String email) {
		return sqlSession.update("member.quit",email) > 0;
	}

	//단일조회
	@Override
	public MemberDTO get(String email) {	
		return sqlSession.selectOne("member.get2",email);
		
	}
	//비밀번호 변경
	@Override
	public boolean changePw(Map<String, Object> param) {
		return sqlSession.update("member.changePw",param) > 0;
		
	}
	
	//커뮤 글 작성자, 소모임 모임장, 마일즈 모임장 표기를 위해 닉네임 가져오기
	@Override
	public String getNick(int memberNo) {
		return sqlSession.selectOne("member.getNick", memberNo);
	}
	
	//회원정보 불러오기
	@Override
	public MemberDTO profile(int memberNo) {
		return sqlSession.selectOne("member.getProfile",memberNo);
	}
	
	//닉네임 중복체크
	@Override
	public MemberDTO get2(String nick) {
		return sqlSession.selectOne("member.getCheckNick",nick);
	
	}
	
	//전화번호 중복체크
	@Override
	public MemberDTO get3(String phone) {
		return sqlSession.selectOne("member.getCheckPhone",phone);
		
	}
	
	//회원정보 수정
	@Override
	public boolean changeInformation(MemberDTO memberDTO) {
		int count = sqlSession.update("member.changeInformation", memberDTO);
		return count > 0;
	}

	//회원정보 불러오기(사진 포함)
	@Override
	public MemberVO imageProfile(int memberNo) {
		return sqlSession.selectOne("member.getMember",memberNo);
	}
	
	//닉네임 변경
	@Override
	public int getNickModi(int memberNo) {
		return sqlSession.selectOne("member.getNickModi",memberNo);
	}
	
}