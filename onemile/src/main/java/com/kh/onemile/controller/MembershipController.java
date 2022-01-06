package com.kh.onemile.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onemile.entity.product.MembershipDTO;
import com.kh.onemile.repository.membership.MembershipDao;

@Controller
@RequestMapping("/membership")
public class MembershipController {
	@Autowired
	private MembershipDao membershipDao;
	
	//멤버십 목록 + AD추가
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", membershipDao.list());
		
		return "membership/list";
	}
	
	//결제할 상품 확인
	@GetMapping("/confirm")
	public String confirm(@RequestParam int mspNo, Model model, HttpSession session) {
		List<MembershipDTO> list = membershipDao.search(mspNo);
		model.addAttribute("list", list);
		session.setAttribute("mspNo", mspNo);
		return "membership/confirm";
	}
	
	
}