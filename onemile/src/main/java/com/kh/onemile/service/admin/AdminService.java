package com.kh.onemile.service.admin;

import java.util.List;
import com.kh.onemile.entity.member.MemberDTO;

public interface AdminService {
	
	void regApproveMember(int memberNo);
	void deniedApproveMember(int memberNo);
	void approveMember(int memberNo);
	List<MemberDTO> memberList();
}
