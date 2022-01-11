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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onemile.service.cobuy.CobuyService;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;
import com.kh.onemile.vo.cobuy.CobuyVO;
import com.kh.onemile.vo.kakaopay.ConfirmVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/cobuy")
@Controller
@Slf4j
public class CobuyController {
	@Autowired
	private CobuyService cobuyService;

	@GetMapping("/regcobuy")
	public String getreg(Model model) throws IllegalStateException, IOException {
		model.addAttribute("", "");

		return "/cobuy/regcobuy";
	}

	@PostMapping("/regcobuy")
	public String postreg(@ModelAttribute CobuyRegVO cobuyRegVO, HttpSession session)
			throws IllegalStateException, IOException {
		int memNo = Integer.parseInt(String.valueOf(session.getAttribute("logNo")));
		cobuyRegVO.setMemberNo(memNo);
		int cobuyNo = cobuyService.reg(cobuyRegVO);

		return "redirect:detail?cobuyNo=" + cobuyNo;
	}

	@GetMapping("/list")
	public String list() {
		return "/cobuy/list";
	}
	
//	@GetMapping("/list")
//	public String list(Model model) {
//		List<CobuyListVO> result = cobuyService.getList();
//		for(CobuyListVO item :result) {
//			log.debug("---------------------------");
//			log.debug(item.getPName());
//			System.out.println("---------------------------");
//			System.out.println(item.getPName());
//		}
//		model.addAttribute("list", result);
//		
//		return "/cobuy/list";
//	}
	
	@GetMapping("/listdetail")
	@ResponseBody
	public List<CobuyListVO> list(
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "10") int size
			) {
		int endRow = page* size;
		int startRow = endRow - (size - 1);
		return cobuyService.getList(startRow, endRow);
	}
	@GetMapping("/detail") 
	public String detail(@RequestParam int cobuyNo , Model model) {
		CobuyDetailVO cobuyDetailVO =cobuyService.getDetail(cobuyNo);
		System.out.println("cobuyDetailVO.getCobuyNo()   "+cobuyDetailVO.getCobuyNo());
		System.out.println("cobuyDetailVO.getDescript()   "+cobuyDetailVO.getDescript());
		System.out.println("cobuyDetailVO.getDetailAddress()   "+cobuyDetailVO.getDetailAddress());
		System.out.println("cobuyDetailVO.getMemberNo()   "+cobuyDetailVO.getMemberNo());
		System.out.println("cobuyDetailVO.getTitle()   "+cobuyDetailVO.getTitle());
		
		model.addAttribute("detail", cobuyDetailVO);
		
		return "/cobuy/detail";
	}

	@PostMapping("/delete")
	public String delete(@RequestParam int cobuyNo) {
		cobuyService.delete(cobuyNo);
		return "redirect:/list";
	}

	@GetMapping("/modify")
	public String getModify(@RequestParam int cobuyNo, Model model) {
		model.addAttribute("detail", cobuyService.getDetail(cobuyNo));
		return "detail";
	}

	@PostMapping("/modify")
	public String postModify(@ModelAttribute CobuyVO cobuyModDTO, HttpSession session)
			throws IllegalStateException, IOException {
		int memNo = Integer.parseInt(String.valueOf(session.getAttribute("logNo")));

		if (memNo == cobuyModDTO.getMemberNo()) {
			cobuyService.modify(cobuyModDTO);
		}

		return "redirect:detail?cobuyNo=" + cobuyModDTO.getCobuyNo();
	}

	@GetMapping("/confirm")
	public String confirm(@RequestParam int productNo, @RequestParam int quantity, Model model, HttpSession session) {
		// 상품명 , 상품 가격 , 상품 수량 , 총 결제금액 ,
		ConfirmVO confirmVO = new ConfirmVO();
		confirmVO.setProductNo(productNo);
		confirmVO.setQuantity(quantity);
		confirmVO = cobuyService.getConfirm(confirmVO);

		model.addAttribute("confirmVO", confirmVO);
		log.debug(confirmVO.toString());
		return "cobuy/confirm";
	}

	// 결제할 상품 확인
	@PostMapping("/confirm")
	public String confirm(@RequestParam int productNo, @RequestParam int quantity,
			RedirectAttributes redirectAttributes, HttpSession session) {
		// 상품명 , 상품 가격 , 상품 수량 , 총 결제금액 ,
		ConfirmVO confirmVO = new ConfirmVO();
		confirmVO.setProductNo(productNo);
		confirmVO.setQuantity(quantity);
		
		int memNo = (int) session.getAttribute("logNo");
		ConfirmVO confirmResultVO = cobuyService.getConfirm(confirmVO);
		confirmResultVO.setMemberNo(memNo);
		confirmResultVO.setPartner_user_id(String.valueOf(session.getAttribute("logId")));
		redirectAttributes.addFlashAttribute("confirmVO", confirmResultVO);
		
		return "redirect:/pay/confirm";
	}
}
