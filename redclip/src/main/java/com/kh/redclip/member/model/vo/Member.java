package com.kh.redclip.member.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import java.sql.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class Member {
	
	private String changeName;			//프사
	private String userId;				//아이디
	private String userPwd;			//비밀번호
	private String userName;		//이름
	private String nickname;		//닉네임
	private String email;				//이메일
	private String tel;					//전화번호
	private String address;			//주소
	private String postCode;				//우편번호
	private int point;					//포인트
	private String status;				//회원상태
	private Date createDate;		//가입일
	private int villageCode;			//관심지역 코드
	private String addr1;			
	private String addr2;
}
