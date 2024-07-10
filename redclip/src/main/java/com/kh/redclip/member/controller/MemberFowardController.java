package com.kh.redclip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberFowardController {
	//회원가입페이지이동
	@GetMapping("/joinform")
	public String joinform() {
		 return "member/joinform";
		
	}	
	//로그인페이지이동
	@GetMapping("/loginform")
	public String loginform() {
		return "member/loginform";
	}
	
	//마이페이지 이동
	@GetMapping("/myPage")
	public String myPage() {
		
		return "member/myPage";
	}
	
}
