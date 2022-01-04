package com.kh.onemile.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.onemile.service.notice.NoticeService;


@Controller
@RequestMapping(value="/notice/*")

//공지 리스트

public class NoticeController {

	 @Autowired
	 private NoticeService noticeService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Locale locale, Model model) throws Exception {
		  List list = noticeService.list();
		  model.addAttribute("list", list);

	}

} 