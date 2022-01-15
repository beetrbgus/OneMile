package com.kh.onemile;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.service.social.SocialService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@WebAppConfiguration
public class CommuTest1 {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SocialService socialService;

//	@Test
	public void test() {
		System.out.println(sqlSession);
	}
	
	@Test
	public void testq() {
		System.out.println(socialService.indexList());
	}
}
