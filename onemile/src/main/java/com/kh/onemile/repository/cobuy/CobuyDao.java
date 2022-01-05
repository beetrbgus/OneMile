package com.kh.onemile.repository.cobuy;

import java.util.List;

import com.kh.onemile.entity.cobuy.CobuyBuyDTO;
import com.kh.onemile.entity.cobuy.CobuyModDTO;
import com.kh.onemile.entity.menu.MiddleNameDTO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;

public interface CobuyDao {
	public void reg(CobuyRegVO cobuyRegVO);
	public List<CobuyListVO> cobuyList();
	public CobuyDetailVO detail(int cobuyNo);
	public void delete(int cobuyNo);
	public List<MiddleNameDTO> getMiddleName();
	public void modify(CobuyModDTO cobuyModDTO);
}
