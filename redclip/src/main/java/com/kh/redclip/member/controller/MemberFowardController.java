package com.kh.redclip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberFowardController {

	@GetMapping("/joinform")
	public String joinform() {
		 return "member/joinform";
		
	}	
}
