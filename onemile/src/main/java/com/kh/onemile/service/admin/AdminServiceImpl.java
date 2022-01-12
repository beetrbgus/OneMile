package com.kh.onemile.service.admin;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onemile.entity.admin.ApproveDTO;
import com.kh.onemile.repository.admin.AdminDao;
import com.kh.onemile.service.commu.CommuService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.CommuEditVO;
import com.kh.onemile.vo.admin.ExitMemberVO;
import com.kh.onemile.vo.admin.MemberListVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Transactional
@Service
public class AdminServiceImpl implements AdminService{
	String approveSeq ="approve_seq";
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private CommuService commuService;
	@Autowired
	private Sequence sequnce;
	
	//가입시 회원 승인 정보 등록.
	public void regApproveMember(int memberNo) {
		log.debug("memberNo    "+memberNo);
		ApproveDTO approveDTO = setApproveDTO(memberNo);
		adminDao.regApproveMember(approveDTO);
	}
	//회원 승인 DTO에 정보 설정.
	public ApproveDTO setApproveDTO(int memberNo) {
		ApproveDTO approveDTO = new ApproveDTO();
		// 가입 승인 시퀀스 가져오기
		int approveNo = sequnce.nextSequence(approveSeq);
		// 정보 설정.
		approveDTO.setApproveNo(approveNo);
		approveDTO.setSeqName(approveSeq);
		approveDTO.setMemberNo(memberNo);
		log.debug(approveDTO.toString());
		
		return approveDTO;
	}
	//회원 승인.
	@Override
	public void approveMember(int memberNo) {
		adminDao.approveMember(memberNo);
		deniedApproveMember(memberNo);
	}
	//회원 승인 거부.
	@Override
	public void deniedApproveMember(int memberNo) {
		adminDao.deniedApproveMember(memberNo); 
	}
	//승인 전 회원 목록 가져오기
	@Override
	public List<MemberListVO> notMember(){
		return adminDao.notMemberList();
	}
	//회원 목록 가져오기
	@Override
	public List<MemberListVO> memberList(){
		return adminDao.approveMemberList();
	}
	//탈퇴회원 목록 가져오기
		@Override
		public List<ExitMemberVO> exitMemberList(){
			return adminDao.exitMemberList();
		}
	@Override
	public void hiddenBoard(int no) {
		commuService.hide(no);
	}
	@Override
	public void modifyBoard(CommuEditVO commuEditVO) throws IllegalStateException, IOException {
		commuService.edit(commuEditVO);
	}
	@Override
	public List<CommuDetailVO> boardList(String largeName, int startRow, int endRow) {
		List<CommuDetailVO>list = commuService.menuList(largeName, startRow, endRow);
		return list;
	}
}
