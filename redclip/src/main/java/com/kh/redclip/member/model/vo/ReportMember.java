package com.kh.redclip.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ReportMember {

	private int reportNo;			//신고 번호
	private String reportTitle;		//신고 제목
	private String reportContent;	//신고 내용
	private Date reportDate;		//신고 일자
	private String reportedId;		//신고당한 사람
	private String reportType;		//신고 유형
	private int referenceNo;		//참조 번호
}
