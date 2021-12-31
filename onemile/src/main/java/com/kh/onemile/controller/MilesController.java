package com.kh.onemile.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.onemile.service.miles.MilesService;
import com.kh.onemile.vo.ImageVO;
import com.kh.onemile.vo.MilesVO;

@RequestMapping("/miles")
@RestController
public class MilesController {

    @Autowired
    private MilesService milesService;

    //마일즈 생성
    @GetMapping("/create")
    public String create() {
        return "miles/create";
    }
    @PostMapping("/create")
    public String create(@ModelAttribute MilesVO milesVo,HttpSession session) throws IllegalStateException, IOException {
        int writer =(int) session.getAttribute("logNo");
        
        milesService.create(milesVo);

        return "redirect:/";
    }
}