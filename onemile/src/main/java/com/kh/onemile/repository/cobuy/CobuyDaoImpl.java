package com.kh.onemile.repository.cobuy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.cobuy.CobuyModDTO;
import com.kh.onemile.entity.menu.MiddleNameDTO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;

@Repository
public class CobuyDaoImpl implements CobuyDao{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void reg(CobuyRegVO cobuyRegVO) {
		sqlSession.insert("cobuy.reg",cobuyRegVO);
	}
	@Override //List<CobuyDTO>
	public List<CobuyListVO> cobuyList() {
		return sqlSession.selectList("cobuy.getList");
	}
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
	public void modify(CobuyModDTO cobuyModDTO) {
		sqlSession.update("cobuy.modify", cobuyModDTO);
	}

}
