package com.kh.redclip.barter.controller;

import java.util.List;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.kh.redclip.barter.model.service.BarterService;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/barters")
public class BarterController {
	
	private final BarterService barterService;
	
	//교환 게시글 목록보기
	@GetMapping
	public String getAllBarters(@RequestParam(value="code", defaultValue="0") Integer code, Model model) {
	List<BarterVO> barters = barterService.getAllBarters(code);
	model.addAttribute("list", barters);
	return "barter/list";
    }
	
	// 교환 게시글 상세보기
	@GetMapping("/{barterNo}")
	public String findByNo(@PathVariable int barterNo, Model model) {
		
		BarterVO barterDetail = barterService.findById(barterNo);
		if (barterService.increaseHit(barterNo) > 0) {
			
			model.addAttribute("barter", barterDetail);
			return "barter/detail";	
			
		}
		return "barter/barter-list";
	}
	
	// 교환 게시글 등록 페이지 보기
		@GetMapping("/registration")
		public String barterForwarding() {
			return "barter/registration";
		}
	
	// 교환 게시글 글 등록하기
	@GetMapping("insertForm.do")
	public String barterForwarding() {
		return "barter/insertForm";
	}
	
	@PostMapping("/insert")
		public String insert(Barter barter, MultipartFile upfile, HttpSession session, Model model) {
		    log.info("게시글정보 : {}", barter);
		    log.info("파일의정보 : {}", upfile);
		    
		    if (!upfile.isEmpty()) {
		        barter.setBarterName(upfile.getOriginalFilename());
		    }
		    
		    if (barterService.insert(barter) > 0) {
		        session.setAttribute("alertMsg", "게시물 등록 완료");
		        return "redirect:/barters";  // 바뀐 URL: /barters로 수정
		    } else {
		        model.addAttribute("alertMsg", "게시물 등록을 실패했습니다.");
		    }
		    
		    return "redirect:/barters/registration";  // 바뀐 URL: /barters/registration으로 수정
		}

	
	
	//답글 목록
	@GetMapping(value="reply", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<List<BarterReply>> getAllBarterReply(int barterNo) {
		
		List<BarterReply> replyList = barterService.getBarterReply(barterNo);
		return ResponseEntity.status(HttpStatus.OK).body(replyList);
	}
	
	
	//하나의 답글
	@GetMapping(value="reply/{replyNo}", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<BarterReply> getBarterReplyById(@PathVariable int replyNo) {
		
		BarterReply reply = barterService.getBarterReplyById(replyNo);
		return ResponseEntity.status(HttpStatus.OK).body(reply);
		
	}
	
	//답글 입력
	@PostMapping(value="reply")
	@ResponseBody
	public String replyInsert(BarterReply reply) {
		//barterNo, replyContent, replyWriter
		return barterService.replyInsert(reply) > 0 ? "success" : "error";
		
	}
	//답글 삭제
	@DeleteMapping(value="reply/{replyNo}")
	@ResponseBody
	public String replyDelete(@PathVariable int replyNo) {
		
		return barterService.replyDelete(replyNo) > 0 ? "success" : "error";
	}
	
	//답글 수정
	@PutMapping(value="reply")
	@ResponseBody
	public String replyUpdate(@RequestBody BarterReply reply) {
		
		return barterService.replyUpdate(reply) > 0 ? "success" : "error";
	}

		


}
