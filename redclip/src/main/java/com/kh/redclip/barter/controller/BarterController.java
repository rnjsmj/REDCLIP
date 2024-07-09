package com.kh.redclip.barter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	@GetMapping("update")
	public ModelAndView updateForm(ModelAndView mv, int boardNo) {
		mv.addObject("barter",barterService.findById(boardNo))
	      .setViewName("barter/barterUpdate");
	    return mv;
	}
}
