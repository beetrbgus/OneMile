package com.kh.onemile.repository.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.onemile.entity.product.ProductBuyDTO;

@Repository
public class ProductBuyDaoImpl implements ProductBuyDao{
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void insert(ProductBuyDTO productBuyDTO) {
		sqlsession.insert("product.insert",productBuyDTO);
	}

}
