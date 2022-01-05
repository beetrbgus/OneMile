package com.kh.onemile.menu;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.entity.menu.MenuDTO;
import com.kh.onemile.repository.menu.MenuDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Qualifier
@WebAppConfiguration
public class MenuTest {
	@Autowired
	private MenuDao menuDao;
	@Test
	public void getMenu() {
		List<MenuDTO> result=menuDao.getmenuList();
		for(MenuDTO item:result) {
			System.out.println(" ==========================");
			System.out.println(item.toString());
		}
	}
}
