package com.kh.redclip.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.redclip.barter.model.vo.BarterVO;
import com.kh.redclip.main.model.service.MainService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {
	private final MainService mainService;
	
	//최근상품
	@GetMapping("/") 
	
    public String recently(Model model, BarterVO barterVo) {
		
		
      List<BarterVO> recentProducts = mainService.getRecentProducts();
      List<BarterVO> topProducts = mainService.getTopCount();
      model.addAttribute("topProducts", topProducts);
      model.addAttribute("recentProducts", recentProducts);
    
        return "main";
    }
	
	@GetMapping("/keywordForward/{keyword}")
	public String keywordForward(@PathVariable("keyword") String keyword, HttpSession session) {
		
		session.setAttribute("keyword", keyword);
		
		return "redirect:/barters";
	}
	
	@ResponseBody
	@GetMapping("/removeKeyword")
	public int removeKeyword(HttpSession session) {
		
		session.removeAttribute("keyword");
		return 1;
	}
	

	
}
