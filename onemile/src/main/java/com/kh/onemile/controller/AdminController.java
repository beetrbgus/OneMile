package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.kh.onemile.service.admin.AdminService;

@RequestMapping("/admin")
@RestController
public class AdminController {
	@Autowired 
	private AdminService adminService;
	//회원 승인
	@GetMapping("/approve")
	public String approve() {
		return "approve";
	}
	@PostMapping("/approve")
	public String approve(Model model) {
		return "";
	}
	//회원 승인
	@GetMapping("/approve/member")
	public String memberList(Model model) {
		model.addAttribute("memberList",adminService.memberList());
		return "approve";
	}
	//게시판 목록
	@GetMapping("/list/{largeName}/{middleName")
	public String list(@PathVariable("largeName") String largeName, @PathVariable("middleName") String middleName){
		
		return "/admin/list";
	}
	//게시판 숨김처리
	@GetMapping("/hidden/{largeName}/{middleName")
	public String hidden(@PathVariable("largeName") String largeName, @PathVariable("middleName") String middleName){
		
		return "/admin/hidden";
	}
	//게시판 수정
	@GetMapping("/modify/{largeName}/{middleName")
	public String modify(@PathVariable("largeName") String largeName, @PathVariable("middleName") String middleName){
		
		return "/admin/modify";
	}
	//회원 목록
	@GetMapping("/member/list")
	public String memList() {
		return "/member/list";
	}
	//회원 수정
	@GetMapping("/member/modify")
	public String memMod() {
		return "/member/modify";
	}
	//회원 hidden
	@GetMapping("/member/hidden")
	public String memHidden() {
		return "/member/hidden";
	}
}