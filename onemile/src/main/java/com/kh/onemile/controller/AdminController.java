package com.kh.onemile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onemile.service.admin.AdminService;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.admin.ExitMemberVO;
import com.kh.onemile.vo.admin.MemberListVO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired 
	private AdminService adminService;

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
//	@GetMapping("/approve/list")
//	@ResponseBody
//	public List<MemberListVO> approveList(@RequestParam(required = false) String keyword, @RequestParam(required = false) String search,
//			@RequestParam(required =false, defaultValue = "2") int page,
//			@RequestParam(required =false, defaultValue = "20") int size) {
//		int endRow = page* size;
//		int startRow = endRow - (size - 1);
//		return adminService.notMember(keyword, search, endRow, startRow);
//	}

	@GetMapping("/list")
	public String list(Model model) {
		return "admin/approve";
		
	}

	//게시판 목록
	@GetMapping("/board/list/{largeName}/{middleName}")
	public List<CommuDetailVO> list(@PathVariable("largeName") String largeName, @PathVariable("middleName") String middleName,
			@RequestParam(required =false, defaultValue = "2") int page,
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
	public String modify(@PathVariable("largeName") String largeName, @PathVariable("middleName") String middleName){
		
		return "/admin/board/modify";
	}
	//회원 목록
	@GetMapping("/member/list")
	@ResponseBody
	public List<MemberListVO> memList(@RequestParam(required = false) String keyword, @RequestParam(required = false) String search,
			@RequestParam(required =false, defaultValue = "2") int page,
			@RequestParam(required =false, defaultValue = "20") int size) {
		int endRow = page* size;
		int startRow = endRow - (size - 1);
		return adminService.memberList(keyword, search, endRow, startRow);
	}
	//탈퇴회원 목록
	@GetMapping("/member/hidden")
	@ResponseBody
	public List<ExitMemberVO> exitMemList(@RequestParam(required = false) String keyword, @RequestParam(required = false) String search,
			@RequestParam(required =false, defaultValue = "2") int page,
			@RequestParam(required =false, defaultValue = "20") int size) {
		
		int endRow = page* size;
		int startRow = endRow - (size - 1);
		return adminService.exitMemberList(keyword, search, endRow, startRow);
	}
	//회원 수정
	@GetMapping("/member/modify")
	public String memMod() {
		return "/admin/member/modify";
	}
}