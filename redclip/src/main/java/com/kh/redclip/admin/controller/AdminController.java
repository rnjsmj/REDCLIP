package com.kh.redclip.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.redclip.faq.model.service.FaqService;
import com.kh.redclip.faq.model.vo.FAQ;
import com.kh.redclip.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

	private final FaqService faqService;
	private final MemberService memberService;
	
	@GetMapping
	public String adminPage() {
		
		return "admin/adminPage";
	}
	
	@GetMapping("/adminFaq")
	public String adminFaq(Model model) {
		
		List<FAQ> faqList = faqService.selectAll();
		
		model.addAttribute("list", faqList);
		
		return "admin/admin_FAQ";
	}
	
	@GetMapping("/{faqNo}")
	public String selectByNo(@PathVariable int faqNo) {
		
		log.info("받아온 번호 : {}", faqNo);
		
		return /*faqService.selectByNo() > 0? "success" :*/ "error";
	}
}
