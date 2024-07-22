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
	@GetMapping("/")
    public String recently(Model model, BarterVO barterVo) {
		
		log.info("haha");
      List<BarterVO> recentProducts = mainService.getRecentProducts();
      model.addAttribute("recentProducts", recentProducts);
      log.info("BarterVO 빠라빠라빠라 빰빰빰  {}",recentProducts);
        return "index";
    }

	
}
