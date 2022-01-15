package com.kh.onemile.repository.product;

import com.kh.onemile.entity.product.ProductBuyDTO;

public interface ProductBuyDao {

	void insert(ProductBuyDTO productBuyDTO);

	ProductBuyDTO get(int pbNo, int productNo);

	void cancel(int pbNo, int productNo);

}
