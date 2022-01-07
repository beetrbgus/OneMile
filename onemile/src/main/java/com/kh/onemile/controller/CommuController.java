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
import com.kh.onemile.service.reply.ReplyService;
import com.kh.onemile.vo.CommuDetailVO;
import com.kh.onemile.vo.CommuVO;
import com.kh.onemile.vo.ImageVO;
import com.kh.onemile.vo.reply.ReplyVO;

@RequestMapping("/commu")
@Controller
public class CommuController {

	@Autowired
	private CommuService commuService;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/notmap/write")
	public String write() {
		return "commu/notmap/write";
	}
	
	@PostMapping("/notmap/write")
	public String write(@ModelAttribute CommuVO commuVo, @ModelAttribute ImageVO imageVo, HttpSession session) throws IllegalStateException, IOException {
		int memberNo = (int)session.getAttribute("logNo");
		commuVo.setMemberNo(memberNo);
		int commuNo = commuService.write(commuVo);
		return "redirect:commu/notmap/detail?boardNo="+commuNo;
	}
	
	@GetMapping("/notmap/listdetail")
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
	
	@GetMapping("/notmap/list")
	public String list(Model model){
		/*
		 * List<MemberMiddleImageDTO>
		 * 
		 * model.add("list",List<MemberMiddleImageDTO> )
		 */
		return "commu/notmap/list";
	}
	
	@RequestMapping("/notmap/detail")
	public String detail(@RequestParam int boardNo, Model model) throws IOException {
		//조회 3번 (commu, reply, image)
		model.addAttribute("commuDetailVO", commuService.detail(boardNo));
		model.addAttribute("imageNoList", imageService.listByBoardNo(boardNo)); //boardNo로 imageNo list를 불러오는 거 만들기
//		model.addAttribute("replyVOList", replyService.listByBoardNo(boardNo)); //boardNo로 댓글 찾아주는 거 만들기
		
		return "commu/notmap/detail";
	}
}
