package com.kh.onemile.entity.menu;

import java.util.List;

import lombok.Data;

@Data
public class MenuDTO {
	private String largeName;
	private String hiddenYN;
	private String mainPath;
	private List<MiddleNameDTO> middleDTO;
}