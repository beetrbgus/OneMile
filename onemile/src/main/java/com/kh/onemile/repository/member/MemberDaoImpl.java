package com.kh.onemile.repository.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.vo.MemberJoinVO;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private PasswordEncoder encoder;
	
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
}