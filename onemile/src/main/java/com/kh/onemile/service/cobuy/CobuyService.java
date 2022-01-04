package com.kh.onemile.service.cobuy;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.entity.menu.MiddleNameDTO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;

public interface CobuyService {
	public int reg(CobuyDetailVO cobuyDTO) throws IllegalStateException, IOException;
	public List<CobuyListVO> getList();
	public CobuyListVO getDetail(int cobuyNo);
	public void modify(CobuyDetailVO cobuyDetailVO);
	public void delete(int cobuyNo);
	public List<MiddleNameDTO> getMiddleName();
}
