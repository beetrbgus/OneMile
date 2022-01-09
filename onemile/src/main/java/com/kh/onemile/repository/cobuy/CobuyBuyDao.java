package com.kh.onemile.repository.cobuy;

import com.kh.onemile.vo.buy.CoBuyBuyVO;

public interface CobuyBuyDao {
	public void reg(CoBuyBuyVO coBuyBuyVO);
	public void reduceStock(int cobuyNo, int quantity);
	void cancel(int pbNo);
	public int countConstomer(int cobuyNo);
}
