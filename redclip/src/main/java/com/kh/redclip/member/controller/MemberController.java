package com.kh.redclip.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.redclip.member.model.service.MemberService;
import com.kh.redclip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/member")
public class MemberController {

	private final MemberService memberService; 
	
	//마이페이지에서 입력한 내용을 멤버 객체에 담아서 옮겨줄 친구!
	@PutMapping("/{userId}")
	public String update(Member member, HttpSession session) {
		
		//log.info("입력한 정보 : {}", member);
		
		int result = memberService.update(member);
		
		return "";
	}
}
