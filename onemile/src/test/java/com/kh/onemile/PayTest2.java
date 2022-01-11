package com.kh.onemile;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.UUID;

import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.onemile.vo.kakaopay.KakaoPayReadyResponseVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class PayTest2 {
	@Test
	public void test() throws URISyntaxException {

		RestTemplate template = new RestTemplate();
		
	
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 3291e7928ce057eb1cd98f431209c3e0");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", "TC0ONETIME");
		body.add("partner_order_id", "원마일");
		body.add("partner_user_id", "paytest01@naver.com");
		body.add("item_name", "오이");
		body.add("quantity", "1");
		body.add("total_amount", "50000");
		body.add("tax_free_amount", "0");
		
		body.add("approval_url", "http://localhost:8080/onemile/pay/success");
		body.add("cancel_url", "http://localhost:8080/onemile/pay/cancel");
		body.add("fail_url", "http://localhost:8080/onemile/pay/fail");
		
	
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
		

		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
		
		KakaoPayReadyResponseVO vo = template.postForObject(uri, entity, KakaoPayReadyResponseVO.class);
		
		
	}
}
