package com.kh.redclip.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.notice.model.vo.Notice;

@Mapper
public interface NoticeMapper {

	int noticeCount();

	List<Notice> selectNotice(Map<String, Integer> map);

	
}
