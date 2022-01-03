package com.kh.onemile.repository.cobuy;

import java.util.List;

import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;

public interface CobuyDao {
	public void reg(CobuyDetailVO cobuyVO);
	public List<CobuyListVO> cobuyList();
	public CobuyListVO detail(int cobuyNo);
	public void delete(int cobuyNo);
}
