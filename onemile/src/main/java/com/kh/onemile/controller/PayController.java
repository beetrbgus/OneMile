package com.kh.onemile.controller;

import java.net.URISyntaxException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.kh.onemile.repository.membership.MembershipBuyDao;
import com.kh.onemile.service.kakaopay.KakaoPayService;
import com.kh.onemile.vo.kakaopay.ConfirmVO;
import com.kh.onemile.vo.kakaopay.KaKaoPayRegularPayMentStateResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyRequestVO;
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
	public String confirm(Model model, HttpServletRequest request, HttpSession session) throws URISyntaxException {
		log.debug("model = {}", model);
		log.debug("model map = {}", model.asMap());
		
		ConfirmVO confirmVO = (ConfirmVO)model.asMap().get("confirmVO");
		log.debug("confirmVO = {}", confirmVO);
		
//		Map<String, ?> confirm = RequestContextUtils.getInputFlashMap(request);
//		log.debug("```````confirm"+confirm);
//		ConfirmVO confirmVO = null; 
//		if(confirm != null) {
//			 confirmVO = (ConfirmVO) confirm.get("confirmVO");			
//		}
		// cid 설정. 정기 TCSUB 단건 TC0
		String cid = (confirmVO.getType().equals("TCSUBSCRIP")) ? "TCSUBSCRIP" : "TC0ONETIME";

		KakaoPayReadyResponseVO responseVO = kakaoPayService.regularReady(confirmVO);
		log.debug("컨펌VO confirmVO"+confirmVO.toString());
		session.setAttribute("tid", responseVO.getTid());
		session.setAttribute("cid", cid);
		session.setAttribute("productNo", confirmVO.getProductNo());
		
		
		log.debug("cid   " + cid);
		log.debug("tid   " + responseVO.getTid());
		log.debug("productNo   " + confirmVO.getProductNo());

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

		log.debug("partner_user_id   " + partnerUserId);
		log.debug("cid   " + cid);
		log.debug("tid     " + tid);
		log.debug("`````````````````````productNo   " + productNo);
		log.debug("memberNo   " + memberNo);

		session.removeAttribute("tid");
		session.removeAttribute("productNo");
		session.removeAttribute("cid");

		KakaoPayApproveRequestVO requestVO = new KakaoPayApproveRequestVO();
		requestVO.setPartner_user_id(partnerUserId);
		requestVO.setTid(tid);
		requestVO.setPg_token(pg_token);
		requestVO.setCid(cid);
		requestVO.setMemberNo(memberNo);
		requestVO.setProductNo(productNo);

		log.debug("tid   :"+tid);
		log.debug("requestVO.getTid()   :"+requestVO.getTid());
		
		kakaoPayService.approve(requestVO);

		return "redirect:success_result";
	}

	// 성공
	@GetMapping("/success_result")
	public String successResult() {
		return "membership/success_result";
	}

	// 정기결제 비활성화 요청
	@GetMapping("/regular/disabled")
	public String autoInactive(@RequestParam String sid) throws URISyntaxException {
		kakaoPayService.regularInactive(sid);
		membershipBuyDao.regularPayDelete(sid);
		return "redirect:/member/reg_membership";
	}

	// 정기결제 조회 요청
	@GetMapping("/state")
	public String regularSearch(@RequestParam String sid, Model model) throws URISyntaxException {
		KaKaoPayRegularPayMentStateResponseVO responseVO = kakaoPayService.regularState(sid);
		model.addAttribute("state", responseVO);
		return "pay/state";
	}

}