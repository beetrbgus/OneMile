package com.kh.onemile.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.entity.product.ProductBuyDTO;
import com.kh.onemile.repository.membership.MembershipBuyDao;
import com.kh.onemile.service.kakaopay.KakaoPayService;
import com.kh.onemile.vo.kakaopay.ConfirmVO;
import com.kh.onemile.vo.kakaopay.KaKaoPayRegularPayMentStateResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pay")
public class PayController {
	@Autowired
	private KakaoPayService kakaoPayService;
	@Autowired
	private MembershipBuyDao membershipBuyDao;

	// 결제 준비 요청
	@RequestMapping("/confirm")
	public String confirm(HttpServletRequest request, @ModelAttribute ConfirmVO confirmVO,
		HttpSession session) throws URISyntaxException {
		
		//cid 설정. 정기 TCSUB 단건 TC0
		String cid= confirmVO.getType();
		log.debug("```````````````cid"+cid);
		
		String partnerUserId = (String) session.getAttribute("logId");
		confirmVO.setPartner_user_id(partnerUserId);
		log.debug(""+confirmVO.getTotalAmount());
		
		KakaoPayReadyResponseVO responseVO = kakaoPayService.regularReady(confirmVO);
		
		session.setAttribute("tid", responseVO.getTid());
		session.setAttribute("cid", cid);
		session.setAttribute("productNo", confirmVO.getProductNo());
		
		log.debug("찾아라~~~~~~~~~~~~~~~~"+partnerUserId);
		log.debug("cid   "+ cid);
		log.debug("tid   "+responseVO.getTid());
		log.debug("productNo   "+confirmVO.getProductNo());

		return "redirect:" + responseVO.getNext_redirect_pc_url();
	}

	// 카카오페이의 결제가 성공할 경우 다음과 같은 형태로 요청이 발생한다(카카오페이가 발생시키는 요청)
	// = 반드시 파라미터에 pg_token이 들어오며 이를 이용해서 승인 요청을 해야 한다
	@GetMapping("/success")
	public String approve(@RequestParam String pg_token, HttpSession session) throws URISyntaxException {

		// 변수에 세션값 담고 세션삭제
		String tid = (String) session.getAttribute("tid");
		String partnerUserId = (String) session.getAttribute("logId");
		int productNo = (int) session.getAttribute("productNo");
		int memberNo = (int) session.getAttribute("logNo");
		String cid = (String) session.getAttribute("cid");
		System.out.println("찾아라~~~~~~~"+partnerUserId);
		log.debug("partner_user_id   "+partnerUserId);
		log.debug("cid   "+ cid);
		log.debug("tid     "+tid);
		log.debug("productNo   "+productNo);
		log.debug("memberNo   "+memberNo);
		
		session.removeAttribute("tid");
		session.removeAttribute("productNo");
		session.removeAttribute("cid");

		KakaoPayApproveRequestVO requestVO = new KakaoPayApproveRequestVO();
		
		requestVO.setPartner_user_id(partnerUserId);
		requestVO.setTid(tid);
		requestVO.setPg_token(pg_token);
		requestVO.setCid(cid);

		KakaoPayApproveResponseVO responseVO = new KakaoPayApproveResponseVO();
		responseVO = kakaoPayService.approve(requestVO);
		
		log.debug("찾아라 리스폰~~~~~~~~~~~~~~~~"+responseVO);
		if(cid.equals("TCSUBSCRIP")) {
			//결제가 완료된 시점 responseVO를 사용하여 membershipBuyDTO 테이블에 insert를 수행
			MembershipBuyDTO membershipBuyDTO = new MembershipBuyDTO();
			membershipBuyDTO.setSid(responseVO.getSid());// 정기결제 고유번호(SID)
			membershipBuyDTO.setPartnerUserId(partnerUserId);
			membershipBuyDTO.setTotalAmount(responseVO.getAmount().getTotal());
			membershipBuyDTO.setMspNo(productNo);
			membershipBuyDTO.setMemberNo(memberNo);
			membershipBuyDao.insert(membershipBuyDTO);
			//대표 결제정보가 등록된 다음 상세 결제정보를 등록
		}else {
			//단건결제라면 상품구매 테이블에 insert를 수행
//			ProductBuyDTO productBuyDTO = new ProductBuyDTO();
//			productBuyDTO.setMemberNo(memberNo);
//			productBuyDTO.setProductNo(productNo);
//			productBuyDTO.setTid(tid);
//			productBuyDTO.setItemName(responseVO.getItem_name());
//			productBuyDTO.setTotalAmount(responseVO.getAmount().getTotal());
			
		}

		return "redirect:success_result";
	}

	// 성공
	@GetMapping("/success_result")
	public String successResult() {
		return "membership/success_result";
	}

	//정기결제 비활성화 요청
	@GetMapping("/regular/disabled")
	public String regularInactive(@RequestParam String sid) throws URISyntaxException {
		kakaoPayService.regularInactive(sid);
		membershipBuyDao.regularPayDelete(sid);
		return "redirect:/membership/reg_membership";
	}
	
	//정기결제 조회 요청
	@GetMapping("/state")
	public String regularSearch(@RequestParam String sid, Model model) throws URISyntaxException {
		KaKaoPayRegularPayMentStateResponseVO responseVO = kakaoPayService.regularState(sid);
		model.addAttribute("state", responseVO);
		return "pay/state";
	}
}