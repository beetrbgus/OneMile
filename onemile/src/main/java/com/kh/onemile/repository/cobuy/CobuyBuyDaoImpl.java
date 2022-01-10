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
//	@Override //List<CobuyDTO>
//	public List<CobuyListVO> cobuyList() {
//		return sqlSession.selectList("cobuy.getList");
//	}
	@Override 
	public CobuyDetailVO detail(int cobuyNo) {
		return sqlSession.selectOne("cobuy.getDetail",cobuyNo);
	}
	@Override
	public void delete(int cobuyNo) {
		Map<String,Object> map =new HashMap<>();
		map.put("cobuyNo", cobuyNo);
		map.put("hiddenYN", "Y");
		sqlSession.update("cobuy.hide",map);
	}
	@Override
	public List<MiddleNameDTO> getMiddleName() {
		return sqlSession.selectList("cobuy.getMiddleName");
	}
	@Override
	public void modify(CobuyVO cobuyModDTO) {
		sqlSession.update("cobuy.modify", cobuyModDTO);
	}
	@Override
	public CobuyDTO getConfirm(ConfirmVO confirmVO) {
		return sqlSession.selectOne("cobuy.getforBuy", confirmVO);
	}
	@Override
	public List<CobuyListVO> cobuyList(int startRow, int endRow) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSession.selectList("cobuy.getList", map);
	}

}
