package com.kh.onemile.repository.admin;

import java.util.List;

import com.kh.onemile.entity.admin.ApproveDTO;
import com.kh.onemile.entity.admin.MemberListDTO;
import com.kh.onemile.entity.member.MemberDTO;

public interface AdminDao {
	public void regApproveMember(ApproveDTO approveDTO);
	public void deniedApproveMember(int memberNo);
	public void approveMember(int memberNo);
	public List<MemberDTO> memberList();
}
