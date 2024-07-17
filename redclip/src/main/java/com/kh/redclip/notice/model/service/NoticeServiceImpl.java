package com.kh.redclip.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.redclip.notice.model.dao.NoticeMapper;
import com.kh.redclip.notice.model.vo.Notice;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	 private final NoticeMapper noticeMapper;
	@Override
	public int noticeCount() {
		return noticeMapper.noticeCount;
	}
	@Override
	public List<Notice> findAllNotice(Map<String, Integer> map) {
		return noticeMapper.selectNotice;
	}




}
