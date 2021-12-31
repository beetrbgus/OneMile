package com.kh.onemile.repository.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.admin.ApproveDTO;
import com.kh.onemile.entity.admin.MemberListDTO;

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
	public List<MemberListDTO> memberList() {
		return sqlSession.selectList("admin.memberSearchList");
	}
}
