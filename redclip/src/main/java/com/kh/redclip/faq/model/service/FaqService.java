package com.kh.redclip.faq.model.service;

import java.util.List;

import com.kh.redclip.faq.model.vo.FAQ;

public interface FaqService {

	List<FAQ> selectAll();

	int faqInsert(FAQ faq);

	FAQ selectByNo(int faqNo);

	int update(FAQ faq);
	
	int delete(List<Integer> numbers);

}
