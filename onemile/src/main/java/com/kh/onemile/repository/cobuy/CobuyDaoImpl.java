package com.kh.onemile.repository.cobuy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.vo.cobuy.CobuyCatVO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;
import com.kh.onemile.vo.kakaopay.ConfirmVO;

@Repository
public class CobuyDaoImpl implements CobuyDao{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void reg(CobuyRegVO cobuyRegVO) {
		sqlSession.insert("cobuy.reg",cobuyRegVO);
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
	public List<CobuyCatVO> getMiddleName() {
		return sqlSession.selectList("cobuy.getMiddleName");
	}
	@Override
	public void modify(CobuyDetailVO cobuyModDTO) {
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
