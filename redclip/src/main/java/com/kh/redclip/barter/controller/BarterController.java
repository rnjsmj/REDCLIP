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
	
	@GetMapping
    public List<BarterVO> getAllBarters(@RequestParam(value="region", required=false) int region,
    									@RequestParam(value="code", required=false) int code) {
		
		Map<String, Integer> map = new HashMap();
		map.put("region", region);
		map.put("code", code);
		
        List<BarterVO> barters = barterService.getAllBarters(map);
        return barters;
    }
	
	
	// 교환 게시글 상세보기
	@GetMapping("/{barterNo}")
	public String findByNo(@PathVariable int barterNo, Model model) {
		
		BarterVO barterDetail = barterService.findById(barterNo);
		model.addAttribute("barter", barterDetail);
		
		return "barter/detail";
	}
}
