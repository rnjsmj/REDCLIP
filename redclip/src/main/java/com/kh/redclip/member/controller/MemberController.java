package com.kh.redclip.member.controller;

import java.util.Random;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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
    private final JavaMailSenderImpl mailSender;

    @ResponseBody
    @PostMapping(value = "/check-id", produces = "text/html; charset=UTF-8")
    public String checkId(@RequestParam("userId") String userId) {
        // log.info("아이디 잘 가져왔나: {}", userId);
        int result = memberService.idCheck(userId);
        
        log.info("리져트잘가져옴?{}", result);
        if (result > 0) {
            return "Y"; // 반환값(중복아이디 수)가 0보다 크면 Y를 리턴
        } else {
            return "N"; // 아니면 N을 리턴해준다
        }
    }

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

    @ResponseBody
    @PostMapping(value = "/EmailAuth", produces = "application/json; charset=UTF-8")
    public int emailAuth(@RequestParam("email") String email) throws Exception {
        log.info("전달 받은 이메일 주소 : {}", email);
        
        // 난수의 범위 111111 ~ 999999 (6자리 난수)
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        
        // 이메일 보낼 양식
        String setFrom = "whddn1310@naver.com"; // 이메일 설정 변경 필요
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = "인증 코드는 " + checkNum + " 입니다." +
                         "<br>" +
                         "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
        
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        helper.setFrom(setFrom);
        helper.setTo(toMail);
        helper.setSubject(title);
        helper.setText(content, true);
        mailSender.send(message);
        
        log.info("랜덤숫자 : {}", checkNum);
        return checkNum;
    }
}
