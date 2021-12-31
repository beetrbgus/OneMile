package com.kh.onemile.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onemile.repository.reply.ReplyDao;
import com.kh.onemile.service.reply.ReplyService;
import com.kh.onemile.vo.ReplyVO;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private ReplyDao replyDao;
	
	@GetMapping("/delete")
	public String home() {
		return "reply/delete";
	}
	
	@PostMapping("/delete")
	public String deleteReply(@RequestParam int replyNo, HttpServletRequest request) {
		replyService.deleteReply(replyNo);
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int replyNo, Model model) {
		return "reply/edit";
	}
	
	@PostMapping("/edit")
	public String editReply(@RequestParam ReplyVO replyVo, HttpServletRequest request) {
		replyService.editReply(replyVo);
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
}
