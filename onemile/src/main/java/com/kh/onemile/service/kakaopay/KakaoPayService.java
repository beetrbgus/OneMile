package com.kh.onemile.service.kakaopay;

import java.net.URISyntaxException;

import com.kh.onemile.vo.kakaopay.KakaoPayReadyRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyResponseVO;

public interface KakaoPayService {
	//결제 준비
	KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException;
}
