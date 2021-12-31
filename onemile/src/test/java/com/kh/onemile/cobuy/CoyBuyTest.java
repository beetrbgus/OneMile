package com.kh.onemile.cobuy;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.service.cobuy.CobuyService;

import lombok.extern.slf4j.Slf4j;

@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class CoyBuyTest {
	@Autowired
	private CobuyService cobuyService;
	
	@Test
	public void regCoyBuy() throws IllegalStateException, IOException, ParseException {
		CobuyDTO cobuyDTO = new CobuyDTO();
		Date a = new Date();
		SimpleDateFormat a1 =  new SimpleDateFormat("YYYY-MM-DD");
		a  = a1.parse("2021-12-30");
		cobuyDTO.setMemberNo(28);
		cobuyDTO.setTitle("테스트글111");
		cobuyDTO.setPrice(15000);
		cobuyDTO.setDescript("이 테스트글은 자바로 작성되었습니다.");
		cobuyDTO.setPName("아무도 먹지 않는 민트초코");
		cobuyService.reg(cobuyDTO);
	}
}
