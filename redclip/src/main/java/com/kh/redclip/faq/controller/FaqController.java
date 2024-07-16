package com.kh.redclip.faq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.redclip.faq.model.service.FaqService;
import com.kh.redclip.faq.model.vo.FAQ;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/faq")
@RequiredArgsConstructor
@Slf4j
public class FaqController {

	private final FaqService faqService;
	
	@GetMapping
	public String faqList(Model model) {
		
		List<FAQ> faqList = faqService.selectAll();
		
		//log.info("faq 목록 :{}", faqList);
		
		model.addAttribute("list", faqList);
		
		return "faq/faqList";
	}
	
	@ResponseBody
	@PostMapping()
	public String faqInsert(@RequestBody FAQ faq) {
		
		return faqService.faqInsert(faq) > 0 ? "success" : "error";
		
	}
	
	
}
