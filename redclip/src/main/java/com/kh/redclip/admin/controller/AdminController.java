package com.kh.redclip.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.redclip.faq.model.service.FaqService;
import com.kh.redclip.faq.model.vo.FAQ;
import com.kh.redclip.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
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
}
