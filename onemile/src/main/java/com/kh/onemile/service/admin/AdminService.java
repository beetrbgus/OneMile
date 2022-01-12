package com.kh.onemile.service.admin;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.CommuEditVO;
import com.kh.onemile.vo.admin.ExitMemberVO;
import com.kh.onemile.vo.admin.MemberListVO;


public interface AdminService {
	void regApproveMember(int memberNo);
	void deniedApproveMember(int memberNo);
	void approveMember(int memberNo);
	List<MemberListVO> memberList();
	void hiddenBoard(int no);
	void modifyBoard(CommuEditVO commuEditVO) throws IllegalStateException, IOException;
	List<CommuDetailVO> boardList(String largeName, int startRow, int endRow); 
	List<ExitMemberVO> exitMemberList();
	List<MemberListVO> notMember();
}
