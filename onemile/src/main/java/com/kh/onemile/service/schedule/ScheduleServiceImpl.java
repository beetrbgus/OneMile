package com.kh.onemile.service.schedule;

import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.repository.certi.CertiDao;
import com.kh.onemile.repository.product.MembershipBuyDao;
import com.kh.onemile.service.kakaopay.KakaoPayService;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayRegularApproveRequestVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private CertiDao certiDao;
	@Autowired
	private MembershipBuyDao membershipBuyDao;
	@Autowired
	private KakaoPayService kakaoPaySerivce;
	
	
	//이메일 인증번호(누적된 DB) 삭제 스케줄러
	@Scheduled(cron = "0 0 9 * * *")//매일 오전 9시
	@Override
	public void execute() {
		log.debug("DB 스케줄러 테스트중");
		certiDao.clean();
	}
	//정기결제 결제일검사 스케줄러
	@Scheduled(cron = "0 0 0 * * *")//매일 오전12시
	@Override
	public void regularPayment() throws URISyntaxException {
		
		MembershipBuyDTO membershipBuyDTO	= membershipBuyDao.dayCheck();//날짜비교해서
		if(membershipBuyDTO != null) {//데이터가 있으면
			List<MembershipBuyDTO> list = membershipBuyDao.list(); //정기결제해야할 전체목록
			KakaoPayRegularApproveRequestVO requestVO = new KakaoPayRegularApproveRequestVO();
			System.out.println(list.toString());
			for(MembershipBuyDTO dto : list) {
				requestVO.setPartner_user_id(dto.getPartnerUserId());
				requestVO.setSid(dto.getSid());
				requestVO.setTotal_amount(dto.getTotalAmount());
				
				KakaoPayApproveResponseVO responseVO = kakaoPaySerivce.regularApprove(requestVO);
				membershipBuyDao.insert(membershipBuyDTO);
				System.out.println("정기결제 성공!");
		}
	}
	}
}