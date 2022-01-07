package com.kh.onemile.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onemile.service.notice.NoticeService;
import com.kh.onemile.entity.notice.NoticeDTO;



@Controller
@RequestMapping(value="/notice/*")

//공지 리스트

public class NoticeController {

	 @Autowired
	 private NoticeService noticeService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model) throws Exception {
		  List list = noticeService.list();
		  model.addAttribute("list", list);
		  
		  return "/notice/list";

	}
	
	
	//공지 등록
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public String regiView(Locale locale, Model model, HttpServletRequest request) throws Exception {
		return "/notice/write";
	}
	
	
	

	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public  String write(Locale locale, Model model, NoticeDTO noticedto) throws Exception {
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss"); 
		
		

		noticedto.setPostDate(format.format(date));
		
		if(noticeService.write(noticedto) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String view(Locale locale, Model model, HttpServletRequest request) throws Exception {
		BoardDTO dto = service.view(Integer.parseInt((String)request.getParameter("seq")));
		model.addAttribute("view", dto);
		return "/board/view";
	}
	
	@RequestMapping(value = "/goEditView", method = RequestMethod.POST)
	public String updateView(Locale locale, Model model, HttpServletRequest request) throws Exception {
		BoardDTO dto = service.view(Integer.parseInt((String)request.getParameter("seq")));
		model.addAttribute("view", dto);
		return "/board/update";
	}
	
	@ResponseBody
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String update(Locale locale, Model model, BoardDTO dto) throws Exception {
		if(service.update(dto) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Locale locale, Model model, HttpServletRequest request) throws Exception {
		if(service.delete(Integer.parseInt((String)request.getParameter("seq"))) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
}
	
	

