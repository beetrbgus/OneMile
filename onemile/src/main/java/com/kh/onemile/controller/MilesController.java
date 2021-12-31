package com.kh.onemile.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.service.miles.MilesService;
import com.kh.onemile.vo.ImageVO;
import com.kh.onemile.vo.MilesVO;

@RequestMapping("/miles")
@Controller
public class MilesController {
	
	@Autowired
	private MilesService milesService;
	@Autowired
	private ImageService imageService;
	
	//마일즈 생성
	@GetMapping("/create")
	public String create() {
		return "miles/create";
	}
	@PostMapping("/create")
	public String create(@ModelAttribute MilesVO milesVo,
								@ModelAttribute ImageVO imageVo,
		HttpSession session) throws IllegalStateException, IOException {
		int writer =(int) session.getAttribute("logNo");
		
		milesVo.setMemberNo(writer);
		milesService.create(milesVo);
		if(imageVo!=null) {
//			imageService.regImage(imageVo);
		}
		return "redirect:/";
	}
}