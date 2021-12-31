package com.kh.onemile.Admin;

import java.text.ParseException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.service.admin.AdminService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Qualifier
@WebAppConfiguration
public class ApproveMemberTest {
	@Autowired
	private AdminService adminService;
	
	public void regApprove() throws ParseException {
		adminService.regApproveMember(2);
	}
	
	public void deniedApprove() throws ParseException {
		adminService.deniedApproveMember(2);
	}
	@Test
	public void approveMember() throws ParseException {
		adminService.approveMember(8);
	}
}
