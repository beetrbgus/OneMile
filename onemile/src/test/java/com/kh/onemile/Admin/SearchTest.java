package com.kh.onemile.Admin;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.service.admin.AdminService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Qualifier
@WebAppConfiguration
@Slf4j
public class SearchTest {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	AdminService adminService;
	
	@Test
	public void test() {
		log.debug("리스트...{}",adminService.notMember(null,null,1, 5));
	}
}
