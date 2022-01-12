package com.kh.onemile.repository.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.admin.ApproveDTO;
import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.vo.admin.ExitMemberVO;
import com.kh.onemile.vo.admin.MemberListVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regApproveMember(ApproveDTO approveDTO){
		int result = sqlSession.insert("admin.regApproveMember", approveDTO);
		log.debug(" result  "+ result);
	}
	@Override
	public void deniedApproveMember(int memberNo) {
		sqlSession.delete("admin.deniedApproveMember", memberNo);
	}
	@Override
	public void approveMember(int memberNo) {
		sqlSession.update("admin.approveMember", memberNo);
	}
	@Override
	public List<MemberDTO> membershipList() {
		return sqlSession.selectList("admin.membershipList");
	}
	@Override
	public List<MemberListVO> approveMemberList() {
		return sqlSession.selectList("admin.approveMemberList");
	}
	@Override
	public List<ExitMemberVO> exitMemberList() {
		return sqlSession.selectList("admin.extiMemberList");
	}
	@Override
	public List<MemberListVO> notMemberList() {
		return sqlSession.selectList("admin.notMemberList");
	}
}
