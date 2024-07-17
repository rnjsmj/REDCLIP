package com.kh.redclip.notice.model.vo;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Notice {
		private int noticeNo;
		private String noticeTitle;
		private String noticeContent;
		private String noticeDate;
		private String noticeType;
		private String userId;

}
