package com.kh.onemile.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

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

import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.service.category.CategoryService;
import com.kh.onemile.service.social.SocialService;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;
import com.kh.onemile.vo.social.category.CategoryVO;
import com.kh.onemile.vo.social.category.MiddleCategoryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/social")
@Controller
public class SocialController {
	@Autowired
	private SocialService socialService;
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/reg")
	public String getReg(Model model) {
		// 지도에 위치 정보 등록
		// 이미지 등록.
		// 소셜 내용 등록.
		// 등록할 마일즈 등록 null 허용.
		List<SocialBigCategoryDTO> result = categoryService.getBiglist();
		log.debug("result       : "+result.toString()); 
		model.addAttribute("bigCategory",result);
		return "social/reg2";
	}
	@PostMapping("/reg")
	public String postReg(@ModelAttribute SocialRegVO socialRegVO,HttpSession session) throws IllegalStateException, IOException{
		log.debug("SocialRegVO  "+socialRegVO.toString());
		int memNo = Integer.parseInt(String.valueOf(session.getAttribute("logNo")));
		socialRegVO.setMemberNo(memNo);
		socialService.reg(socialRegVO);
		return "social/detail";
	}

	@GetMapping({"/list/{bigCategory}","/list","/",""})
	public String getList(@PathVariable(required = false) String bigCategory,
			@RequestParam(required = false,defaultValue = "") String sc,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "10") int size
			,Model model) {
		PaginationVO paginationVO =new PaginationVO(page,size);
		bigCategory =(bigCategory==null||bigCategory.equals("/"))?"":bigCategory;
		
		if(sc==null||sc.equals("/")) {
			paginationVO.setKeyword("smc.smallValue");
			sc ="";
		}
		paginationVO.setCategory(bigCategory);
		paginationVO.setSearchword(sc);
		List<SocialBigCategoryDTO> bcgList = categoryService.getBiglist();
		List<MiddleCategoryVO> mcgList = categoryService.getMiddlelist(bigCategory);		
		List<SocialListVO> scList = socialService.getList(paginationVO);
		
		log.debug("mcgList12345   "+mcgList);
		log.debug("bcgList12345   "+bcgList);
		log.debug("category1234   "+bigCategory);
		log.debug("category    "+paginationVO.toString());
		log.debug("result       : "+scList.toString());
		model.addAttribute("nowcategory", bigCategory);
		model.addAttribute("bcgList",bcgList);
		model.addAttribute("mcgList",mcgList);
		model.addAttribute("scList",scList);
		return "social/list";
	}
	@GetMapping("/detail/{socialNo}")
	public String getDetail(@PathVariable int socialNo, Model model) {
		
		SocialDetailVO detail = socialService.getDetail(socialNo);
		log.debug("result       : "+detail.toString()); 
		model.addAttribute("detail",detail);
		return "social/detail";
	}
}
