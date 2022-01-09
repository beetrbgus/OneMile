package com.kh.onemile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String memberList(Model model) {
		model.addAttribute("memberList",adminService.memberList());
		return "approve";
	}
	
	@PostMapping("/approve")
	public String approve(Model model) {
		return "admin/approve";
	}

}