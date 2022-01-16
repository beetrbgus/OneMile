package com.kh.onemile.repository.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<MemberListVO> approveMemberList(String keyword, String search, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("search", search);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("admin.approveMemberList", map);
	}
	@Override
	public List<ExitMemberVO> exitMemberList(String keyword, String search, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("search", search);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("admin.extiMemberList",map);
	}
	@Override
	public List<MemberListVO> notMemberList(String keyword, String search, int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("search", search);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("admin.notMemberList", map);
	}
	
	@Override
	public int memberCount() {
		return sqlSession.selectOne("admin.memberCount");
	}
	@Override
	public int manGenderCount() {
		return sqlSession.selectOne("admin.manGenderCount");
	}
	@Override
	public int womanGenderCount() {
		return sqlSession.selectOne("admin.womanGenderCount");
	}
	
	@Override
	public int ageDistribution(int startAge, int endAge) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startAge", startAge);
		map.put("endAge", endAge);
		return sqlSession.selectOne("admin.ageDistribution", map);
	}
	
	@Override
	public int loactionDistribution(String locationName) {
		return sqlSession.selectOne("admin.locationDistribution", locationName);
	}
	
	@Override
	public int membershipActiveMemberCount() {
		return sqlSession.selectOne("admin.membershipActiveMemberCount");
	}
}
