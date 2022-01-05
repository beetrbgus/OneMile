package com.kh.onemile.cobuy;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.entity.cobuy.CobuyBuyDTO;
import com.kh.onemile.service.cobuy.CobuyService;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;

import lombok.extern.slf4j.Slf4j;

@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@Slf4j
public class CoyBuyTest {
	@Autowired
	private CobuyService cobuyService;
	
//	@Test
	public void regCoyBuy() throws IllegalStateException, IOException, ParseException {
		CobuyDetailVO cobuyVO = new CobuyDetailVO();
		Date a = new Date();
		SimpleDateFormat a1 =  new SimpleDateFormat("YYYY-MM-DD");
		a  = a1.parse("2021-12-30");
		cobuyVO.setMemberNo(28);
		cobuyVO.setTitle("테스트글111");
		cobuyVO.setPrice(15000);
		cobuyVO.setDescript("이 테스트글은 자바로 작성되었습니다.");
		cobuyVO.setPName("아무도 먹지 않는 민트초코");
		cobuyService.reg(cobuyVO);
	}
//	@Test
	public void modifyCoyBuy() throws IllegalStateException, IOException, ParseException {
		CobuyDetailVO cobuyVO = new CobuyDetailVO();
		Date a = new Date();
		SimpleDateFormat a1 =  new SimpleDateFormat("YYYY-MM-DD");
		a  = a1.parse("2021-12-30");
		cobuyVO.setMemberNo(28);
		cobuyVO.setTitle("테스트글222");
		cobuyVO.setPrice(16000);
		cobuyVO.setDescript("이 테스트글은 자바로 작성되었습니다.333");
		cobuyVO.setPName("아무도 먹지 않는 민트초코333");
		cobuyService.reg(cobuyVO);
	}
	@Test
	public void getListCoyBuy(){
		List<CobuyListVO> result=cobuyService.getList();
		for(CobuyListVO cobuyDTO:result) {
			log.debug(cobuyDTO.toString());
		}
	}
	@Test
	public void getCoyBuy(){
		CobuyDetailVO result=cobuyService.getDetail(60);
		log.debug(result.toString());
	}
//	@Test
	public void deleteCoyBuy(){
		cobuyService.delete(1);
	}
}
