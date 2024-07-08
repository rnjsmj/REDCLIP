package com.kh.redclip.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	private String userId;
	private String userPwd;
	private String userName;
	private String nickname;
	private String email;
	private String tel;
	private String address;
	private int postCode;
	private int point;
	private String status;
	private Date createDate;
}
