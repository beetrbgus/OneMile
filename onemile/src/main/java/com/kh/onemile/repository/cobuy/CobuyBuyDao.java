package com.kh.onemile.repository.cobuy;

import java.util.List;

import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.entity.menu.MiddleNameDTO;
import com.kh.onemile.vo.buy.CoBuyBuyVO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyVO;
import com.kh.onemile.vo.kakaopay.ConfirmVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;

public interface CobuyBuyDao {
	public void reg(CoBuyBuyVO coBuyBuyVO);
	public List<CobuyListVO> cobuyList(int startRow, int endRow);
	public CobuyDetailVO detail(int cobuyNo);
	public void delete(int cobuyNo);
	public List<MiddleNameDTO> getMiddleName();
	public void modify(CobuyVO cobuyModDTO);
	public CobuyDTO getConfirm(ConfirmVO confirmVO);
}