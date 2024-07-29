package com.kh.redclip.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@AllArgsConstructor
@ToString
@Builder
public class PageInfo {
	int listCount; 
	int currentPage; 
	int pageLimit; 
	int boardLimit; 
	int maxPage; 
	int startPage; 
	int endPage; 
}
