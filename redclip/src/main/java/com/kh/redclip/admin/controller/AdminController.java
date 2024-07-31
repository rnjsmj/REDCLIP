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
import com.kh.redclip.admin.model.vo.ReportMember;
import com.kh.redclip.member.model.vo.StatusMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

	private final AdminService adminService;
	
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
	
	//레포트 내용 상세보기 
	@GetMapping("reportDetail")
	public String reportDetail() {
		
		
		return "";
		
	}
	
}
