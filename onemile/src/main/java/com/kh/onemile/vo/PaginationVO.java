package com.kh.onemile.vo;

import lombok.Data;

@Data
public class PaginationVO {
	private String keyword;
	private String category;
	private int startRow;
	private int endRow;
	
	public PaginationVO(int page ,int size){
		this.endRow = page* size;
		this.startRow = endRow - (size - 1);
	}
}
