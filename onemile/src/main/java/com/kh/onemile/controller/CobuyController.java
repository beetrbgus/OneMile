package com.kh.onemile.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onemile.service.cobuy.CobuyService;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;

import lombok.extern.slf4j.Slf4j;


@RequestMapping("/cobuy")
@Controller
@Slf4j
public class CobuyController {
	@Autowired
	private CobuyService cobuyService;
	
	@GetMapping("/regcobuy")
	public String getreg() throws IllegalStateException, IOException {
		return "/cobuy/regcobuy";
	}
	// 공동 구매 글을 올리면 -- 컨트롤러
	// 공동 구매 테이블에 저장을 하고 --서비스
	// 파일이 있으면 이미지 파일을 저장하고  --서비스
	//공동 구매 등록 기능 ->  공동구매 글 , 이미지 , 연결테이블 
	@PostMapping("/regcobuy")
	public String reg(@ModelAttribute CobuyDetailVO cobuyDetailVO,HttpSession session) throws IllegalStateException, IOException {
		int memNo = Integer.parseInt(String.valueOf(session.getAttribute("logNo")));
		cobuyDetailVO.setMemberNo(memNo);
		log.debug("박근우 바보 회원 번호        "+memNo);
		System.out.println("-------------------------------------------------------");
		System.out.println(cobuyDetailVO.toString());
		log.debug("-------------------------------------------------------");
		log.debug(cobuyDetailVO.toString());
		int cbiNo = cobuyService.reg(cobuyDetailVO);

		return "redirect:detail?cbiNo="+cbiNo;
	@PostMapping("/reg")
	public String reg(@ModelAttribute CobuyDTO cobuyDTO) throws IllegalStateException, IOException {
		int cobuyNo = cobuyService.reg(cobuyDTO);
		return "redirect:cobuy/detail?cobuyNo="+cobuyNo;
	}
	@GetMapping("/list")
	public String list(Model model) {
		List<CobuyListVO> result = cobuyService.getList();
		for(CobuyListVO item :result) {
			log.debug("---------------------------");
			log.debug(item.getPName());
			System.out.println("---------------------------");
			System.out.println(item.getPName());
			
		}
		model.addAttribute("list", result);
		
		return "/cobuy/list";
	}
	@GetMapping("/detail")
	public String detail(@RequestParam int cobuyNo , Model model) {
		model.addAttribute("get", cobuyService.getDetail(cobuyNo));
		return "detail";
	}
	@PostMapping("/delete")
	public String delete(@RequestParam int cobuyNo) {
		cobuyService.delete(cobuyNo);
		return "redirect:/list";
	}
	@GetMapping("/modify")
	public String getModify(@RequestParam int cobuyNo , Model model) {
		model.addAttribute("get", cobuyService.getDetail(cobuyNo));
		return "detail";
	}
	@PostMapping("/modify")
	public String postModify(@ModelAttribute CobuyDetailVO cobuyDetailVO) {
//		int cbiNo = cobuyService.modify(cobuyDetailVO);
//		return "redirect:cobuy/detail?cbiNo="+cbiNo;
		return "";
	}
	@RequestMapping("/upload")
	public void uploadTest(@ModelAttribute CobuyDetailVO testVO) {
		log.debug(" -------------------------------------------");
		log.debug(testVO.toString());
	}
}
