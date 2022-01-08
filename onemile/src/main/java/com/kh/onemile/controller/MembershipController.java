package com.kh.onemile.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.repository.membership.MembershipDao;
import com.kh.onemile.service.membership.MembershipService;
import com.kh.onemile.vo.kakaopay.ConfirmVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/membership")
public class MembershipController {
	@Autowired
	private MembershipDao membershipDao;
	@Autowired
	private MembershipService membershipService;
	
	//멤버십 목록
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", membershipDao.list());
		return "membership/list";
	}
	
	@GetMapping("/confirm")
	public String confirm(@RequestParam int productNo , @RequestParam int quantity, Model model, HttpSession session) {
		//상품명 ,  상품 가격 , 상품 수량 , 총 결제금액 , 
		log.debug(" -------------------------------------------");
		
		ConfirmVO confirmResultVO  =membershipService.getConfirm(productNo,quantity);
		model.addAttribute("confirmVO", confirmResultVO);
		
		return "membership/confirm";
	}
	@PostMapping("/confirm")
	public String confirm(@RequestParam int productNo, @RequestParam int quantity,RedirectAttributes redirectAttributes,HttpSession session) {
		//상품명 ,  상품 가격 , 상품 수량 , 총 결제금액 , 
		ConfirmVO confirmVO  =membershipService.getConfirm(productNo,quantity);
		
		redirectAttributes.addFlashAttribute("confirmVO", confirmVO);
		log.debug(confirmVO.toString());
		return "redirect:/pay/confirm";
	}

	
	//내가 가입한 멤버십 목록
	@GetMapping("/reg_membership")
	public String regMembership(Model model, HttpSession session) {
		int memberNo = (int)session.getAttribute("logNo");
		List<MembershipBuyDTO> membershipBuyDTO = membershipDao.joinMembership(memberNo);
		model.addAttribute("list",membershipBuyDTO);
		return "membership/reg_membership";
	}
}