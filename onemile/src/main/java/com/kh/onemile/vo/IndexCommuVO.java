package com.kh.onemile.vo;

import java.util.List;

import lombok.Data;
@Data
public class IndexCommuVO {
	private String middleName; //cmc 
	private String urlPath; // cmc의 urlpath
	private List<CommuDetailVO> list;
}
