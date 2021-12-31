package com.kh.onemile;

import java.net.URISyntaxException;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.service.kakaopay.KakaoPayService;
import com.kh.onemile.vo.kakaopay.KakaoPayApproveResponseVO;
import com.kh.onemile.vo.kakaopay.KakaoPayRegularApproveRequestVO;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
@Slf4j
public class KakaopayTest {
	@Autowired
	private KakaoPayService kakaoService;
	
	public void test() throws URISyntaxException {
	KakaoPayRegularApproveRequestVO requestVO = new KakaoPayRegularApproveRequestVO();
	
	requestVO.setPartner_order_id("원마일");
	requestVO.setPartner_user_id("테스트좀할게요");
	requestVO.setQuantity(1);
	requestVO.setSid("S2979344106992751328");
	requestVO.setTotal_amount(50000);
	
	KakaoPayApproveResponseVO responseVO = kakaoService.regularApprove(requestVO);
	
	System.out.println(responseVO.toString());
	}
}
