package com.kh.onemile.repository.product;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.product.ProductBuyDTO;

@Repository
public class ProductBuyDaoImpl implements ProductBuyDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ProductBuyDTO productBuyDTO) {
		sqlSession.insert("product.insert",productBuyDTO);
	}

	@Override
	public ProductBuyDTO get(int pbNo, int productNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("pbNo", pbNo);
		param.put("productNo", productNo);
		return sqlSession.selectOne("product.get", param);
	}

	@Override
	public void cancel(int pbNo, int productNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("pbNo", pbNo);
		param.put("productNo", productNo);
		sqlSession.update("product.cancel", param);
		
	}
}