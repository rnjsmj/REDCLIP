package com.kh.redclip.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NoticeController {
	// 공지 페이지 이동 컨트롤러 
	@GetMapping("/noticeform")
	public String noticeform() {
		 return "notice/noticeform";
	}	

}
