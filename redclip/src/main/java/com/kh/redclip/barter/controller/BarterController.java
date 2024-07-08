package com.kh.redclip.barter.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.redclip.barter.model.service.BarterService;
import com.kh.redclip.barter.model.vo.Barter;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/barters")
public class BarterController {
	private final BarterService barterService;
	
	@GetMapping
    public ResponseEntity<List<Barter>> getAllBarters() {
        List<Barter> barters = barterService.getAllBarters();
        return ResponseEntity.ok(barters);
    }
	
	
	// 교환 게시글 상세보기
	@GetMapping("/barters/{no}")
	public String findByNo(int barterNo, Model model) {
		
		
		
		
		return "barter/detail";
	}
}
