package com.kh.onemile.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.onemile.entity.admin.ApproveDTO;
import com.kh.onemile.repository.admin.AdminDao;
import com.kh.onemile.repository.member.MemberDao;
import com.kh.onemile.service.commu.CommuService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.admin.ExitMemberVO;
import com.kh.onemile.vo.admin.MemberCountChartVO;
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
	@Autowired
	private MemberDao memberDao;
	
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
	public List<MemberListVO> notMember(String keyword, String search, int startRow, int endRow){
		return adminDao.notMemberList(keyword, search, startRow, endRow);
	}
	//회원 목록 가져오기
	@Override
	public List<MemberListVO> memberList(String keyword, String search, int startRow, int endRow){
		return adminDao.approveMemberList(keyword, search, startRow, endRow);
	}
	//탈퇴회원 목록 가져오기
	@Override
	public List<ExitMemberVO> exitMemberList(String keyword, String search, int startRow, int endRow){
		return adminDao.exitMemberList(keyword, search, startRow, endRow);
	}
	@Override
	public void hiddenBoard(int no) {
		commuService.hide(no);
	}
	@Override
	public List<CommuDetailVO> boardList(String largeName, int startRow, int endRow, String keyword, String search) {
		List<CommuDetailVO>list = commuService.adminList(largeName, startRow, endRow, keyword, search);
		return list;
	}
	
	@Override
	public List<MemberCountChartVO> memberCount() {
		List<MemberCountChartVO> count = new ArrayList<>();
		MemberCountChartVO countChartVO = new MemberCountChartVO();
		countChartVO.setText("총 회원 수");
		countChartVO.setCount(adminDao.memberCount());
		count.add(countChartVO);
		
		
		MemberCountChartVO countMChartVO = new MemberCountChartVO();
		countMChartVO.setText("남성 회원 수");
		countMChartVO.setCount(adminDao.manGenderCount());
		count.add(countMChartVO);
		
		MemberCountChartVO countWChartVO = new MemberCountChartVO();
		countWChartVO.setText("여성 회원 수");
		countWChartVO.setCount(adminDao.womanGenderCount());
		count.add(countWChartVO);
		
		return count;
	}
	
	@Override
	public List<MemberCountChartVO> ageDistribution() {
		List<MemberCountChartVO> count = new ArrayList<>();
		MemberCountChartVO tw = new MemberCountChartVO();
		tw.setText("20대");
		tw.setCount(adminDao.ageDistribution(20, 29));
		count.add(tw);
		
		
		MemberCountChartVO th = new MemberCountChartVO();
		th.setText("30대");
		th.setCount(adminDao.ageDistribution(30, 39));
		count.add(th);
		
		MemberCountChartVO ft = new MemberCountChartVO();
		ft.setText("40대");
		ft.setCount(adminDao.ageDistribution(40, 49));
		count.add(ft);
		
		MemberCountChartVO fft = new MemberCountChartVO();
		fft.setText("50대");
		fft.setCount(adminDao.ageDistribution(50, 59));
		count.add(fft);
		
		MemberCountChartVO st = new MemberCountChartVO();
		st.setText("60대");
		st.setCount(adminDao.ageDistribution(60, 69));
		count.add(st);
		
		return count;
	}
	
	@Override
	public List<MemberCountChartVO> locationDistribution() {
		List<MemberCountChartVO> count = new ArrayList<>();
		MemberCountChartVO kang = new MemberCountChartVO();
		kang.setText("강원도");
		kang.setCount(adminDao.loactionDistribution("강원"));
		count.add(kang);
		
		
		MemberCountChartVO gyeong = new MemberCountChartVO();
		gyeong.setText("경기도");
		gyeong.setCount(adminDao.loactionDistribution("경기"));
		count.add(gyeong);
		
		MemberCountChartVO chung = new MemberCountChartVO();
		chung.setText("충청도");
		chung.setCount(adminDao.loactionDistribution("충청"));
		count.add(chung);
		
		MemberCountChartVO jeonl = new MemberCountChartVO();
		jeonl.setText("전라도");
		jeonl.setCount(adminDao.loactionDistribution("전라"));
		count.add(jeonl);
		
		MemberCountChartVO gyoengs = new MemberCountChartVO();
		gyoengs.setText("경상도");
		gyoengs.setCount(adminDao.loactionDistribution("경상"));
		count.add(gyoengs);
		
		MemberCountChartVO jeju = new MemberCountChartVO();
		jeju.setText("제주도");
		jeju.setCount(adminDao.loactionDistribution("제주"));
		count.add(jeju);
		
		MemberCountChartVO seoul = new MemberCountChartVO();
		seoul.setText("서울시");
		seoul.setCount(adminDao.loactionDistribution("서울"));
		count.add(seoul);
		
		MemberCountChartVO incheon = new MemberCountChartVO();
		incheon.setText("인천시");
		incheon.setCount(adminDao.loactionDistribution("인천"));
		count.add(incheon);
		
		MemberCountChartVO daejeon = new MemberCountChartVO();
		daejeon.setText("대전시");
		daejeon.setCount(adminDao.loactionDistribution("대전"));
		count.add(daejeon);
		
		MemberCountChartVO gwangju = new MemberCountChartVO();
		gwangju.setText("광주시");
		gwangju.setCount(adminDao.loactionDistribution("광주"));
		count.add(gwangju);
		
		MemberCountChartVO daegu = new MemberCountChartVO();
		daegu.setText("대구시");
		daegu.setCount(adminDao.loactionDistribution("대구"));
		count.add(daegu);
		
		MemberCountChartVO busan = new MemberCountChartVO();
		busan.setText("부산시");
		busan.setCount(adminDao.loactionDistribution("부산"));
		count.add(busan);
		
		MemberCountChartVO ulsan = new MemberCountChartVO();
		ulsan.setText("울산");
		ulsan.setCount(adminDao.loactionDistribution("울산"));
		count.add(ulsan);
		
		MemberCountChartVO sejong = new MemberCountChartVO();
		sejong.setText("세종시");
		sejong.setCount(adminDao.loactionDistribution("세종"));
		count.add(sejong);
		
		return count;
	}
	
	@Override
	public List<MemberCountChartVO> membershipActiveMemberCount() {
		List<MemberCountChartVO> count = new ArrayList<>();
		MemberCountChartVO member = new MemberCountChartVO();
		member.setText("총 회원 수");
		member.setCount(adminDao.memberCount());
		count.add(member);
		
		MemberCountChartVO membershipCount = new MemberCountChartVO();
		membershipCount.setText("멤버쉽에 가입 된 회원 수");
		membershipCount.setCount(adminDao.membershipActiveMemberCount());
		count.add(membershipCount);
		
		return count;
	}
	@Override
	public void hiddenMember(int memberNo) {
		memberDao.memberHidden(memberNo);
	}
	@Override
	public List<ExitMemberVO> hideMemberList(String keyword, String search, int startRow, int endRow) {
		return adminDao.hideMemberList(keyword, search, startRow, endRow);
	}
}
