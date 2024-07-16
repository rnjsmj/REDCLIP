package com.kh.redclip.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	@GetMapping("/noticeform")
	public String noticeform() {
		 return "notice/noticeform";
		
	}	
}
