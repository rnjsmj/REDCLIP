package com.kh.redclip.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.redclip.notice.model.service.NoticeService;
import com.kh.redclip.notice.model.vo.Notice;
import com.kh.redclip.notice.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService noticeService;
	// 공지 페이지 이동 컨트롤러 
	@GetMapping("noticeform")
	public String noticeform(@RequestParam(value="page",defaultValue = "1")  int page,
			  			@RequestParam(value = "type", defaultValue = "1")  int type,
			Model model) {
		 
		int listCount; //총 게시물 갯수
		int currentPage;  // 현재 페이지(사용자가 요청한 페이지) => 앞에서 넘길 것
		int pageLimit; // 페이징 하단에 보여질 페이징바의 최대 개수 => 10개
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수 => 10개
		int maxPage;  // 가장 마지막 페이지가 몇 번 페이지인지(총 페이지 개수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		
		
		listCount = noticeService.noticeCount();
		
		currentPage=page;
		
		
		pageLimit=10;// 페이징 하단에 보여질 페이징바의 최대 개수 => 10개
		boardLimit =10;// 한 페이지에 보여질 게시글의 최대 개수 => 10개
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);//가장 마지막페이지 (총페이지)
		//최대페이지 =(인트형변환)소수점이나오면 올림처리((더블형변환)전체글수/한페이지 글수);
		        			
		startPage = (currentPage -1 )/ pageLimit * pageLimit +1 ; //startPage: 시작페이지
		//시작페이지 = (현제페이지 -1  / 페이징바의갯수 * 페이지에 보여질 최대갯수)+1 
		
		
		endPage = startPage + pageLimit -1;  // endPage: 페이지 하단에 보여질 끝수 
		//페이지하단에 보여질 끝수 = 페이징바시작번호 +한페이지에 보여지는 페이지바(10) -1
		if(endPage > maxPage) endPage = maxPage;
		//만약 페이지하단에 보여질 끝수가 가장마지막페이지보다 많다면(총페이지) 페이지하단끝수= 총페이지
	
		 PageInfo pageInfo = PageInfo.builder()   //빌더메소드써서 다담아버려
					.listCount(listCount)
					.currentPage(currentPage)
					.pageLimit(pageLimit)
					.boardLimit(boardLimit)
					.maxPage(maxPage)
					.startPage(startPage)
					.endPage(endPage)
					.build();
		
		 Map<String, Integer> map = new HashMap();
			
			int startValue = (currentPage -1) * boardLimit +1; //boardLimit 한페이지에보여질 최대글
			int endValue = startValue + boardLimit -1; 
			
			map.put("type",type);
			map.put("startValue", startValue);
			map.put("endValue", endValue);
			
			List<Notice> noticeList = noticeService.findAllNotice(map); //sqlmapper에서 startValu랑 endValue로 목록을 가져와야댐
			
			  model.addAttribute("noticeList", noticeList);
			    model.addAttribute("pageInfo", pageInfo);
		 log.info("왜안뜨냐:{}",noticeList);
		 log.info("페이지인포{}",pageInfo);
		 log.info("start/end : {}, {}", startValue, endValue);
		 return "notice/noticeform";
	}	
	
	
	@PostMapping("insertNoticeform")
	public String insertNoticeform(HttpSession session ) {
	
		return "notice/insertNoticeform";
	}
	
	//글등록
	@PostMapping("insertNotice")
	public String insertNotice(Notice notice) {
		 log.info("여기보세요여기{}",notice);
	    noticeService.insertNotice(notice);
	    log.info(notice.getUserId());
	    return "redirect:/noticeform";
	}
	//글삭제 (체크박스)
	
	@PostMapping("deleteNotice")
	public String deleteNotice(@RequestParam List<Integer> deleteNo, HttpSession session) {
		
		 //log.info("이거 배열잘가져옴?!?!?{}",deleteNo);
	    int result = noticeService.deleteNotice(deleteNo);
        
	    if (result > 0) {
	        session.setAttribute("successMsg", "삭제성공.");
	        return "redirect:/noticeform";
	    } else {
	        session.setAttribute("failMsg", "삭제실패");
	        return "redirect:/noticeform";
	    }
	}
	//공지사항 상세보기
	@GetMapping("noticeDetail")
	public String noticeDetail(@RequestParam int noticeNo, Model model) {
		
		log.info("글번호잘가져옴?{}",noticeNo);
	    Notice notice = noticeService.noticeDetail(noticeNo);
	    log.info("노티스를알려달라{}",notice);
	    
	    if (notice != null) {
	        model.addAttribute("notice", notice);
	        return "notice/noticeDetailform";
	    } else {
	        return "errorPage";
	    }
	}
	
	//공지사항수정페이지 
	@GetMapping("noticeUpdateform")
    public String noticeUpdateform(@RequestParam int noticeNo, Model model) {
		
		
		 Notice notice = noticeService.noticeDetail(noticeNo);
	
		  if (notice != null) {
		        model.addAttribute("notice", notice);
		        return "notice/noticeUpdateform";
		    } else {
		        return "errorPage";
		    }
	}
	  // 공지사항 수정 처리
	  @PostMapping("updateNotice")
	    public String updateNotice(Notice notice, HttpSession session) {
	        int result = noticeService.updateNotice(notice);
	        
	        if (result > 0) {
	            session.setAttribute("alertMsg", "공지사항 수정성공.");
	            return "redirect:/noticeDetail?noticeNo=" + notice.getNoticeNo();
	        } else {
	            session.setAttribute("elertMsg", "공지사항 수정에 실패했습니다.");
	            return "errorPage";
	        }
	    }
}
