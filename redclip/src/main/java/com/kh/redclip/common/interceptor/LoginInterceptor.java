package com.kh.redclip.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	/*
	 * Interceptor(정확히 HandlerInterceptor)
	 * 
	 * handle()을 호출하기전, 인터셉터가 가로채서 실행할내용을 작성할수있음
	 * 
	 * prehandle(전처리) : Handler호출전 낚아챔
	 * -
	 * postHandle(후처리) : 요청처리후 낚아챔 
	 * 
	 * 
	 * 
	 * */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	        throws Exception {
		
		
		//true 나 false 를 반환
		//true 를 반환하면 -> 기존 요청 호출대로 Handler 를 정상 수행 --> Controller에 있는 메소드 호출
		//false  반환 ->Handler를 호출 안하고return 
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) {
		    return true;
		} else {
		    session.setAttribute("alertMsg", "로그인하고와라 장난꾸러기야~~");
		    response.sendRedirect(request.getContextPath());
		    return false;
		}
		
	}

}
