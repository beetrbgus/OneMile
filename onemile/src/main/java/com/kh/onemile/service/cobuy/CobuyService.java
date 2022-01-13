package com.kh.onemile.service.cobuy;

import java.io.IOException;
import java.util.List;

import com.kh.onemile.entity.product.ProductBuyDTO;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.cobuy.CobuyCatVO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyRegVO;
import com.kh.onemile.vo.kakaopay.ConfirmVO;

public interface CobuyService {
	public int reg(CobuyRegVO cobuyRegDTO) throws IllegalStateException, IOException;
//	public List<CobuyListVO> getList();
	public CobuyDetailVO getDetail(int cobuyNo);
	public void modify(CobuyDetailVO cobuyModDTO) throws IllegalStateException, IOException;
	public void delete(int cobuyNo);
	
	public List<CobuyCatVO> getMiddleName();
	public ConfirmVO getConfirm(ConfirmVO confirmVO);
	public List<CobuyListVO> getList(int startRow, int endRow);
	public List<CobuyListVO> getList(PaginationVO paginationVO);
	public List<ProductBuyDTO> getbuyList(int memberNo);
}
