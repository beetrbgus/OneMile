package com.kh.onemile.repository.cobuy;

import java.util.List;

import com.kh.onemile.entity.cobuy.CobuyDTO;
import com.kh.onemile.entity.product.ProductBuyDTO;
import com.kh.onemile.entity.product.ProductDTO;
import com.kh.onemile.vo.PaginationVO;
import com.kh.onemile.vo.cobuy.CobuyCatVO;
import com.kh.onemile.vo.cobuy.CobuyDetailVO;
import com.kh.onemile.vo.cobuy.CobuyListVO;
import com.kh.onemile.vo.cobuy.CobuyListVO2;
import com.kh.onemile.vo.cobuy.CobuyRegVO;
import com.kh.onemile.vo.kakaopay.ConfirmVO;

public interface CobuyDao {
	public void reg(CobuyRegVO cobuyRegVO);
	public List<CobuyListVO2> cobuyList();
	public CobuyDetailVO detail(int cobuyNo);
	public void delete(int cobuyNo);
	public void modify(CobuyDetailVO cobuyModDTO);
	public CobuyDTO getConfirm(ConfirmVO confirmVO);
	public List<CobuyCatVO> getMiddleName();
	public List<CobuyListVO> cobuyList(PaginationVO paginationVO);
	public List<ProductDTO> getbuyList(int memberNo);
}
