package com.kh.redclip.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.kh.redclip.barter.model.service.BarterService;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.member.model.service.MemberService;
import com.kh.redclip.member.model.vo.BlockMember;
import com.kh.redclip.member.model.vo.Member;
import com.kh.redclip.region.model.vo.Region;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    
    private final MemberService memberService;
    private final BarterService barterService;
    
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
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
    @ResponseBody
	@PutMapping
	public String update(@RequestBody Member member, HttpSession session) {
		
		//log.info("입력한 정보 : {}", member);
    	if(memberService.update(member)>0) {
    		
    		session.setAttribute("loginUser", memberService.login(member));
    		return "success";
    	} else {
    		return "error";
    	}
    	
    	
    }
    
    
    @ResponseBody
    @GetMapping("/guSelect")
    public List<Region> getGuList(@RequestParam("si") int cityCode) {
    	
    	log.info("시티코드머임 : {} ",cityCode);
        List<Region> guList = memberService.selectgu(cityCode);
        log.info("이거 어캐나오냐: {}", guList);
        
        return guList;
    }
    
    @ResponseBody
    @GetMapping("/dongSelect")
    public List<Region> getDongList(@RequestParam("gu") int townCode) {
    	
    	log.info("타운코드머임 : {} ",townCode);
        List<Region> dongList = memberService.selectdong(townCode);
        log.info("이거 어캐나오냐: {}", dongList);
        
        return dongList;
    }
    
    @PostMapping("/join")
    public String join(Member member,Model model) {
    	 
    	String enPwd = bCryptPasswordEncoder.encode(member.getUserPwd());
    	member.setUserPwd(enPwd);
    	member.setAddress(member.getAddr1() + member.getAddr2());

        if (memberService.insert(member) > 0) { // 성공 => 메인~
            return "redirect:/";
        } else { // 실패 => 에러페이지
        	 model.addAttribute("errorMessage", "회원 가입에 실패했습니다. 다시 시도해 주세요.");
        	 return "error";
        }
  }
    

    @ResponseBody
    @GetMapping(value="/searchId",produces = "text/html; charset=UTF-8")
    public String searchId(Member member) {
        String result = memberService.searchid(member);
        
        if (result != null ) {
            return  result ;
        } else {
            return "해당 회원의 정보가 존재하지 않습니다.";
        }
    }
    //회원 상태 변경
    @ResponseBody
    @PutMapping("/{userId}")
    public String changeStatus(@PathVariable String userId) {
    	  
    	//log.info("탈주: {}", userId);
    	return memberService.changeStatus(userId) > 0 ? "success" : "error";
    }
    
    //내가 쓴 글 조회
    @GetMapping("myProduct/{userId}")
    public String selectById(@PathVariable String userId, Model model) {
		
    	List<Barter> products = memberService.selectById(userId);
    	//log.info("조회할 회원 : {}", userId);
    	//log.info("목록 : {}", products);
    	
    	model.addAttribute("list", products);
    	
    	return "member/myproduct";
    	
    }
    
    //마이페이지 이동
    @GetMapping("/myPage")
	public String myPage() {
		
		return "member/myPage";
	}
    
   //차단 목록 조회
    @GetMapping("blockList/{userId}")
    public String selectByBlock(@PathVariable String userId, Model model) {
    	
    	List<BlockMember> blocks = memberService.selectByBlock(userId);
    	
    	
    	model.addAttribute("list", blocks);
    	
    	return "member/blockList";
    }

    //카카오 로그인 컨트롤러(토근가져오기)
   @GetMapping("oauth")
   public void kakaoLogin(String code, HttpSession session) throws  IOException, ParseException, org.json.simple.parser.ParseException {
	   
	  String accessToken = memberService.getToken(code);
	  session.setAttribute("accessToken", accessToken);
	  
	  memberService.getUserInfo(accessToken);
	  log.info("토큰은?{}",accessToken);
	  
   }
    //카카오 로그아웃 컨트롤러
   @GetMapping("kakao-logout")
   public String kakaoLogout (HttpSession session) throws IOException {
	   String accessToken = (String)session.getAttribute("accessToken");

	   memberService.kakaoLogout(accessToken);
	   
	   return "redirect:loginform";

   }
   
   
   //차단 해제
   @ResponseBody
   @DeleteMapping("blockList/{userId}")
   public String deleteByBlock(@PathVariable("userId") String userId, @RequestBody List<String> blockMembers) {
      
      log.info("차단 해제 할 아이디 : {}", blockMembers);
      log.info("차단 신청한 아이디 : {}", userId);
      
      return "success";// memberService.deleteByBlock(userId, blockMembers) > 0 ? "success" : "error";
   }
}
