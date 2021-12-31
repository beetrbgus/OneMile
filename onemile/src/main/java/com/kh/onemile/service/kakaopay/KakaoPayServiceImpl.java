package com.kh.onemile.service.kakaopay;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.onemile.vo.kakaopay.KakaoPayReadyRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyResponseVO;

@Service
public class KakaoPayServiceImpl implements KakaoPayService{
	public static final String Authorization = "KakaoAK 3291e7928ce057eb1cd98f431209c3e0";
	public static final String ContentType =  "application/x-www-form-urlencoded;charset=utf-8";
	
	@Override
	public KakaoPayReadyResponseVO ready(KakaoPayReadyRequestVO requestVO) throws URISyntaxException {
		//1. 요청 도구 생성
		RestTemplate template = new RestTemplate();
		
		//2. 필요한 정보 추가(HTTP header, HTTP body)
		//2-1. HTTP Header 정보 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", Authorization);
		headers.add("Content-type", ContentType);

		//2-2. HTTP Body 정보 생성
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", "TC0ONETIME");
		body.add("partner_order_id", requestVO.getPartner_order_id());//랜덤시리얼 --> 결제 테이블 시퀀스
		body.add("partner_user_id", requestVO.getPartner_user_id());//랜덤시리얼 --> 사용자 ID or 판매자 ID
		body.add("item_name", requestVO.getItem_name());
		body.add("quantity", requestVO.getQuantity_string());
		body.add("total_amount", requestVO.getTotal_amount_string());
		body.add("tax_free_amount", "0");
		
		//2-3. Header와 Body를 합성
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
				
		//3. 목적지 설정
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
				
		//4. 요청방식에 따라 다른 명령으로 전송
		KakaoPayReadyResponseVO responseVO = template.postForObject(uri, entity, KakaoPayReadyResponseVO.class);
				
		return responseVO;
	}
}