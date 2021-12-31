package com.kh.onemile;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.onemile.util.Sequence;

import lombok.extern.slf4j.Slf4j;

@ContextConfiguration(locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@Slf4j
public class SequenceTest {
	@Autowired
	private SqlSession sqlSession; 
	@Autowired
	private Sequence seq;
	@Test
	public void joinSequence() {
//		int result = sqlSession.selectOne("seq.get","mi_no");
//		System.out.println(result);
//		Map<String, Object> updateValue = new LinkedHashMap<String, Object>();
//		updateValue.put("seq_name", "mi_no");
//		updateValue.put("seq_no", 2);
//		sqlSession.update("seq.increase",updateValue);
//		int getNext = seq.nextSequence("mi_seq");
//		System.out.println(getNext);
//		//현재시퀀스
//		int getcurr = seq.getSequence("mi_seq");
//		System.out.println("현재 시퀀스    "+getcurr);
//		
		int result = seq.nextSequence("mi_no");
		System.out.println(result);
		//현재시퀀스
		int result2 = seq.getSequence("mi_no");
		System.out.println("현재 시퀀스    "+result2);
	}
	
}
