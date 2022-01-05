package com.kh.onemile.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.kh.onemile.entity.social.SocialCategoryDTO;
import com.kh.onemile.service.category.CategoryService;

@RequestMapping("/miles/data")
@RestController
public class MilesRestController {
	
	@Autowired
	private CategoryService categoryService;
	
	//소모임 대분류로 소분류 가져오기
	@PostMapping("/category/child")
	public List<SocialCategoryDTO> listBySuper(@RequestParam String categorySuper) {
		return categoryService.listBySuper(categorySuper);
	}
}