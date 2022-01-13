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

import com.kh.onemile.entity.member.membership.AdDTO;
import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.service.category.CategoryService;
import com.kh.onemile.service.member.MemberService;
import com.kh.onemile.service.social.SocialService;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;
import com.kh.onemile.vo.social.category.MiddleCategoryVO;
import com.kh.onemile.vo.social.participate.ParticipateVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/social")                       																									 
@Controller
public class SocialController {
	@Autowired
	private SocialService socialService;
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/reg")
	public String getReg(Model model,HttpSession session) {
		int memberNo = (int) session.getAttribute("logNo");
		AdDTO adDTO = memberService.membership(memberNo);
		
		List<SocialDTO> socialDTO = socialService.getCount(memberNo);
		
		log.debug("혜택"+adDTO.getSMaxCnt());
		model.addAttribute("AD",adDTO.getSMaxCnt());
		
		log.debug("갯수"+adDTO.getSRegCnt());
		log.debug("생성한 소셜링"+socialDTO.size());
		if(adDTO.getSRegCnt() > socialDTO.size())
		{
			// 지도에 위치 정보 등록
			// 이미지 등록.
			// 소셜 내용 등록.
			// 등록할 마일즈 등록 null 허용.
			List<SocialBigCategoryDTO> result = categoryService.getBiglist();
			log.debug("result       : "+result.toString()); 
			model.addAttribute("bigCategory",result);
			return "social/reg2";
		}
		else {
			return "redirect:social/list";	
		}
		
	}
	
	@PostMapping("/reg")
	public String postReg(@ModelAttribute SocialRegVO socialRegVO,HttpSession session) throws IllegalStateException, IOException{
		log.debug("SocialRegVO  "+socialRegVO.toString());
		
		int memNo = Integer.parseInt(String.valueOf(session.getAttribute("logNo")));
		
		socialRegVO.setMemberNo(memNo);
		int socialNo = socialService.reg(socialRegVO);
		return "redirect:detail/"+socialNo;
	}
	@GetMapping("/modify/{socialNo}")
	public String getModify(@PathVariable int socialNo,Model model,HttpSession session) {
		int memberNo = (int) session.getAttribute("logNo");
		AdDTO adDTO = memberService.membership(memberNo);
		
		// 입력된 정보 가져오기.
		SocialDetailVO socialDetail = socialService.getDetail(socialNo);
		List<SocialBigCategoryDTO> bigcate = categoryService.getBiglist();
		
		model.addAttribute("AD",adDTO.getSMaxCnt());
		model.addAttribute("bigCategory",bigcate);
		model.addAttribute("socialDetail",socialDetail);
		
		log.debug("혜택"+adDTO.getSMaxCnt());
		log.debug("result       : "+bigcate.toString()); 
		return "redirect:detail/"+socialNo;
	}
	
	@PostMapping("/modify")
	public String postModify(@ModelAttribute SocialRegVO socialRegVO,HttpSession session) throws IllegalStateException, IOException{
		log.debug("SocialRegVO  "+socialRegVO.toString());
		
		int memNo = Integer.parseInt(String.valueOf(session.getAttribute("logNo")));
		
		socialRegVO.setMemberNo(memNo);
		int socialNo = socialService.reg(socialRegVO);
		return "redirect:detail/"+socialNo;
	}


	@GetMapping({"/list/{bigcate}","/list","/",""})
	public String getList(@PathVariable(required = false) String bigcate,
			@RequestParam(required = false,defaultValue = "") String sc,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "10") int size
			,Model model) {
		PaginationVO paginationVO =new PaginationVO(page,size);
		bigcate =(bigcate==null||bigcate.equals("/"))?"":bigcate;
		
		if(sc==null||sc.equals("/")) {
			paginationVO.setKeyword("smc.smallValue");
			sc ="";
		}
		paginationVO.setCategory(bigcate);
		paginationVO.setSearchword(sc);
		List<SocialBigCategoryDTO> bcgList = categoryService.getBiglist();
		List<MiddleCategoryVO> mcgList = categoryService.getMiddlelist(bigcate);		
		List<SocialListVO> scList = socialService.getList(paginationVO);
		
		log.debug("mcgList12345   "+mcgList);
		log.debug("bcgList12345   "+bcgList);
		log.debug("category1234   "+bigcate);
		log.debug("category    "+paginationVO.toString());
		log.debug("result       : "+scList.toString());
		model.addAttribute("nowcategory", bigcate);
		model.addAttribute("bcgList",bcgList);
		model.addAttribute("mcgList",mcgList);
		model.addAttribute("scList",scList);

		return "social/list";
	}
	// 소모임 상세
	@GetMapping("/detail/{socialNo}")
	public String getDetail(@PathVariable int socialNo, Model model) {
		
		SocialDetailVO detail = socialService.getDetail(socialNo);
		log.debug("result       : "+detail.toString()); 
		model.addAttribute("detail",detail);
		return "social/detail";
	}
	// 소모임 참가.
	@PostMapping("/socialjoin")
	public String joinSocial(@RequestParam int socialNo, Model model,HttpSession session) {
		
		int memberNo = (int)session.getAttribute("logNo");
		ParticipateVO participateVO = new ParticipateVO();
		participateVO.setMemberNo(memberNo);
		participateVO.setSocialNo(socialNo);
		
		socialService.socialJoin(participateVO);
		log.debug("result       : "+participateVO.toString());
		return "redirect:detail/"+socialNo;
	}
	// 소모임 참가.
	@PostMapping("/socialexit")
	public String exitSocial(@RequestParam int socialNo, Model model,HttpSession session) {
		
		int memberNo = (int)session.getAttribute("logNo");
		ParticipateVO participateVO = new ParticipateVO();
		participateVO.setMemberNo(memberNo);
		participateVO.setSocialNo(socialNo);

		socialService.exitSocial(participateVO);
		log.debug("result       : "+participateVO.toString());
		return "redirect:list";
	}
}
