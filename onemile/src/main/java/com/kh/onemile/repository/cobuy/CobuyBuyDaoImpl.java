package com.kh.onemile.repository.cobuy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.entity.menu.MiddleNameDTO;
import com.kh.onemile.vo.buy.CoBuyBuyVO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyVO;
import com.kh.onemile.vo.kakaopay.ConfirmVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;

@Repository
public class CobuyBuyDaoImpl implements CobuyBuyDao{
	@Autowired
	private SqlSession sqlSession;
	@Override
	
	public void reg(CoBuyBuyVO coBuyBuyVO) {
		sqlSession.insert("cobuybuy.reg",coBuyBuyVO);
	}
	@Override
	public void reduceStock(int cobuyNo, int quantity) {
		Map<String, Integer > map = new HashMap<String, Integer>();
		map.put("cobuyNo", cobuyNo);
		map.put("quantity", quantity);
		
		sqlSession.update("cobuy.reduceStock",map);	
	}
	@Override
	public void cancel(int pbNo) {
		sqlSession.update("cobuybuy.cancel",pbNo);	
	}
	@Override
	public int countConstomer(int cobuyNo) {
			
		return sqlSession.selectOne("cobuybuy.countConstomer",cobuyNo);
	}

}
