package com.kh.redclip.faq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.redclip.faq.model.service.FaqService;
import com.kh.redclip.faq.model.vo.FAQ;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/faq")
@RequiredArgsConstructor
public class FaqForwardController {
	
	private final FaqService faqService;

	@GetMapping
	public String faqList(Model model) {
		
		List<FAQ> faqList = faqService.selectAll();
		
		//log.info("faq 목록 :{}", faqList);
		
		model.addAttribute("list", faqList);
		
		return "faq/faqList";
	}
}
