package com.kh.onemile.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.entity.product.ProductBuyDTO;
import com.kh.onemile.repository.membership.MembershipBuyDao;
import com.kh.onemile.repository.product.ProductBuyDao;
import com.kh.onemile.service.kakaopay.KakaoPayService;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyResponseVO;

@Controller
@RequestMapping("/pay")
public class PayController {
	@Autowired
	private KakaoPayService kakaoPayService;
	@Autowired
	private MembershipBuyDao membershipBuyDao;
	@Autowired
	private ProductBuyDao productBuyDao;

	// 단건결제 요청
	@PostMapping("/singleConfirm")
	public String groupConfirm(@RequestParam int productNo, @ModelAttribute KakaoPayReadyRequestVO requestVO,
			HttpSession session) throws URISyntaxException {
		KakaoPayReadyResponseVO responseVO = kakaoPayService.ready(requestVO);

		session.setAttribute("tid", responseVO.getTid());
		session.setAttribute("partner_user_id", requestVO.getPartner_user_id());
		session.setAttribute("productNo", productNo);
		session.setAttribute("cid", "단건결제");
		return "redirect:" + responseVO.getNext_redirect_pc_url();
	}

	// 정기결제 준비 요청
	@PostMapping("/confirm")
	public String confirm(@RequestParam int mspNo, @ModelAttribute KakaoPayReadyRequestVO requestVO,
			HttpSession session) throws URISyntaxException {
		KakaoPayReadyResponseVO responseVO = kakaoPayService.regularReady(requestVO);
		session.setAttribute("tid", responseVO.getTid());
		session.setAttribute("partner_user_id", requestVO.getPartner_user_id());
		session.setAttribute("cid", "정기결제");
		session.setAttribute("mspNo", mspNo);
		return "redirect:" + responseVO.getNext_redirect_pc_url();
	}

	// 카카오페이의 결제가 성공할 경우 다음과 같은 형태로 요청이 발생한다(카카오페이가 발생시키는 요청)
	// = 반드시 파라미터에 pg_token이 들어오며 이를 이용해서 승인 요청을 해야 한다
	@GetMapping("/success")
	public String approve(@RequestParam String pg_token, HttpSession session) throws URISyntaxException {

		// 변수에 세션값 담고 세션삭제
		String tid = (String) session.getAttribute("tid");
		String partnerUserId = (String) session.getAttribute("partner_user_id");
		Integer mspNo = (int) session.getAttribute("mspNo");
		int memberNo = (int) session.getAttribute("logNo");
		int ProductNo = (int) session.getAttribute("productNo");

		session.removeAttribute("tid");
		session.removeAttribute("partner_user_id");
		session.removeAttribute("mspNo");
		session.removeAttribute("productNo");

		KakaoPayApproveRequestVO requestVO = new KakaoPayApproveRequestVO();
		requestVO.setPartner_user_id(partnerUserId);
		requestVO.setTid(tid);
		requestVO.setPg_token(pg_token);

		KakaoPayApproveResponseVO responseVO = new KakaoPayApproveResponseVO();

		// 결제구분용 코드
		String cidType = (String) session.getAttribute("cid");
		session.removeAttribute("cid");
		if (cidType.equals("정기결제")) {
			requestVO.setCid("TCSUBSCRIP");
			responseVO = kakaoPayService.approve(requestVO);

			// 결제가 완료된 시점 responseVO를 사용하여 membershipBuyDTO 테이블에 insert를 수행
			MembershipBuyDTO membershipBuyDTO = new MembershipBuyDTO();
			membershipBuyDTO.setSid(responseVO.getSid());// 정기결제 고유번호(SID)
			membershipBuyDTO.setPartnerUserId(partnerUserId);
			membershipBuyDTO.setTotalAmount(responseVO.getAmount().getTotal());
			membershipBuyDTO.setMspNo(mspNo);
			membershipBuyDTO.setMemberNo(memberNo);
			membershipBuyDao.insert(membershipBuyDTO);

		} else if (cidType.equals("단건결제")) {
			requestVO.setCid("TC0ONETIME");
			responseVO = kakaoPayService.approve(requestVO);
			
			ProductBuyDTO productBuyDTO = new ProductBuyDTO();
			productBuyDTO.setPbNo(1);
			productBuyDTO.setMemberNo(memberNo);
			productBuyDTO.setProductNo(ProductNo);
			
			productBuyDTO.setTid(tid);
			productBuyDTO.setItemName(responseVO.getItem_name());
			productBuyDTO.setTotalAmount(responseVO.getAmount().getTotal());
			

			productBuyDao.insert(productBuyDTO);
		}

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
}