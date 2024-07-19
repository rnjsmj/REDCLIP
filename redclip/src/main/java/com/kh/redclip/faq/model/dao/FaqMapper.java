package com.kh.redclip.faq.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.redclip.faq.model.vo.FAQ;

@Mapper
public interface FaqMapper {

	List<FAQ> selectAll();

	int faqInsert(FAQ faq);

	FAQ selectByNo(int faq);

	int update(FAQ faq);

	int delete(List<Integer> numbers);
}
