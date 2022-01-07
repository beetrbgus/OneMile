package com.kh.onemile.service.kakaopay;

import java.net.URISyntaxException;

import com.kh.onemile.vo.kakaopay.KakaoPayApproveRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayAutoPayMentInactiveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayRegularApproveRequestVO;

public interface KakaoPayService {
	//정기결제(멤버십) 준비 요청
	KakaoPayReadyResponseVO regularReady(KakaoPayReadyRequestVO requestVO) throws URISyntaxException;
	
	//정기결제(멤버십) 결제 요청
	KakaoPayApproveResponseVO regularApprove(KakaoPayRegularApproveRequestVO requestVO) throws URISyntaxException;
	
	//결제 승인
	KakaoPayApproveResponseVO approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException;
	KakaoPayAutoPayMentInactiveResponseVO regularInactive(String sid) throws URISyntaxException;
}
