package com.kh.redclip.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
    private String userId;
    private String userPwd;
    private String userName;
    private String nickname;
    private String email;
    private String tel;
    private String address;
    private int postcode;
    private int point;
    private char status;
    private String createDate;
    private String addr1;
    private String addr2;
    

}
