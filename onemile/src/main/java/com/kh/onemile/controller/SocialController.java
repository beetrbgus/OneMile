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

import com.kh.onemile.entity.member.membership.AdDTO;
import com.kh.onemile.entity.social.SocialBigCategoryDTO;
import com.kh.onemile.entity.social.SocialDTO;
import com.kh.onemile.repository.social.participant.ParticipantDao;

import com.kh.onemile.service.category.CategoryService;
import com.kh.onemile.service.member.MemberService;
import com.kh.onemile.service.social.SocialService;
import com.kh.onemile.service.social.participant.ParticipantService;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.social.SocialDetailVO;
import com.kh.onemile.vo.social.SocialListVO;
import com.kh.onemile.vo.social.SocialRegVO;
import com.kh.onemile.vo.social.category.MiddleCategoryVO;
import com.kh.onemile.vo.social.participate.ParticipateDetailVO;
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
	@Autowired
	private ParticipantDao participantDao;
	@Autowired
	private ParticipantService participantService;
	
	@GetMapping("/reg")
	public String getReg(Model model,HttpSession session) {
		int memberNo = (int) session.getAttribute("logNo");
		
		AdDTO adDTO = memberService.membership(memberNo);
		model.addAttribute("AD",adDTO.getSMaxCnt());
		log.debug("??????"+adDTO.getSMaxCnt());
		// ????????? ?????? ?????? ??????
		// ????????? ??????.
		// ?????? ?????? ??????.
		// ????????? ????????? ?????? null ??????.
		List<SocialBigCategoryDTO> result = categoryService.getBiglist();
		log.debug("result       : "+result.toString()); 
		model.addAttribute("bigCategory",result);
		
		return "social/reg";
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
		
		// ????????? ?????? ????????????.
		SocialDetailVO socialDetail = socialService.getDetail(socialNo);
		List<SocialBigCategoryDTO> bigcate = categoryService.getBiglist();
		List<MiddleCategoryVO> middle = categoryService.getMiddlelistByBigType(socialDetail.getType());
		
		model.addAttribute("AD",adDTO.getSMaxCnt());
		model.addAttribute("bigCategory",bigcate);
		model.addAttribute("socialDetail",socialDetail);
		model.addAttribute("middleList",middle);
		
		log.debug("??????"+adDTO.getSMaxCnt());
		log.debug("middle??????????????????"+middle.toString());
		log.debug("result       : "+bigcate.toString()); 
		return "social/modify";
	}
	
	@PostMapping("/modify")
	public String postModify(@ModelAttribute SocialRegVO socialRegVO,HttpSession session) throws IllegalStateException, IOException{
		log.debug("SocialRegVO  "+socialRegVO.toString());
		
		int memNo = Integer.parseInt(String.valueOf(session.getAttribute("logNo")));
		socialRegVO.setMemberNo(memNo);
		socialService.modify(socialRegVO);
		return "redirect:detail/"+socialRegVO.getSocialNo();
	}

	@GetMapping({"/list/{bigcate}","/list","/",""})
	public String getList(@PathVariable(required = false) String bigcate,
			@RequestParam(required = false,defaultValue = "") String sc,
			@RequestParam(required = false,defaultValue = "") String order,
			@RequestParam(required = false,defaultValue = "") String endyn,
			@RequestParam(required = false,defaultValue = "") String keyword,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "9") int size
			,Model model,HttpSession session) {
		if(session.getAttribute("logNo")!=null) {
			int memberNo = (int)session.getAttribute("logNo");
			
			AdDTO adDTO = memberService.membership(memberNo);
			List<SocialDTO> socialDTO = socialService.getCount(memberNo);
			boolean produce = adDTO.getSRegCnt() > socialDTO.size();
			log.debug("??????????????? ?????? "+produce);
			model.addAttribute("produce",produce);
			log.debug("??????"+adDTO.getSRegCnt());
			log.debug("????????? ?????????"+socialDTO.size());
		}
		PaginationVO paginationVO =new PaginationVO(page,size);
		
		bigcate =(bigcate==null||bigcate.equals("/"))?"":bigcate;

		//????????? ????????? ?????? ???. ??????????????? ?????? ?????? ????????? ???????????? ???.
		if(keyword.equals("") && session.getAttribute("goo")!=null) {
			String goo = (String)session.getAttribute("goo");
			log.debug("googoogoo    "+goo);
			paginationVO.setGoo(goo);	
		}else {
			paginationVO.setKeyword(keyword);
		}
		// (?????? /?????? ???)  ?????????
		paginationVO.setEndyn(endyn);
		
		//????????? ???????????? ??????
		if(sc.equals("") || sc.equals("/")) {
			paginationVO.setCategoryType("sbc.bigValue");
			paginationVO.setCategory(bigcate);
		}
		else{
			paginationVO.setCategoryType("smc.smallValue");
			paginationVO.setCategory(sc);
		}
		
		List<SocialBigCategoryDTO> bcgList = categoryService.getBiglist();
		List<MiddleCategoryVO> mcgList = categoryService.getMiddlelist(bigcate);		
		List<SocialListVO> scList = socialService.getList(paginationVO);
		
		log.debug("mcgList12345   "+mcgList);
		log.debug("bcgList12345   "+bcgList);
		log.debug("category1234   "+bigcate);
		log.debug("category    "+paginationVO.toString());
		log.debug("result       : "+scList.toString());
		model.addAttribute("keyword", keyword);
		model.addAttribute("nowcategory", bigcate);
		model.addAttribute("bcgList",bcgList);
		model.addAttribute("mcgList",mcgList);
		model.addAttribute("scList",scList);

		return "social/list";
	}
	
	@GetMapping("/listdetail")
	@ResponseBody
	public List<SocialListVO> listDetail(@RequestParam(required = false,defaultValue = "") String bigcate,
			@RequestParam(required = false,defaultValue = "") String sc,
			@RequestParam(required = false,defaultValue = "") String order,
			@RequestParam(required = false,defaultValue = "") String endyn,
			@RequestParam(required = false,defaultValue = "") String keyword,
			@RequestParam(required =false, defaultValue = "2") int page,
			@RequestParam(required =false, defaultValue = "9") int size
			,Model model,HttpSession session) {
		PaginationVO paginationVO =new PaginationVO(page,size);
		bigcate =(bigcate==null||bigcate.equals(""))?"":bigcate;
		
		//????????? ????????? ?????? ???. ??????????????? ?????? ?????? ????????? ???????????? ???.
		if((keyword == null||keyword.equals(""))&&session.getAttribute("goo")!=null) {
			String goo = (String)session.getAttribute("goo");
			paginationVO.setGoo(goo);	
		}else {
			paginationVO.setKeyword(keyword);
		}
		//????????? ??? ?????? -endyn 
		if(endyn.equals("Y")) {
			paginationVO.setEndyn("Y");
			log.debug("paginationVO.setEndyn(\"Y\")    ");
		}
		//???????????? ??? ?????? -endyn
		else if(endyn.equals("N")) {
			paginationVO.setEndyn("N");
			log.debug("paginationVO.setEndyn(\"N\")    ");
		}
		//????????? ???????????? ??????
		if(sc.equals("") || sc.equals("/")) {
			paginationVO.setCategoryType("sbc.bigValue");
			paginationVO.setCategory(bigcate);
		}
		else{
			paginationVO.setCategoryType("smc.smallValue");
			paginationVO.setCategory(sc);
		}	
		log.debug("paginationVO    "+paginationVO.toString());
		List<SocialListVO> scList = socialService.getList(paginationVO);
		
//		log.debug("mcgList12345   "+mcgList);
//		log.debug("bcgList12345   "+bcgList);
//		log.debug("category1234   "+bigcate);
//		log.debug("category    "+paginationVO.toString());
//		log.debug("result       : "+scList.toString());
//		model.addAttribute("nowcategory", bigcate);
//		model.addAttribute("bcgList",bcgList);
//		model.addAttribute("mcgList",mcgList);
//		model.addAttribute("scList",scList);

		return scList;
	}
	// ????????? ??????
	@GetMapping("/detail/{socialNo}")
	public String getDetail(@PathVariable int socialNo, Model model, HttpSession session) {
		int memberNo = (int)session.getAttribute("logNo");
		SocialDetailVO detail = socialService.getDetail(socialNo);
		String joined = participantDao.getParti(memberNo,socialNo);
		boolean ismytown = false;
		
		if((session.getAttribute("goo")!=null)){
			String goo = (String)session.getAttribute("goo");
			ismytown = socialService.getIsMytown(socialNo,goo);
		}
		log.debug("result       : "+detail.toString()); 
		model.addAttribute("detail",detail);
		model.addAttribute("joined",joined);
		model.addAttribute("ismytown", ismytown);
		
		return "social/detail";
	}
	@PostMapping("/detail/{socialNo}")
	public String postDetail(@ModelAttribute SocialRegVO socialRegVO , 
			@PathVariable int socialNo, Model model) {
//		socialService.modify(socialRegVO);

		return "social/detail";
	}
	// ????????? ??????.
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
	// ????????? ??????.
	@PostMapping("/socialexit")
	public String exitSocial(@RequestParam int socialNo,HttpSession session) {
		
		int memberNo = (int)session.getAttribute("logNo");
		ParticipateVO participateVO = new ParticipateVO();
		participateVO.setMemberNo(memberNo);
		participateVO.setSocialNo(socialNo);

		socialService.exitSocial(participateVO);
		log.debug("result       : "+participateVO.toString());
		return "redirect:list";
	}
	//????????? ??????
	@GetMapping("/delete/{socialNo}")
	public String delete(@PathVariable int socialNo) {
		socialService.delete(socialNo);
		return "redirect:../list";
	}
	//??????
	@GetMapping("/memberManage")
	public String memberManage(int socialNo,Model model,HttpSession session) {
		
		int memberNo = (int)session.getAttribute("logNo");
		List<ParticipateDetailVO> result = socialService.getPaticipantList(socialNo,memberNo);
		model.addAttribute("result",result);
		log.debug("getPaticipantList    "+result.toString());
		return "manage";
	}
	@ResponseBody
	@PostMapping("/appove")
	public void appove(int socialNo,int partiMemberNo) {
		
		participantService.approve(socialNo,partiMemberNo);
	}
	
	@ResponseBody
	@PostMapping("/denied")
	public void denied(@RequestParam int socialNo,int partiMemberNo) {
		
		ParticipateVO participateVO = new ParticipateVO();
		participateVO.setMemberNo(partiMemberNo);
		participateVO.setSocialNo(socialNo);

		socialService.exitSocial(participateVO);
		log.debug("result       : "+participateVO.toString());
	}
	
	
}