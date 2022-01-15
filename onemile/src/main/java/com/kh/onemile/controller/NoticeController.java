package com.kh.onemile.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onemile.service.commu.CommuService;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.CommuEditVO;
import com.kh.onemile.vo.CommuVO;

@RequestMapping("/notice")
@Controller
public class NoticeController {

	@Autowired
	private CommuService commuService;
	
	@Autowired
	private ImageService imageService;
	
	@GetMapping("/write")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute CommuVO commuVo, HttpSession session) throws IllegalStateException, IOException {
		int memberNo = (int)session.getAttribute("logNo");
		commuVo.setMemberNo(memberNo);
		commuService.write(commuVo);
		return "redirect:/notice/list"+commuVo.getMiddleName();
	}
	
	@GetMapping("/listdetail")
	@ResponseBody
	public List<CommuDetailVO> list(
			@RequestParam String middleName,
			@RequestParam(required =false, defaultValue = "1") int page,
			@RequestParam(required =false, defaultValue = "10") int size
			) {
		int endRow = page* size;
		int startRow = endRow - (size - 1);
		return commuService.menuList(middleName, startRow, endRow);
	}
	
	@GetMapping("/list/{middleName}")
	public String list(@PathVariable("middleName") String middleName, Model model){
		model.addAttribute("parameter", middleName);
		return "/notice/list";
	}
	
	@GetMapping("/contact")
	public String contact(){
		return "/notice/contact";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam int boardNo, Model model) throws IOException {
		model.addAttribute("commuEditVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo));
		
		return "/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute CommuEditVO commuEditVo, HttpSession session) throws IllegalStateException, IOException {
		commuService.edit(commuEditVo);
		return "redirect:/notice/list"+commuEditVo.getMiddleName();
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int boardNo) throws IOException {
		commuService.hide(boardNo);
		return "redirect:/notice/list";
	}
	
	@GetMapping("/detail/{boardNo}")
	public String detail(@PathVariable int boardNo, Model model) throws IOException {
		model.addAttribute("commuDetailVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo)); //boardNo로 imageNo list를 불러오는 거 만들기
		
		return "/notice/detail";
	}
}
