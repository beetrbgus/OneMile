package com.kh.onemile.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.onemile.service.commu.CommuService;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.service.reply.ReplyService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.CommuVO;
import com.kh.onemile.vo.ImageVO;

@RequestMapping("/commu")
@Controller
public class CommuWithMapController {

	@Autowired
	private CommuService commuService;
	
	@Autowired @Qualifier("commuImage")
	private ImageService imageService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private Sequence seq;
	
	@GetMapping("/matjip/write")
	public String writeMatjip() {
		return "commu/matjip/write";
	}
	
	@PostMapping("/matjip/write")
	public String writeMatjip(@ModelAttribute CommuVO commuVo, @ModelAttribute ImageVO imageVo, HttpSession session) throws IllegalStateException, IOException {
		int memberNo = (int)session.getAttribute("logNo");
		commuVo.setMemberNo(memberNo);
		int commuNo = commuService.write(commuVo);
		
		return "redirect:commu/detail?commuNo="+commuNo;
	}
	
	@GetMapping("/matjip/list")
	public String listMatjip(Model model, @RequestParam String middleName) {
		model.addAttribute("listMatjip", commuService.menuList(middleName));
		return "commu/matjip/list";
	}
	
	@RequestMapping("/matjip/detail")
	public String detailMatjip(@RequestParam int boardNo, Model model) throws IOException {
		model.addAttribute("commuDetailVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo)); //boardNo로 imageNo list를 불러오는 거 만들기
		model.addAttribute("replyVOList", replyService.listByBoardNo(boardNo)); //boardNo로 댓글 찾아주는 거 만들기
		return "commu/matjip/detail";
	}
	
	@GetMapping("/inc/write")
	public String writeInc() {
		return "commu/inc/write";
	}
	
	@PostMapping("/inc/write")
	public String writeInc(@ModelAttribute CommuVO commuVo, @ModelAttribute ImageVO imageVo, HttpSession session) throws IllegalStateException, IOException {
		int memberNo = (int)session.getAttribute("logNo");
		commuVo.setMemberNo(memberNo);
		int commuNo = commuService.write(commuVo);
		
		return "redirect:commu/detail?commuNo="+commuNo;
	}
	
	@GetMapping("/inc/list")
	public String listInc(Model model, @RequestParam String middleName) {
		model.addAttribute("listInce", commuService.menuList(middleName));
		return "commu/inc/list";
	}
	
	@RequestMapping("/inc/detail")
	public String detailInc(@RequestParam int boardNo, Model model) throws IOException {
		model.addAttribute("commuDetailVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo));
		model.addAttribute("replyVOList", replyService.listByBoardNo(boardNo));
		return "commu/inc/detail";
	}
	
	@GetMapping("/yam/write")
	public String writeYam() {
		return "commu/yam/write";
	}
	
	@PostMapping("/yam/write")
	public String writeYam(@ModelAttribute CommuVO commuVo, @ModelAttribute ImageVO imageVo, HttpSession session) throws IllegalStateException, IOException {
		int memberNo = (int)session.getAttribute("logNo");
		commuVo.setMemberNo(memberNo);
		int commuNo = commuService.write(commuVo);
		
		return "redirect:commu/detail?commuNo="+commuNo;
	}
	
	@GetMapping("/yam/list")
	public String listYam(Model model, @RequestParam String middleName) {
		model.addAttribute("listYam", commuService.menuList(middleName));
		return "commu/yam/list";
	}
	
	@RequestMapping("/yam/detail")
	public String detailYam(@RequestParam int boardNo, Model model) throws IOException {
		model.addAttribute("commuDetailVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo));
		model.addAttribute("replyVOList", replyService.listByBoardNo(boardNo));
		return "commu/yam/detail";
	}
}
