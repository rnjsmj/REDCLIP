package com.kh.redclip.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.redclip.admin.model.service.AdminService;
import com.kh.redclip.member.model.vo.ReportMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller

@RequestMapping("/admin")

@RequiredArgsConstructor
@Slf4j
public class AdminController {

    private final AdminService adminService;

    // 회원 복구
    @ResponseBody
    @PutMapping
    public String change(@RequestBody String[] members) {
        // log.info("넘어온 아이디 : {}", members);
        return adminService.change(members) > 0 ? "success" : "error";
    }

    // 회원 삭제
    @ResponseBody
    @DeleteMapping
    public String deleteMember(@RequestBody String[] members) {
        // log.info("넘어온 아이디 : {}", members);
        return adminService.deleteMember(members) > 0 ? "success" : "error";
    }

    // 신고글 상세보기
    @GetMapping("ReportDetail")
    public String ReportDeatil(ReportMember report, Model model) {
        ReportMember reportData = adminService.ReportDetail(report);

        if (reportData != null) {
            model.addAttribute("report", reportData);
            return "admin/getDetail";
        } else {
            return "errorPage";
        }
    }

    // 신고글 삭제
    @PostMapping("deleteReport")
    public String deleteReport(int reportNo, HttpSession session) {
        int result = adminService.deleteReport(reportNo);

        if (result > 0) {
            session.setAttribute("alertMsg", "삭제성공.");
            return "redirect:reportList";
        } else {
            session.setAttribute("alertMsg", "삭제실패");
            return "redirect:reportList";
        }
    }
}
