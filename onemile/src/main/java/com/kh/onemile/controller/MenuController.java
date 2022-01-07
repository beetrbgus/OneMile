package com.kh.onemile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.onemile.entity.menu.MenuDTO;
import com.kh.onemile.repository.menu.MenuDao;

@RequestMapping("/menu")
@RestController
public class MenuController {
	
	@Autowired
	private MenuDao menuDao;
	
	@PostMapping("/")
	public List<MenuDTO> getMenu(Model model) {
		List<MenuDTO> list= menuDao.getmenuList();
		model.addAttribute("list", list);
		System.out.println(list);
		return list;
	}
}
