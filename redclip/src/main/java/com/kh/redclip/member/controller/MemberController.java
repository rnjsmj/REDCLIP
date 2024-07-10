package com.kh.redclip.member.controller;


import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.redclip.member.model.service.MemberService;
import com.kh.redclip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    
    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @ResponseBody
    @PostMapping(value = "/check-nick", produces = "text/html; charset=UTF-8")
    public String checkNick(@RequestParam("userNick") String userNick) {
        // log.info("아이디 잘 가져왔나: {}", userId);
        int result = memberService.nickCheck(userNick);
        
        log.info("리져트잘가져옴?{}", result);
        if (result > 0) {
            return "Y"; // 반환값(중복 닉네임 수)가 0보다 크면 Y를 리턴
        } else {
            return "N"; // 아니면 N을 리턴해준다
        }
    }
   
    @PostMapping("/login")
    public String login(Member member, Model model, HttpSession session) {
        Member loginUser = memberService.login(member);

        if (loginUser != null && bCryptPasswordEncoder.matches(member.getUserPwd(), loginUser.getUserPwd())) {
            //log.info("로그인 성공: {}", loginUser);
            session.setAttribute("loginUser", loginUser);
            return "redirect:/";  // 로그인 성공 시 홈 페이지로 리다이렉트
        } else {
           // log.error("로그인 실패: 사용자 정보가 없습니다.");
            model.addAttribute("errorMsg", "로그인 실패");
            return "redirect:/";  // 홈화면으로
            
            
        }
    }
   
   //마이페이지에서 입력한 내용을 멤버 객체에 담아서 옮겨줄 친구!
	@PutMapping(value = "/{userId}", produces = "application/json; charset=UTF-8")
	public String update(@PathVariable String userId, Member member, HttpSession session) {
		
		//log.info("입력한 정보 : {}", member);
		
		int result = memberService.update(member);
		
		//rsult = 0 ==> 업데이트 실패
		//rsult = 1 ==> 업데이트 성공
		if(result>0) {
			
			//http 상에 메세지를 띄움
			session.setAttribute("Msg", "회원 정보 업데이트에 성공했습니다.");
			
			return "redirect:/";
		} else {
			
			session.setAttribute("errorMsg", "회원 정보 업데이트에 실패했습니다.");
			
			return "redirect:/";
		}
		
		
		
	}
}
