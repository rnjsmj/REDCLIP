package com.kh.redclip.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.redclip.member.model.service.MemberService;
import com.kh.redclip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping(value = "/member", produces = "application/json; charset=UTF-8")
public class MemberController {

	private final MemberService memberService; 
	
	//마이페이지에서 입력한 내용을 멤버 객체에 담아서 옮겨줄 친구!
	@PutMapping("/{userId}")
	public String update(@PathVariable String userId, Member member) {
		
		//log.info("입력한 정보 : {}", member);
		
		int result = memberService.update(member);
		
		return "";
	}
}
