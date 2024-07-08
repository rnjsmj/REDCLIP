package com.kh.redclip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.redclip.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;

    @ResponseBody
    @PostMapping(value = "/check-id", produces = "text/html; charset=UTF-8 ; charset=UTF-8")
    public String checkId(@RequestParam("userId") String userId) {
       // log.info("아이디 잘 가져왔나: {}", userId);
        int result = memberService.idCheck(userId);
        
        // log.info("리져트잘가져옴?{}",result);
        if (result > 0) {
            return "Y"; // 반환값(중복아이디 수)가 0보다 크면 Y를 리턴
        } else {
            return "N"; // 아니면 N을 리턴해준다
        }
       
    }
   
}
