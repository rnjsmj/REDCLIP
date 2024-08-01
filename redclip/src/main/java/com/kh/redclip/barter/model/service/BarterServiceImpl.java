package com.kh.redclip.barter.model.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.redclip.barter.controller.BarterController;
import com.kh.redclip.barter.model.dao.BarterMapper;
import com.kh.redclip.barter.model.vo.Barter;
import com.kh.redclip.barter.model.vo.BarterFile;
import com.kh.redclip.barter.model.vo.BarterReply;
import com.kh.redclip.barter.model.vo.BarterReplyFile;
import com.kh.redclip.barter.model.vo.BarterVO;
import com.kh.redclip.barter.model.vo.Wishlist;
import com.kh.redclip.member.model.vo.ReportMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BarterServiceImpl implements BarterService{

	private final BarterMapper barterMapper;

	@Override
	public List<BarterVO> getAllBarters(Integer code) {
		return barterMapper.getAllBarters(code);
	}
	
	@Override
	public BarterVO findById(int barterNo) {
		return barterMapper.findById(barterNo);
	}

	@Transactional
	@Override
	public int insert(Barter barter, 
					  MultipartFile[] upfile, 
					  HttpSession session) {
		try {
			barterMapper.insert(barter);
			for (MultipartFile file : upfile) {
        		if(!file.isEmpty()) {
                BarterFile uploadFile = new BarterFile();
                uploadFile.setBarterFileName(saveFile(file, session));
                barterInsert(uploadFile);
        		}
			}   
			
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int barterInsert(BarterFile barterFile) {
		return barterMapper.barterInsert(barterFile);
	}
	
	//게시글 수정
	@Transactional
	@Override
	public int update(Barter barter, MultipartFile[] upfile, HttpSession session) {
	    try {
	        int barterNo = barter.getBarterNo();
	        // 바터 데이터 업데이트
	        barterMapper.update(barter);
	        
	        // 업로드된 파일이 있는지 확인
	        if (upfile.length > 0 && upfile[0] != null && !upfile[0].isEmpty()) {
	            // 새로운 파일이 업로드된 경우, 기존 파일 삭제
	            barterMapper.barterFileDelete(barterNo);
	            
	            // 새로운 파일 저장 및 데이터베이스 업데이트
	            for (MultipartFile file : upfile) {
	                if (!file.isEmpty()) {
	                    BarterFile uploadFile = new BarterFile();
	                    uploadFile.setBarterFileName(saveFile(file, session));
	                    uploadFile.setBarterNo(barterNo);
	                    barterMapper.barterFileUpdate(uploadFile);
	                }
	            }
	        }
	        
	        return 1;
	    } catch (Exception e) {
	        e.printStackTrace(); // 로그에 에러 메시지 추가
	        return 0;
	    }
	}

	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String fileName = upfile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		int num = (int) (Math.random() * 900) + 100; 
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String savePath = session.getServletContext().getRealPath("/resources/upload/");	
		
		String changeName = "REDCLIP_" + currentTime + "_" + num + ext;
		
		//파일 업로드
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "resources/upload/" + changeName;

	}
	
	@Override
	public List<BarterReply> getBarterReply(int barterNo) {
		return barterMapper.getBarterReply(barterNo);
	}
	
	@Transactional
	@Override
	public int replyInsert(BarterReply reply, 
			               MultipartFile[] upfiles, 
			               HttpSession session) {
		 try {
			 barterMapper.replyInsert(reply);
			 
			 if (upfiles != null && upfiles.length != 0) {
				 for(MultipartFile file : upfiles) {
					 BarterReplyFile replyFile = new BarterReplyFile();
					 replyFile.setReplyFileName(saveFile(file, session));
					 replyFileInsert(replyFile);
				 }
			 }
			 
			 return 1;
			 
		 } catch(Exception e) {
			 e.printStackTrace();
			 return 0;
		 }
	}

	@Override
	public int replyUpdate(BarterReply barterReply) {
		return barterMapper.replyUpdate(barterReply);
	}

	@Override
	public int replyDelete(int replyNo) {
		return barterMapper.replyDelete(replyNo);
	}
	
	/*
	 * public void replyListDelete(int barterNo) {
	 * barterMapper.replyListDelete(barterNo); }
	 */
	@Override
	public int increaseHit(int barterNo) {
		return barterMapper.increaseHit(barterNo);
	}
	
	@Override
	public BarterReply getBarterReplyById(int replyNo) {
		return barterMapper.getBarterReplyById(replyNo);
	}
	
	@Override
	public int replyFileInsert(BarterReplyFile replyFile) {
		return barterMapper.replyFileInsert(replyFile);
	}

	@Transactional
	@Override
	public int barterDelete(int barterNo) {
		/*
		try {
			
			if (fileExist != 0) {
				barterMapper.barterFileDelete(barterNo);
			}
			
			for ( BarterReply reply : getBarterReply(barterNo) ) {
				replyFileDelete(reply.getReplyNo());
			}
			
			barterMapper.replyListDelete(barterNo);
			barterMapper.barterDelete(barterNo);
			
			return 1;
			
			
		} catch (Exception e) {
			
			return 0;
		}*/
		
		return barterMapper.barterDelete(barterNo);
		
	}
	
	
	public int getBarterFileCount(int barterNo) {
		return barterMapper.getBarterFileCount(barterNo);
	}
	
	/*
	 * public void barterFileDelete(int barterNo) {
	 * barterMapper.barterFileDelete(barterNo);
	 * 
	 * }
	 */
	@Override
	public int replyFileDelete(int replyNo) {
		return barterMapper.replyFileDelete(replyNo);
	}
	
	// 좋아요 상태 확인
	@Override
	public Wishlist wishStatus(Wishlist wish) {
		return barterMapper.wishStatus(wish);
	}

	@Override
	public int wishInsert(Wishlist wish) {
		return barterMapper.wishInsert(wish);
	}

	@Override
	public int wishDelete(Wishlist wish) {
		return barterMapper.wishDelete(wish);
	}

	@Override
	public int barterReport(ReportMember report) {
		return barterMapper.barterReport(report);
	}

	@Override
	public List<BarterVO> getFilteredBarters(Map<String, Object> params) {
		return barterMapper.getFilteredBarters(params);
	}


	@Override
	public List<BarterVO> getTopBarters(int barterNo) {
		return barterMapper.getTopBarters(barterNo);
	}

		
}
