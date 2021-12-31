package com.kh.onemile.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.service.cobuy.CobuyService;


@RequestMapping("/cobuy")
@RestController
public class CobuyController {
	@Autowired
	private CobuyService cobuyService;

	@GetMapping("/reg")
	public String reg() {

		return "reg";
	}
	// 공동 구매 글을 올리면 -- 컨트롤러
	// 공동 구매 테이블에 저장을 하고 --서비스
	// 파일이 있으면 이미지 파일을 저장하고  --서비스
	//공동 구매 등록 기능 ->  공동구매 글 , 이미지 , 연결테이블 
	@PostMapping("/reg")
	public String reg(@ModelAttribute CobuyDTO cobuyDTO) throws IllegalStateException, IOException {
		int cobuyNo = cobuyService.reg(cobuyDTO);
		return "redirect:cobuy/detail?cobuyNo="+cobuyNo;
	}
	@GetMapping("/list")
	public String list(Model model) {
		// 지도에 위치 정보 등록
		// 이미지 등록.
		// 소셜 내용 등록.
		// 등록할 마일즈 등록 null 허용.	
		
		model.addAttribute("list", cobuyService.getList());
		return "reg";
	}
	@GetMapping("/detail")
	public String detail(@RequestParam int cbiNo) {
		return "detail";
	}
	@PostMapping("/reply")
	public String detail(Model model) {
		return "detail";
	}
}
