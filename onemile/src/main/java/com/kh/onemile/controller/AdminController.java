package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onemile.service.admin.AdminService;

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
	@GetMapping("/approve/list")
	public String list(Model model) {
		model.addAttribute("list",adminService.notMember());
		return "/admin/approve/list";
		
	}
	//게시판 목록
	@GetMapping("/board/list/{largeName}/{middleName}")
	public String list(@PathVariable("largeName") String largeName, @PathVariable("middleName") String middleName,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "10") int size
			){
		
		return "/admin/board/list";
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
	public String memList(Model model) {
		model.addAttribute("list", adminService.memberList());
		return "/admin/member/list";
	}
	//탈퇴회원 목록
	@GetMapping("/member/hidden")
	public String exitMemList(Model model) {
		model.addAttribute("list", adminService.exitMemberList());
		return "/admin/member/hidden";
	}
	//회원 수정
	@GetMapping("/member/modify")
	public String memMod() {
		return "/admin/member/modify";
	}
}