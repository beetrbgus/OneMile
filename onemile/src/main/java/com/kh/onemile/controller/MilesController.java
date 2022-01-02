package com.kh.onemile.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.onemile.service.CategoryService;
import com.kh.onemile.service.miles.MilesService;
import com.kh.onemile.vo.MilesVO;

@RequestMapping("/miles")
@Controller
public class MilesController {
	
	@Autowired
	private MilesService milesService;
	@Autowired
	private CategoryService categoryService;
	//마일즈 생성
	@GetMapping("/create")
	public String create(Model model) {
		model.addAttribute("category",categoryService.category());
		return "miles/create";
	}
	@PostMapping("/create")
	public String create(@ModelAttribute MilesVO milesVo,HttpSession session) throws IllegalStateException, IOException {
		int writer =(int) session.getAttribute("logNo");
		milesVo.setMemberNo(writer);
		milesService.create(milesVo);
		return "redirect:/";
	}
}