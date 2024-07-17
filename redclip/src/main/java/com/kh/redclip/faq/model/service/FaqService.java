package com.kh.redclip.faq.model.service;

import java.util.List;

import com.kh.redclip.faq.model.vo.FAQ;

public interface FaqService {

	List<FAQ> selectAll();

	FAQ faqInsert(FAQ faq);

	int selectByNo(FAQ faq);

}
