package com.kh.onemile.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onemile.repository.admin.AdminDao;
import com.kh.onemile.service.admin.AdminService;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.admin.ExitMemberVO;
import com.kh.onemile.vo.admin.MemberCountChartVO;
import com.kh.onemile.vo.admin.MemberListVO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired 
	private AdminService adminService;

	@Autowired
	private AdminDao adminDao;
	
	//관리자 홈
	@GetMapping("/")
	public String home() {
		return "/admin/home";
	}
	//회원 승인
	@GetMapping("/approve")
	public String approve(@RequestParam int memberNo) {
		adminService.approveMember(memberNo);
		return "redirect:/admin/approve/list";
	}
//	@PostMapping("/approve")
//	public String approve(@RequestParam int memberNo) {
//		adminService.approveMember(memberNo);
//		return "redirect:/admin/approve/list";
//		}
	@GetMapping("/approve/listdetail")
	@ResponseBody
	public List<MemberListVO> approveListD(
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false) String search,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "20") int size) {
		int endRow = page* size;
		int startRow = endRow - (size - 1);
		System.err.println(keyword=="");
		System.err.println(keyword==null);
		return adminService.notMember(keyword, search, startRow,endRow);
	}
	@GetMapping("/approve/list")
	public String approveList() {
		return "/admin/approve/list";
	}

	@GetMapping("/list")
	public String list(Model model) {
		return "admin/approve";
	}

	//게시판 목록
	@GetMapping("/board/list/{largeName}/{middleName}")
	public List<CommuDetailVO> list(@PathVariable("largeName") String largeName, @PathVariable("middleName") String middleName,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "20") int size,
			@RequestParam(required =false) String keyword,
			@RequestParam(required =false) String search
			){
		int endRow = page* size;
		int startRow = endRow - (size - 1);
		return adminService.boardList(largeName, startRow, endRow, keyword, search);
	}
	//게시판 숨김처리
	@GetMapping("/board/hidden/{largeName}/{middleName}")
	public String hidden(@PathVariable("largeName") String largeName, @PathVariable("middleName") String middleName){
		
		return "/admin/board/hidden";
	}
	//게시판 수정
	@GetMapping("/board/modify/{largeName}/{middleName}")
	public String modify(@PathVariable("largeName") String largeName, 
			@PathVariable("middleName") String middleName){
		
		return "/admin/board/modify";
	}
	//회원 목록
	@GetMapping("/member/listdetail")
	@ResponseBody
	public List<MemberListVO> memList(@RequestParam(required = false,defaultValue = "") String keyword, 
			@RequestParam(required = false,defaultValue = "") String search,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "20") int size, Model model) {
		int endRow = page* size;
		int startRow = endRow - (size - 1);
		return adminService.memberList(keyword, search, startRow, endRow);
	}
	
	@GetMapping("/member/list")
	public String memberList() {
		return "admin/member/list";
	}
	
	//탈퇴회원 목록
	@GetMapping("/member/hiddendetail")
	@ResponseBody
	public List<ExitMemberVO> exitMemList(@RequestParam(required = false) String keyword, @RequestParam(required = false) String search,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "20") int size) {
		
		int endRow = page* size;
		int startRow = endRow - (size - 1);
		return adminService.exitMemberList(keyword, search, startRow, endRow);
	}
	
	@GetMapping("/member/hidden")
	public String exitmemberList() {
		return "admin/member/hidden";
	}
	//회원 수정
	@GetMapping("/member/modify")
	public String memMod() {
		return "/admin/member/modify";
	}
	
	//대충 만든 통계
	@GetMapping("/statistics/list")
	public String statistics() {
		return "/admin/statistics_list";
	}
	
	@GetMapping("/statistics/member_statistics")
	public String memberStatisticsList() {
		return "/admin/statistics/member_statistics";
	}
	
	//회원수관련 통계
	@PostMapping("/statistics/member_statistics")
	@ResponseBody
	public List<MemberCountChartVO> memberStatistics() {
		return adminService.memberCount();
	}
	//연령대분포도 통계
	@PostMapping("/statistics/age_distribution_statistics")
	@ResponseBody
	public List<MemberCountChartVO> ageDistributionStatistics(){
		return adminService.ageDistribution();
	}
	//지역분포도 통계
	@PostMapping("/statistics/location_statistics")
	@ResponseBody
	public List<MemberCountChartVO> locationDistribution(){
		return adminService.locationDistribution();
	}
	//멤버쉽가입여부 통계
	@PostMapping("/statistics/membership_statistics")
	@ResponseBody
	public List<MemberCountChartVO> membership(){
		return adminService.membershipActiveMemberCount();
	}
}