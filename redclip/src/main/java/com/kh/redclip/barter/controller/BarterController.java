package com.kh.redclip.barter.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.redclip.barter.model.service.BarterService;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterFile;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterReplyFile;
import com.kh.redclip.barter.model.vo.BarterVO;
import com.kh.redclip.barter.model.vo.Wishlist;
import com.kh.redclip.member.model.vo.ReportMember;

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
	/**
	 * 물물교환 게시글 상세보기
	 * @param barterNo : list.jsp에서 <a> 태그로 요청한 매핑주소로 전달된 게시글 번호
	 * @param model : 요청 처리 후 응답 시 requestScope에 값을 담기 위한 객체
	 * @return 성공시 detail.jsp로, 실패하는 경우 다시 list.jsp로 forward하기 위해 redirect
	 */
	@GetMapping("/{barterNo}")
	public String findByNo(@PathVariable int barterNo, Model model) {
		
		BarterVO barterDetail = barterService.findById(barterNo);
		if (barterService.increaseHit(barterNo) > 0) {
			model.addAttribute("barter", barterDetail);
			return "barter/detail";	
			
		}
		return "redirect:/barters";
	}
	
	// 교환 게시글 등록 페이지 보기
		@GetMapping("/registration")
		public String barterForwarding() {
			return "barter/registration";
		}
		
	//교환 게시글 글 등록하기
	@PostMapping(value="/insert")
	public String barterInsert(Barter barter, MultipartFile[] upfile, HttpSession session) {
	    //log.info("파일 배열 : {}", upfile);
	    if (barterService.insert(barter) > 0) {
	        
	        if (upfile != null) {
	            for (MultipartFile file : upfile) {
	            		if(!file.isEmpty()) {
	                    BarterFile uploadFile = new BarterFile();
	                    uploadFile.setBarterFileName(saveFile(file, session));;
	                    barterService.barterInsert(uploadFile);
	            	}
	            }     
	        }
	        	
	        return "redirect:/barters";

	       } else {
	    	   session.setAttribute("alertMsg", "너 등록망함");
	           return "redirect:/registration";
	    }
	}
	
	//게시글 검색 조회
	@GetMapping("/{category}/{code}")
    @ResponseBody
    public List<BarterVO> getFilteredBarters(@PathVariable("category") Integer categoryNo, @PathVariable("code") Integer code) {
        Map<String, Integer> params = new HashMap<String, Integer>();
        params.put("categoryNo", categoryNo);
        params.put("code", code);
        log.info("뭐냐묘{}",barterService.getFilteredBarters(params));
        return barterService.getFilteredBarters(params);
    }
	
	//답글 목록
	@GetMapping(value="reply", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<List<BarterReply>> getAllBarterReply(int barterNo) {
		
		List<BarterReply> replyList = barterService.getBarterReply(barterNo);
		return ResponseEntity.status(HttpStatus.OK).body(replyList);
	}
	
	//게시글 수정 페이지 보기
	@PostMapping("update")
	public ModelAndView updateForm(ModelAndView mv, int barterNo) {
	    mv.addObject("barter", barterService.findById(barterNo))
	      .setViewName("barter/update");
	    return mv;
	}
	
	//게시글 수정
	@PostMapping("barter-update")
	public String update(Barter barter,MultipartFile reupFile,HttpSession session) {
		if (!reupFile.getOriginalFilename().equals("")) {
		    barter.setChangeName(saveFile(reupFile, session));
		}

		if (barterService.update(barter) > 0) {
		    session.setAttribute("alertMsg", "게시물 수정 완료");
		    return "redirect:board-detail?boardNo=" + barter.getBarterNo();
		}else {
			 session.setAttribute("alertMsg", "게시물 수정 실패");
			 return "common/errorPage";
		}	
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
		
		//log.info("답글 : {}", reply);
		//log.info("파일 배열 : {}", upfiles);
		//barterNo, replyContent, replyWriter 필요
		
		
		if (barterService.replyInsert(reply) > 0) {
			
			int fileCount = 0;
			boolean fileSuccess = true;
			
			if (upfiles != null) {
				
				for(MultipartFile file : upfiles) {
					if( !file.isEmpty()) {
						BarterReplyFile replyFile = new BarterReplyFile();
						replyFile.setReplyFileName(saveFile(file, session));
						barterService.replyFileInsert(replyFile);
					}
				}
				
			}
			
			return fileSuccess == true ? "success" : "file upload error"; 
		
		} else {
			
			return "reply upload error";
		}
		
	}
	//답글 삭제
	@DeleteMapping(value="reply/{replyNo}")
	@ResponseBody
	public String replyDelete(@PathVariable int replyNo, @RequestBody boolean fileExist) {
		//log.info("fileExist : {}", fileExist);
		
		if (fileExist == true) {
			//log.info("파일 존재 : {}", fileExist);
			if (barterService.replyFileDelete(replyNo) <= 0) {
				return "file delete error";			
			}
			//log.info("파일 삭제 완료");
		}
		//log.info("답글 삭제 시도");
		return barterService.replyDelete(replyNo) > 0 ? "success" : "error";
	}
	
	//답글 수정
	@PutMapping(value="reply")
	@ResponseBody
	public String replyUpdate(@RequestBody BarterReply reply) {
		
		return barterService.replyUpdate(reply) > 0 ? "success" : "error";
	}
	

	//게시글 삭제
	@PostMapping("/delete")
	public String barterDelete(int barterNo, int fileExist, HttpSession session) {
		log.info("삭제할 게시글 번호 : {}", barterNo);
		if (fileExist != 0) {
			barterService.barterFileDelete(barterNo);
		}
		
		// 게시글에 포함된 답글을 삭제하기 위해 답글에 포함된 파일 삭제
		List<BarterReply> replyList = barterService.getBarterReply(barterNo);
		for ( BarterReply reply : replyList ) {
			barterService.replyFileDelete(reply.getReplyNo());
		}

		// 게시글 삭제 service에서 포함된 답글 삭제 후 게시글 삭제
		if (barterService.barterDelete(barterNo) > 0) {
			session.setAttribute("alertMsg", "게시글이 삭제되었습니다.");
			return "redirect:/barters";
		} else {
			session.setAttribute("alertMsg", "오류가 발생했습니다.");
			return "redirect:/barters/" + barterNo;
		}	
	}
	
	//좋아요 상태 확인
	@GetMapping("/wish")
	@ResponseBody
	public String barterWishState(Wishlist wish) {
		//log.info("요청 객체 : {}", wish);
		Wishlist state = barterService.wishStatus(wish);
		//log.info("객체 : {}", state);
		return state != null ? "exist" : "none";
	}
	
	//좋아요 등록/해제
	@PostMapping("/wish")
	@ResponseBody
	public String barterWish(Wishlist wish, int state, HttpSession session) {
		int result = 0;
		
		if (state == 1) {
			result = barterService.wishInsert(wish);
		} else {
			result = barterService.wishDelete(wish);
		}
		
		return result > 0 ? Integer.toString(barterService.findById(wish.getBarterNo()).getWishCount()) : "error";
		
	}

	//게시글 신고
	@PostMapping("/report")
	public String barterReport(ReportMember report, HttpSession session) {
		if (barterService.barterReport(report) > 0) {
			session.setAttribute("alertMsg", "신고가 접수되었습니다.");
			return "redirect:/barters/" + report.getReferenceNo();
		} else {
			session.setAttribute("alertMsg", "오류가 발생했습니다.");
			return "redirect:/barters/" + report.getReferenceNo();
		}
	}

}
