package com.kh.redclip.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chatting")
public class ChattingController {
	
	//화면 테스트용 컨트롤러
	@GetMapping("/view")
	public String view() {
		return "chatting/view";
	}
}
