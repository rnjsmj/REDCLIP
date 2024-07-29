package com.kh.redclip.faq.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.redclip.faq.model.dao.FaqMapper;
import com.kh.redclip.faq.model.vo.FAQ;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FaqServiceImpl implements FaqService {

	private final FaqMapper faqMapper;
	
	@Override
	public List<FAQ> selectAll() {
		return faqMapper.selectAll();
	}

	@Override
	public int faqInsert(FAQ faq) {
		return faqMapper.faqInsert(faq);
	}

	@Override
	public FAQ selectByNo(int faq) {
		return faqMapper.selectByNo(faq);
	}

	@Override
	public int update(FAQ faq) {
		return faqMapper.update(faq);
	}

	@Override
	public int delete(List<Integer> numbers) {
		return faqMapper.delete(numbers);
	}

	
	
}
