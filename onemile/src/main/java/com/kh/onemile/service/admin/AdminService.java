package com.kh.onemile.service.admin;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.CommuEditVO;
import com.kh.onemile.vo.admin.ExitMemberVO;
import com.kh.onemile.vo.admin.MemberCountChartVO;
import com.kh.onemile.vo.admin.MemberListVO;


public interface AdminService {
	void regApproveMember(int memberNo);
	void deniedApproveMember(int memberNo);
	void approveMember(int memberNo);
	List<MemberListVO> memberList(String keyword, String search, int startRow, int endRow);
	void hiddenBoard(int no);
	List<ExitMemberVO> exitMemberList(String keyword, String search, int startRow, int endRow);
	List<MemberListVO> notMember(String keyword, String search, int startRow, int endRow);
	List<CommuDetailVO> boardList(String largeName, int startRow, int endRow, String keyword, String search);
	List<MemberCountChartVO> memberCount();
	List<MemberCountChartVO> ageDistribution();
	List<MemberCountChartVO> locationDistribution();
	List<MemberCountChartVO> membershipActiveMemberCount();
	void hiddenMember(int memberNo);
	List<ExitMemberVO> hideMemberList(String keyword, String search, int startRow, int endRow);
}
