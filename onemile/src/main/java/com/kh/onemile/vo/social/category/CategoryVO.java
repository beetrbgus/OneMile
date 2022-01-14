package com.kh.onemile.vo.social.category;

import java.util.List;

import lombok.Data;

@Data
public class CategoryVO {
	private String largeName;
	private List<MiddleCategoryVO> middle;
	private String bigValue;
}
