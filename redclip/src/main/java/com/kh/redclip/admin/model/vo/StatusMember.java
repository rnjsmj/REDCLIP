package com.kh.redclip.admin.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class StatusMember {

	private String userId;		//탈퇴회원 아이디
	private String dropReason;	//탈퇴 사유
	private Date dropDate;		//탈퇴 일자
	
}
