package com.kh.redclip.admin.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
public class AdminForwardController {

	private final FaqService faqService;
	private final MemberService memberService;
	private final AdminService adminService; 
	
	//관리자 페이지로 이동
		@GetMapping
		public String adminPage(Model model) {
			
			List<ReportMember> reports = adminService.findAll();
			
			model.addAttribute("list", reports);
			
			return "admin/adminPage";
		}
	
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
		
		@GetMapping("/reportList")
		public String findAll(Model model) {
			
			List<ReportMember> reports = adminService.findAll();
			
			model.addAttribute("list", reports);
			
			return "admin/reportList";
		}
		
		@GetMapping("/getDetail")
		public String getDetail(Model model, int reportNo, String reportedId) {
			
			ReportMember reMember = adminService.getDetail(reportNo);
			
			int count= adminService.reportCount(reportedId);
			
			model.addAttribute("report", reMember);
			
			model.addAttribute("count", count);
			
			return "admin/getDetail";
		}
		
	
}
