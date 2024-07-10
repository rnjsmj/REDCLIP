package com.kh.redclip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class ForwardController {

	@GetMapping
	public String myPage() {
		
		return "member/myPage";
	}
}
