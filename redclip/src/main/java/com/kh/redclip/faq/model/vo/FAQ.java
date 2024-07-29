package com.kh.redclip.faq.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class FAQ {

	private int faqNo;			//글번호
	private String userId;		//작성자 아이디
	private String question;	//질문
	private String answer;		//답변
	private String faqType;		//질문 종류
}
