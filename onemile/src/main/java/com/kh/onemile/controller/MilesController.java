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
import com.kh.onemile.service.category.CategoryService;
import com.kh.onemile.service.member.MemberService;
import com.kh.onemile.service.miles.MilesService;
import com.kh.onemile.vo.MilesVO;

@RequestMapping("/miles")
@Controller
public class MilesController {

    @Autowired
    private MilesService milesService;
    @Autowired
    private MemberService memberService;
    @Autowired
	private CategoryService categoryService;
   
    //마일즈 생성
    @GetMapping("/create")
    public String create(HttpSession session, Model model) {
    	int memberNo = (int)session.getAttribute("logNo");
    	model.addAttribute("category",categoryService.list());
    	model.addAttribute("adDto",memberService.membership(memberNo));
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