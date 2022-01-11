package com.kh.onemile.service.kakaopay;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.onemile.vo.kakaopay.ConfirmVO;
import com.kh.onemile.vo.kakaopay.KaKaoPayRegularPayMentStateResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveRequestVO;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayAutoPayMentInactiveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayCancelResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayReadyResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayRegularApproveRequestVO;

@Service
public class KakaoPayServiceImpl implements KakaoPayService {

	@Value("${user.kakaopay.key}")
	public String Auth;
	@Value("${user.kakaopay.contenttype}")
	public String ContentType;
	@Autowired
	private BuyTableService buyTableService;

	// 결제 준비
	@Override
	public KakaoPayReadyResponseVO regularReady(ConfirmVO requestVO) throws URISyntaxException {

		// 1. 요청 도구 생성
		RestTemplate template = new RestTemplate();

		// 2. 필요한 정보 추가(HTTP header, HTTP body)
		// 2-1. HTTP Header 정보 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + Auth);
		headers.add("Content-type", ContentType);

		// 2-2. HTTP Body 정보 생성
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", requestVO.getType());
		body.add("partner_order_id", "원마일");
		body.add("partner_user_id", requestVO.getPartner_user_id());

		body.add("item_name", requestVO.getProductName());
		body.add("quantity", String.valueOf(requestVO.getQuantity()));
		body.add("total_amount", String.valueOf(requestVO.getTotalAmount()));
		body.add("tax_free_amount", "0");

		// 카카오서버에게 결제 결과에 따른 페이지를 미리 안내(단, 애플리케이션에 등록된 주소만 가능)
		// =(주의) 반드시 완성된 주소를 알려줘야 카카오에서 우리 서버로 다시 돌아올 수 있다
		body.add("approval_url", "http://localhost:8080/onemile/pay/success");
		body.add("cancel_url", "http://localhost:8080/onemile/pay/cancel");
		body.add("fail_url", "http://localhost:8080/onemile/pay/fail");

		// 2-3. Header와 Body를 합성
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

		// 3. 목적지 설정
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");

		// 4. 요청방식에 따라 다른 명령으로 전송
		KakaoPayReadyResponseVO responseVO = template.postForObject(uri, entity, KakaoPayReadyResponseVO.class);

		return responseVO;
	}

	// 결제 요청
	@Override
	public KakaoPayApproveResponseVO regularApprove(KakaoPayRegularApproveRequestVO requestVO)
			throws URISyntaxException {
		RestTemplate template = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + Auth);
		headers.add("Content-type", ContentType);

		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", "TCSUBSCRIP");
		body.add("sid", requestVO.getSid());
		body.add("partner_order_id", "원마일");
		body.add("partner_user_id", requestVO.getPartner_user_id());
		body.add("quantity", "1");
		body.add("total_amount", requestVO.getTotal_amount_string());
		body.add("tax_free_amount", "0");

		body.add("approval_url", "http://localhost:8080/onemile/pay/success");
		body.add("cancel_url", "http://localhost:8080/onemile/pay/cancel");
		body.add("fail_url", "http://localhost:8080/onemile/pay/fail");

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

		URI uri = new URI("https://kapi.kakao.com/v1/payment/subscription");

		KakaoPayApproveResponseVO responseVO = template.postForObject(uri, entity, KakaoPayApproveResponseVO.class);

		return responseVO;
	}

	// 결제 승인
	@Override
	public void approve(KakaoPayApproveRequestVO requestVO) throws URISyntaxException {
		RestTemplate template = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + Auth);
		headers.add("Content-type", ContentType);

		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", requestVO.getCid());
		body.add("tid", requestVO.getTid());// 담겨왔는데 왜
		body.add("partner_order_id", "원마일");
		body.add("partner_user_id", requestVO.getPartner_user_id());
		body.add("pg_token", requestVO.getPg_token());

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

		// 3. 목적지 설정
		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");

		// 4. 요청방식에 따라 다른 명령으로 전송
		KakaoPayApproveResponseVO responseVO = template.postForObject(uri, entity, KakaoPayApproveResponseVO.class);// 응답을
		responseVO.setMemberNo(requestVO.getMemberNo());
		responseVO.setProductNo(requestVO.getProductNo());
		// 결제 내역 테이블에 저장
		buyTableService.reg(responseVO);
	}

	// 정기결제 비활성화
	@Override
	public KakaoPayAutoPayMentInactiveResponseVO regularInactive(String sid) throws URISyntaxException {
		RestTemplate template = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + Auth);
		headers.add("Content-type", ContentType);

		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("cid", "TCSUBSCRIP");
		body.add("sid", sid);

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

		URI uri = new URI("https://kapi.kakao.com/v1/payment/manage/subscription/inactive");

		KakaoPayAutoPayMentInactiveResponseVO responseVO = template.postForObject(uri, entity,
				KakaoPayAutoPayMentInactiveResponseVO.class);

		return responseVO;
	}
	
	// 정기결제 상태 조회
		@Override
		public KaKaoPayRegularPayMentStateResponseVO regularState(String sid) throws URISyntaxException {
			RestTemplate template = new RestTemplate();
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization",  "KakaoAK "+Auth);
			headers.add("Content-type", ContentType);
			
			MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
			body.add("cid", "TCSUBSCRIP");
			body.add("sid", sid);
			
			HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
			
			
			URI uri = new URI("https://kapi.kakao.com/v1/payment/manage/subscription/status");
			
			KaKaoPayRegularPayMentStateResponseVO responseVO = template.postForObject(uri, entity, KaKaoPayRegularPayMentStateResponseVO.class);
			
			return responseVO;
		}
		
		//결제 취소
		@Override
		public KakaoPayCancelResponseVO cancel(String tid, int amount) throws URISyntaxException {
			RestTemplate template = new RestTemplate();
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization",  "KakaoAK "+Auth);
			headers.add("Content-type", ContentType);
			
			MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
			body.add("cid", "TC0ONETIME");
			body.add("tid", tid);
			body.add("cancel_amount", String.valueOf(amount));
			body.add("cancel_tax_free_amount", "0");
			
			HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
			
			
			URI uri = new URI("https://kapi.kakao.com/v1/payment/cancel");
			
			KakaoPayCancelResponseVO responseVO = template.postForObject(uri, entity, KakaoPayCancelResponseVO.class);
			
			return responseVO;
		}
}