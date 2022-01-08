package com.kh.onemile.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.onemile.service.commu.CommuService;
import com.kh.onemile.service.image.ImageService;
import com.kh.onemile.util.Sequence;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.CommuVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/commu")
@Controller
@Slf4j
public class CommuWithMapController {

	@Autowired
	private CommuService commuService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private Sequence seq;
	
	@GetMapping("/map/write")
	public String writeMatjip() {
		return "commu/map/write";
	}
	
	@PostMapping("/map/write")
	public String writeMatjip(@ModelAttribute CommuVO commuVo, HttpSession session) throws IllegalStateException, IOException {
		int memberNo = (int)session.getAttribute("logNo");
		commuVo.setMemberNo(memberNo);
		int commuNo = commuService.write(commuVo);
		return "redirect:/commu/map/detail?boardNo="+commuNo;
	}
	

	@GetMapping("/map/listdetail")
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
	
	@GetMapping("/map/list")
	public String list(Model model){
		/*
		 * List<MemberMiddleImageDTO>
		 * 
		 * model.add("list",List<MemberMiddleImageDTO> )
		 */
		return "commu/notmap/list";
	}
	
	@RequestMapping("/map/detail")
	public String detailMatjip(@RequestParam int boardNo, Model model) throws IOException {
		model.addAttribute("commuDetailVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo)); //boardNo로 imageNo list를 불러오는 거 만들기
		return "commu/map/detail";
	}
}
