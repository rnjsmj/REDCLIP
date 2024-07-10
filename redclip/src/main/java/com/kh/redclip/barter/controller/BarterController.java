package com.kh.redclip.barter.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.redclip.barter.model.service.BarterService;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/barters")
public class BarterController {
	
	private final BarterService barterService;
	
	//교환 게시글 목록보기
	@GetMapping
	public String getAllBarters(@RequestParam(value="code", defaultValue="0") Integer code, Model model) {
	List<BarterVO> barters = barterService.getAllBarters(code);
	model.addAttribute("list", barters);
	return "barter/list";
    }
	
	// 교환 게시글 상세보기
	@GetMapping("/{barterNo}")
	public String findByNo(@PathVariable int barterNo, Model model) {
		
		BarterVO barterDetail = barterService.findById(barterNo);
		model.addAttribute("barter", barterDetail);
		
		return "barter/detail";
	}
	
	// 교환 게시글 등록 페이지 보기
		@GetMapping("/registration")
		public String barterForwarding() {
			return "barter/registration";
		}
	
	// 교환 게시글 글 등록하기
		@PostMapping("/insert")
		public String insert(Barter barter, MultipartFile upfile, HttpSession session, Model model) {
		    log.info("게시글정보 : {}", barter);
		    log.info("파일의정보 : {}", upfile);
		    
		    if (!upfile.isEmpty()) {
		        barter.setBarterName(upfile.getOriginalFilename());
		    }
		    
		    if (barterService.insert(barter) > 0) {
		        session.setAttribute("alertMsg", "게시물 등록 완료");
		        return "redirect:/barters";  // 바뀐 URL: /barters로 수정
		    } else {
		        model.addAttribute("alertMsg", "게시물 등록을 실패했습니다.");
		    }
		    
		    return "redirect:/barters/registration";  // 바뀐 URL: /barters/registration으로 수정
		}

}
