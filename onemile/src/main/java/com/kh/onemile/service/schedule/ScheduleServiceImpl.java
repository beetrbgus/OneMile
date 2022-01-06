package com.kh.onemile.service.schedule;

import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.onemile.entity.product.MembershipBuyDTO;
import com.kh.onemile.repository.certi.CertiDao;
import com.kh.onemile.repository.membership.MembershipBuyDao;
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
	@Scheduled(cron = "0 0 0 * * *")//매일 오전12시
	@Override
	public void execute() {
		log.debug("DB 스케줄러 테스트중");
		certiDao.clean();
	}
	//정기결제 스케줄러
	@Scheduled(cron = "0 0 0 * * *")//매일 오전12시
	@Override
	public void regularPayment() throws URISyntaxException {
		
		List<MembershipBuyDTO> membershipBuyDTO	= membershipBuyDao.dayCheck();//날짜비교해서
		for(MembershipBuyDTO msbDTO : membershipBuyDTO) {//데이터가 있으면
			
			KakaoPayRegularApproveRequestVO requestVO = new KakaoPayRegularApproveRequestVO();
			requestVO.setPartner_user_id(msbDTO.getPartnerUserId());
			requestVO.setSid(msbDTO.getSid());
			requestVO.setTotal_amount(msbDTO.getTotalAmount());
			
			KakaoPayApproveResponseVO responseVO = kakaoPaySerivce.regularApprove(requestVO);
			System.out.println("정기 결제 성공");
			
			membershipBuyDao.insert(msbDTO);
		}
	}
}