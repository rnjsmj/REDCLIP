package com.kh.redclip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.redclip.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MemberController {
		private final MemberService memberService;
		
		
	@PostMapping("check-id")
		 public String checkId(String userId) {
			
		int result = memberService.idCheck(userId);
		
		if(result>0) {//반환값(중복아이디수) 가 0보다 크면 Y를 리턴
			return "Y";
			
		}else {  //아니면 N을 리턴해준다	
			return "N";
		}
	}
	
	
}


