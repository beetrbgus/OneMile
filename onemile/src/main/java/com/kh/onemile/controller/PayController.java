package com.kh.onemile.controller;

import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onemile.entity.product.ProductBuyDTO;
import com.kh.onemile.repository.membership.MembershipBuyDao;
import com.kh.onemile.repository.product.ProductBuyDao;
import com.kh.onemile.service.kakaopay.KakaoPayService;
import com.kh.onemile.vo.kakaopay.ConfirmVO;
import com.kh.onemile.vo.kakaopay.KaKaoPayRegularPayMentStateResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayCancelResponseVO;
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
	@Autowired
	private ProductBuyDao productBuyDao;

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
	
	  //항목 취소 : 해당하는 항목이 취소가 가능한지 확인하고 취소가 가능한 경우 취소 처리 및 거래를 부분취소/전체취소로 변경
	  @GetMapping("/cancel_part") 
	  public String  cancelPart(@RequestParam int pbNo, @RequestParam int productNo) throws URISyntaxException {
		  	//(1) 요청한 항목이 취소가 가능한 상태인지 확인
			ProductBuyDTO productBuyDTO = productBuyDao.get(pbNo, productNo);
			if(productBuyDTO.isCancelAvailable()) {//취소가 가능한 상황이 아니라면
				throw new IllegalArgumentException("취소가 불가능한 항목입니다");
			}
			//(2) 취소 요청을 위한 정보를 수집(tid, amount)
			//BuyDto buyDto = buyDao.get(buyNo);//tid를 알 수 있다
			
			//(3) 취소 요청
			KakaoPayCancelResponseVO responseVO = kakaoPayService.cancel(productBuyDTO.getTid(), productBuyDTO.getTotalAmount());
			
			//(4) 기록(DB)
			//4-1. 구매상세(buy_detail) 테이블 항목의 상태를 취소로 변경
			productBuyDao.cancel(pbNo, productNo);
			
			//4-2. 구매(buy) 테이블 항목의 상태를 갱신
			//buyDao.refresh(buyNo);
			
			//(5) 다시 구매내역 상세 페이지로 이동
			return "redirect:/";
	  }
}