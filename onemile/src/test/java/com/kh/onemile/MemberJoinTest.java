package com.kh.onemile;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.service.member.MemberService;
import com.kh.onemile.vo.MemberJoinVO;

import lombok.extern.slf4j.Slf4j;


@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@Slf4j
public class MemberJoinTest {
	@Autowired
	private MemberService memberService; 
	@Test
	public void join() throws ParseException {
		try {
			MemberJoinVO memberDTO = new MemberJoinVO();
			log.debug(memberDTO.toString());
			Date a = new Date();
			SimpleDateFormat a1 =  new SimpleDateFormat("YYYY-MM-DD");
			a  = a1.parse("2021-09-10");
			memberDTO.setEmail("test1111@naver.com");
			memberDTO.setPw("1234");
			memberDTO.setNick("활동상태");
			memberDTO.setPhone("010-1000-0009");
			memberDTO.setBirth(a);
			memberDTO.setMbti("INFP");
			memberDTO.setIntro(" 1");
			memberDTO.setCorona("Y");
			memberDTO.setGender("남자");
			memberService.join(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}