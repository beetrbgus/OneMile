package com.kh.onemile.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.onemile.entity.member.membership.AdDTO;
import com.kh.onemile.entity.product.ProductBuyDTO;
import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.service.cobuy.CobuyService;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.cobuy.CobuyCatVO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;
import com.kh.onemile.vo.kakaopay.ConfirmVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialRegVO;
import com.kh.onemile.vo.social.category.MiddleCategoryVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/cobuy")
@Controller 
@Slf4j
public class CobuyController {
	@Autowired
	private CobuyService cobuyService;
	// 등록
	@GetMapping("/reg")
	public String getreg(Model model) throws IllegalStateException, IOException {
		model.addAttribute("", "");

		return "/cobuy/reg";
	}

	@PostMapping("/reg")
	public String postreg(@ModelAttribute CobuyRegVO cobuyRegVO, HttpSession session)
			throws IllegalStateException, IOException {
		int memNo = Integer.parseInt(String.valueOf(session.getAttribute("logNo")));
		cobuyRegVO.setMemberNo(memNo);
		int cobuyNo = cobuyService.reg(cobuyRegVO);

		return "redirect:detail?cobuyNo=" + cobuyNo;
	}
	// 상품 목록
	@GetMapping({"/list/{category}","/list","/",""})
	public String list(@PathVariable(required = false) String category,
			@RequestParam(required = false,defaultValue = "") String keyword,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "10") int size
			,Model model,HttpSession session) {
		log.warn("page=========="+page);
		log.warn("size============"+size);
		PaginationVO paginationVO =new PaginationVO(page,size);
		//검색어가 있으면 지역 무시
		if(!keyword.equals("") &&session.getAttribute("goo")!=null) {
			String goo = (String)session.getAttribute("goo");
			paginationVO.setGoo(goo);	
		}else {
			paginationVO.setKeyword(keyword);
		} 
		if(category==null||category.equals("/")) {
			category="";
			paginationVO.setCategory(category);
		}else {
			paginationVO.setCategory("/"+category);
			model.addAttribute("nowcategory", category);
		}

		List<CobuyListVO> cobuyListVO = cobuyService.getList(paginationVO);
		
		for(CobuyListVO cobuy:cobuyListVO) {
			log.debug("cobuyListVO    "+cobuy.toString());
		}
	     model.addAttribute("cobuyList", cobuyListVO);
	     List<CobuyCatVO> cobuyCatVO = cobuyService.getMiddleName();
	     System.err.println(cobuyCatVO);
	     model.addAttribute("category", cobuyCatVO);
		return "cobuy/list";
	}
	// 상품 목록
	@GetMapping("/listdetail")
	@ResponseBody
	public List<CobuyListVO> list(
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "10") int size
			) {
		
		PaginationVO paginationVO =new PaginationVO(page,size);
		return cobuyService.getList(paginationVO);
	}
	
	@GetMapping("/detail/{cobuyNo}") 
	public String detail(@PathVariable int cobuyNo , Model model) {
		log.debug("cobuyNo  "+cobuyNo);
		CobuyDetailVO cobuyDetailVO =cobuyService.getDetail(cobuyNo);
		System.out.println("cobuyDetailVO.getCobuyNo()   "+cobuyDetailVO.getCobuyNo());
		System.out.println("cobuyDetailVO.getDescript()   "+cobuyDetailVO.getDescript());
		System.out.println("cobuyDetailVO.getDetailAddress()   "+cobuyDetailVO.getDetailAddress());
		System.out.println("cobuyDetailVO.getMemberNo()   "+cobuyDetailVO.getMemberNo());
		System.out.println("cobuyDetailVO.getTitle()   "+cobuyDetailVO.getTitle());
		
		model.addAttribute("detail", cobuyDetailVO);
		
		return "/cobuy/detail";
	}

	@GetMapping("/delete/{cobuyNo}")
	public String delete(@PathVariable int cobuyNo) {
		cobuyService.delete(cobuyNo);
		return "redirect:/cobuy/list";
	}

	@GetMapping("/modify/{cobuyNo}")
	public String getModify(@PathVariable int cobuyNo, Model model) {
		model.addAttribute("detail", cobuyService.getDetail(cobuyNo));
		return "/cobuy/modify";
	}

	@PostMapping("/modify")
	public String postModify(@ModelAttribute CobuyDetailVO cobuyModDTO, HttpSession session)
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
	
	//내가 구매한 공동구매 목록
	@GetMapping("/buylist")
	public String regMembership(Model model, HttpSession session) {
		int memberNo = (int)session.getAttribute("logNo");
		List<ProductBuyDTO> ProductBuyDTO = cobuyService.getbuyList(memberNo);
		model.addAttribute("list",ProductBuyDTO);
		return "cobuy/buylist";
	}
}
