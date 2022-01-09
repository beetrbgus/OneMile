package com.kh.onemile.repository.cobuy;

import java.util.List;

import com.kh.onemile.entity.menu.MiddleNameDTO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyVO;
import com.kh.onemile.vo.kakaopay.ConfirmVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;

public interface CobuyDao {
	public void reg(CobuyRegVO cobuyRegVO);
	public List<CobuyListVO> cobuyList(int startRow, int endRow);
	public CobuyDetailVO detail(int cobuyNo);
	public void delete(int cobuyNo);
	public List<MiddleNameDTO> getMiddleName();
	public void modify(CobuyDetailVO cobuyModDTO);
	public CobuyVO getConfirm(ConfirmVO confirmVO);
}
