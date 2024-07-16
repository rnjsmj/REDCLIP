package com.kh.redclip.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import java.sql.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class Notice {
		private int noticeNo;
		private String noticeTitle;
		private String noticeContent;
		private Date  noticeDate;
		private String noticeType;
		private String userId;

}
