package com.kh.redclip.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.notice.model.vo.Notice;

@Mapper
public class NoticeMapper {

	public int noticeCount;
	
	public List<Notice> selectNotice;
	
}
