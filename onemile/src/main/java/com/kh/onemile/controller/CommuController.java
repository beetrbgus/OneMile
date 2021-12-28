package com.kh.onemile.controller;

import java.io.IOException;

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
import com.kh.onemile.vo.CommuVO;

@RequestMapping("/commu")
@Controller
public class CommuController {

	@Autowired
	private CommuService commuService;
	
	@Autowired @Qualifier("commuImage")
	private ImageService imageService;
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/questions/write")
	public String writeQ() {
		return "commu/questions/write";
	}
	
	@PostMapping("/questions/write")
	public String writeQ(@ModelAttribute CommuVO commuVo) throws IllegalStateException, IOException {
		commuService.write(commuVo);
		//1
		//2
		return "redirect:questions/list";
	}
	
	@GetMapping("/questions/list")
	public String listQ() {
		return "commu/questions/list";
	}
	
	@RequestMapping("/questions/detail")
	public String detailQ(@RequestParam int boardNo, Model model) throws IOException {
		//조회 3번 (commu, reply, image)
		model.addAttribute("commuDetailVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo)); //boardNo로 imageNo list를 불러오는 거 만들기
		model.addAttribute("replyVOList", replyService.listByBoardNo(boardNo)); //boardNo로 댓글 찾아주는 거 만들기
		
		return "commu/questions/detail";
	}
	
	@GetMapping("/boonsil/write")
	public String writeBoonsil() {
		return "commu/boonsil/write";
	}
	
	@PostMapping("/boonsil/write")
	public String writeBoonsil(@ModelAttribute CommuVO commuVo) throws IllegalStateException, IOException {
		commuService.write(commuVo);
		return "redirect:boonsil/list";
	}
	
	@GetMapping("/boonsil/list")
	public String listBoonsil() {
		return "commu/boonsil/list";
	}
	
	@RequestMapping("/boonsil/detail")
	public String detailBoonsil(@RequestParam int boardNo, Model model) throws IOException {
		model.addAttribute("commuDetailVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo));
		model.addAttribute("replyVOList", replyService.listByBoardNo(boardNo));
		return "commu/boonsil/detail";
	}
	
	@GetMapping("/funding/write")
	public String writeFunding() {
		return "commu/funding/write";
	}
	
	@PostMapping("/funding/write")
	public String writeFunding(@ModelAttribute CommuVO commuVo) throws IllegalStateException, IOException {
		commuService.write(commuVo);
		return "redirect:funding/list";
	}
	
	@GetMapping("/funding/list")
	public String listFunding() {
		return "commu/funding/list";
	}
	
	@RequestMapping("/funding/detail")
	public String detailFunding(@RequestParam int boardNo, Model model) throws IOException {
		model.addAttribute("commuDetailVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo));
		model.addAttribute("replyVOList", replyService.listByBoardNo(boardNo));
		return "commu/funding/detail";
	}
}
