package com.kh.redclip.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.redclip.member.model.service.MemberService;
import com.kh.redclip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService; 
	
	@PostMapping
	public String update(Member member, HttpSession session) {
		
		memberService.update(member);
		
		return "";
	}
}
