package com.kh.onemile.controller;

import java.net.URISyntaxException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.repository.product.MembershipBuyDao;
import com.kh.onemile.service.kakaopay.KakaoPayService;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayAutoPayMentInactiveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyResponseVO;

@Controller
@RequestMapping("/pay")
public class PayController {
	@Autowired
	private KakaoPayService kakaoPayService;
	@Autowired
	private MembershipBuyDao membershipBuyDao;
	
		//정기결제 준비 요청
		@PostMapping("/confirm") 
		public String confirm(@RequestParam int mspNo,					 
									 @ModelAttribute KakaoPayReadyRequestVO requestVO,
									 HttpSession session) throws URISyntaxException {
			KakaoPayReadyResponseVO responseVO= kakaoPayService.regularReady(requestVO);
			session.setAttribute("tid", responseVO.getTid());
			session.setAttribute("partner_user_id", requestVO.getPartner_user_id());
			session.setAttribute("cid", "정기결제");
			session.setAttribute("mspNo", mspNo);
			return "redirect:"+responseVO.getNext_redirect_pc_url();
		}
		
		//카카오페이의 결제가 성공할 경우 다음과 같은 형태로 요청이 발생한다(카카오페이가 발생시키는 요청)
		//= 반드시 파라미터에 pg_token이 들어오며 이를 이용해서 승인 요청을 해야 한다
		@GetMapping("/success")
		public String approve(@RequestParam String pg_token, 
										HttpSession session) throws URISyntaxException {
			
			//변수에 세션값 담고 세션삭제
			String tid = (String)session.getAttribute("tid");
			String partnerUserId = (String)session.getAttribute("partner_user_id");
			Integer mspNo = (int)session.getAttribute("mspNo");
			int memberNo = (int) session.getAttribute("logNo");
			
			session.removeAttribute("tid");
			session.removeAttribute("partner_user_id");
			session.removeAttribute("mspNo");
			
			KakaoPayApproveRequestVO requestVO = new KakaoPayApproveRequestVO();
			requestVO.setPartner_user_id(partnerUserId);
			requestVO.setTid(tid);
			requestVO.setPg_token(pg_token);
			requestVO.setCid("TCSUBSCRIP");
			
			KakaoPayApproveResponseVO responseVO = new KakaoPayApproveResponseVO();
			responseVO = kakaoPayService.approve(requestVO);
			
			//결제가 완료된 시점 responseVO를 사용하여 membershipBuyDTO 테이블에 insert를 수행
			MembershipBuyDTO membershipBuyDTO = new MembershipBuyDTO();
			membershipBuyDTO.setSid(responseVO.getSid());//정기결제 고유번호(SID)
			membershipBuyDTO.setPartnerUserId(partnerUserId);
			membershipBuyDTO.setTotalAmount(responseVO.getAmount().getTotal());
			membershipBuyDTO.setMspNo(mspNo);
			membershipBuyDTO.setMemberNo(memberNo);
			membershipBuyDao.insert(membershipBuyDTO);
			
			return "redirect:success_result";
		}
		
		//성공
		@GetMapping("/success_result")
		public String successResult() {
			return "membership/success_result";
		}
		
		//정기기부 비활성화 요청
		@GetMapping("/membership/disabled")
		public String autoInactive(@RequestParam String sid, Model model) throws URISyntaxException {
			KakaoPayAutoPayMentInactiveResponseVO responseVo = kakaoPayService.autoInactive(sid);
			membershipBuyDao.regularPayDelete(sid);
			return "redirect:/member/reg_membership";
		}
}
