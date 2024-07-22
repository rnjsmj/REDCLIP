package com.kh.redclip.faq.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	@PostMapping
	public String faqInsert(@RequestBody FAQ faq) {
		
		return faqService.faqInsert(faq) > 0 ? "success" : "error";
		
	}
	
	@ResponseBody
	@GetMapping("/{faqNo}")
	public FAQ selectByNo(@PathVariable int faqNo, Model model) {
		
		//log.info("받아온 번호 : {}", faqNo);
		
		FAQ faq = faqService.selectByNo(faqNo);
		
		//log.info("가져온 정보 : {}", faq);
		
		model.addAttribute("detail", faq);
		
		return faq;
		
	}
	
	@ResponseBody
	@PutMapping("/{faqNo}")
	public String update(@PathVariable int faqNo, FAQ faq) {
		
		log.info("받아온 번호 : {}", faqNo);
		
		faqService.update(faq) > 0? "success" : "error" ;
		
		log.info("입력한 값 : {}", faq);

		return "success";
	}
	
	
}
