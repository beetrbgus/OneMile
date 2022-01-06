package com.kh.onemile;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.service.commu.CommuService;

import lombok.extern.slf4j.Slf4j;

@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@Slf4j
public class CommuListTest {

	@Autowired
	private CommuService commuService;
	
	@Test
	public void test() {
		
	}
}
