package com.kh.redclip.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

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
	@GetMapping("/")  //서버를 켰을때 생기는 url을 여기에 매핑해줘야 내가원하는 서버run >컨트롤러 > 리턴 > 
	//질문 서버를 켰을때 생기는 url은 뭐고???   :http://localhost:8080/redclip/ <=(톰캣서버 path????)
	// 왜 그 url은 view밖에있는 index를 찾아가는거냐...
	// 왜 webapp 안에있으면 인덱스를 바로탐??? 뭐때매???  ==>톰켓서버 폴더안에 web.xml --> welcome-file-list 가있음 --> 
	//그럼 톰캣 서버를열면 톰켓의 web.xml이 실행됨 ??
	// 내프로젝트에 web.xml에 welcome-file-list를 설정해놓으니 또 index.jsp를 못찾음...
	
    public String recently(Model model, BarterVO barterVo) {
		
		
      List<BarterVO> recentProducts = mainService.getRecentProducts();
      List<BarterVO> topProducts = mainService.getTopCount();
      model.addAttribute("topProducts", topProducts);
      model.addAttribute("recentProducts", recentProducts);
      log.info("BarterVO 빠라빠라빠라 빰빰빰  {}",recentProducts);
        return "main";
    }
	
	
	

	
}
