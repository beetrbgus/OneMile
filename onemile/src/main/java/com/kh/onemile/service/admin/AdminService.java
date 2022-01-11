package com.kh.onemile.service.admin;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.CommuEditVO;


public interface AdminService {
	void regApproveMember(int memberNo);
	void deniedApproveMember(int memberNo);
	void approveMember(int memberNo);
	List<MemberDTO> memberList();
	void hiddenBoard(int no);
	void modifyBoard(CommuEditVO commuEditVO) throws IllegalStateException, IOException;
	List<CommuDetailVO> boardList(String largeName, int startRow, int endRow); 
}
