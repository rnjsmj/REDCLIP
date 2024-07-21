package com.kh.redclip.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.redclip.notice.model.vo.Notice;

public interface NoticeService {

	int noticeCount();

	List<Notice> findAllNotice(Map<String, Integer> map);

	int insertNotice(Notice notice);


	int deleteNotice(List<Integer> deleteNo);

	Notice noticeDetail(int noticeNo);

	int updateNotice(Notice notice);


	

}
