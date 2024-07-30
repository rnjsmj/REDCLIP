package com.kh.redclip.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.redclip.admin.model.service.AdminService;
import com.kh.redclip.faq.model.service.FaqService;
import com.kh.redclip.faq.model.vo.FAQ;
import com.kh.redclip.member.model.service.MemberService;
import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.member.model.vo.ReportMember;
import com.kh.redclip.member.model.vo.StatusMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

	private final FaqService faqService;
	private final MemberService memberService;
	private final AdminService adminService;
	
	//관리자 페이지로 이동
	@GetMapping
	public String adminPage(Model model) {
		
		List<ReportMember> reports = adminService.findAll();
		
		log.info("물어와! : {}", reports);
		
		model.addAttribute("list", reports);
		
		return "admin/adminPage";
	}
	
	/*
	//누적 신고 횟수 조회
	@GetMapping("/count")
	public String reportCount(String userId, Model model) {
		
		int count= memberService.reportCount(userId);
		
		model.addAttribute("count", count);
		
		log.info("누적 신고 횟수 : {}", count);
		
		return "redirect:/"; 
	}
	*/
	//faq 관리 페이지 이동
	@GetMapping("/adminFaq")
	public String adminFaq(Model model) {
		
		List<FAQ> faqList = faqService.selectAll();
		
		model.addAttribute("list", faqList);
		
		return "admin/admin_FAQ";
	}
	
	//회원 목록 조회
	@GetMapping("/memList")
	public String memList(Model model) {
		
		List<Member> members = adminService.allMember();
		
		model.addAttribute("list", members);
		
		return "admin/memList";
	}
	
	//탈퇴 회원 조회
	@GetMapping("/status")
	public String status(Model model) {

		List<StatusMember> member = adminService.status();
		
		//log.info("조회한 데이터 : {}", member);
		
		model.addAttribute("list", member);
		
		return "admin/statusList";
	}
	
	//회원 복구
	@ResponseBody
	@PutMapping
	public String change(@RequestBody String[] members) {
		
		log.info("넘어온 아이디 : {}", members);
		
		return adminService.change(members) > 0? "success" : "error";
	}
	
	//회원 삭제
	@ResponseBody
	@DeleteMapping
	public String deleteMember(@RequestBody String[] members) {
		
		//log.info("넘어온 아이디 : {}", members);
		
		return adminService.deleteMember(members) > 0? "success" : "error";
	}
	
	
}
