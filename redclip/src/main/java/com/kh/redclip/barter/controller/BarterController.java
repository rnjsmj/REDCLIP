package com.kh.redclip.barter.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.redclip.barter.model.service.BarterService;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterFile;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterReplyFile;
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
			log.info("상세정보 : {}", barterDetail);
			model.addAttribute("barter", barterDetail);
			return "barter/detail";	
			
		}
		return "barter/list";
	}
	
	// 교환 게시글 등록 페이지 보기
		@GetMapping("/registration")
		public String barterForwarding() {
			return "barter/registration";
		}
	

	// 교환 게시글 글 입력하기
	@PostMapping("/insert")
		public String insert(Barter barter, MultipartFile upfile, HttpSession session, Model model) {
		    log.info("게시글정보 : {}", barter);
		    log.info("파일의 정보 : {}", upfile.getOriginalFilename());
		    
		    if (!upfile.isEmpty()) {
		    	BarterFile barterFile = new BarterFile();
		        barterFile.setBarterFileName(upfile.getOriginalFilename());
		    }
		    
		    if (barterService.insert(barter) > 0) {
		        session.setAttribute("alertMsg", "게시물 등록 완료");
		        return "redirect:/barters";
		    } else {
		        model.addAttribute("alertMsg", "게시물 등록을 실패했습니다.");
		    }
		    
		    return "redirect:/barters/registration";
		}	
	
	//교환 게시글 글 등록하기
	@PostMapping(value="barterFile")
	public String barterInsert(Barter barter, MultipartFile[] upfile, HttpSession session) {
	    log.info("파일 배열 : {}", upfile);

	    if (barterService.insert(barter) > 0) {
	        int fileCount = 0;

	        if (upfile.length > 0) {
	            for (MultipartFile file : upfile) {
	                    BarterFile uploadFile = new BarterFile();
	                    uploadFile.setBarterFileName(file.getOriginalFilename());

	                    fileCount += barterService.barterInsert(uploadFile);
	            }
	        }

	        return fileCount == upfile.length ? "redirect:/" : "redirect:/registration";
	    } else {
	        return "redirect:/registration";
	    }
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
	public String replyInsert(BarterReply reply, MultipartFile[] upfiles, HttpSession session) {
		
		log.info("답글 : {}", reply);
		log.info("파일 배열 : {}", upfiles);
		//barterNo, replyContent, replyWriter 필요
		
		
		if (barterService.replyInsert(reply) > 0) {
			
			int fileCount = 0;
			boolean fileSuccess = true;
			
			if (upfiles != null) {
				
				for(MultipartFile file : upfiles) {
					
					BarterReplyFile replyFile = new BarterReplyFile();
					replyFile.setReplyFileName(saveFile(file, session));
					fileCount += barterService.replyFileInsert(replyFile);
					
				}
				fileSuccess = (fileCount == upfiles.length ? true : false); 
			}
			
			return fileSuccess == true ? "success" : "file upload error"; 
			
		
		} else {
			
			return "reply upload error";
		}
		
	}
	//답글 삭제
	@DeleteMapping(value="reply/{replyNo}")
	@ResponseBody
	public String replyDelete(@PathVariable int replyNo, boolean fileExist) {
		log.info("fileExist : {}", fileExist);
		
		if (fileExist == true) {
			log.info("파일 존재 : {}");
			if (barterService.replyFileDelete(replyNo) <= 0) {
				return "file delete error";			
			}
			log.info("파일 삭제 완료");
		}
		log.info("답글 삭제 시도");
		return barterService.replyDelete(replyNo) > 0 ? "success" : "error";
	}
	
	//답글 수정
	@PutMapping(value="reply")
	@ResponseBody
	public String replyUpdate(@RequestBody BarterReply reply) {
		
		return barterService.replyUpdate(reply) > 0 ? "success" : "error";
	}
	
	
	// 파일 업로드 메서드
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String fileName = upfile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		int num = (int) (Math.random() * 900) + 100; 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String savePath = session.getServletContext().getRealPath("/resources/upload/");	
		
		String changeName = "REDCLIP_" + currentTime + "_" + num + ext;
		
		//파일 업로드
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "resources/upload/" + changeName;
	}
	
	//게시글 삭제
	@PostMapping("/delete")
	public String barterDelete(int barterNo, HttpSession session) {
		//log.info("삭제할 게시글 번호 : {}", barterNo);
		
		if(barterService.barterDelete(barterNo) > 0) {
			session.setAttribute("alertMsg", "게시글이 삭제되었습니다.");
			return "redirect:/barters";
		} else {
			session.setAttribute("alertMsg", "오류가 발생했습니다.");
			return "redirect:/barters/" + barterNo;
		}
	}


}
