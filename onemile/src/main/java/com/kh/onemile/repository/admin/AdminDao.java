package com.kh.onemile.repository.admin;

import java.util.List;

import com.kh.onemile.entity.admin.ApproveDTO;
import com.kh.onemile.entity.member.MemberDTO;
import com.kh.onemile.vo.admin.ExitMemberVO;
import com.kh.onemile.vo.admin.MemberListVO;

public interface AdminDao {
	public void regApproveMember(ApproveDTO approveDTO);
	public void deniedApproveMember(int memberNo);
	public void approveMember(int memberNo);
	public List<MemberDTO> membershipList();
	public List<MemberListVO> approveMemberList();
	public List<ExitMemberVO> exitMemberList();
	public List<MemberListVO> notMemberList();
}
