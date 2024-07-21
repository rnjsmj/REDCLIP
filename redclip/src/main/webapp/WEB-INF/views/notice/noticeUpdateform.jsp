<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
   
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 60%;
            margin: 0 auto;
            margin-top: 20px;
            min-height:700px;
            padding-top:50px;
        }

        h1 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        .btn-custom {
            margin: 0 5px;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="container">
        <h1>게시글 수정하기</h1>
        <form action="updateNotice" method="post">
            <input type="hidden" name="noticeNo" value="${notice.noticeNo}">
            <div class="form-group">
                <label for="postType">글 유형</label>
                <select id="postType" name="noticeType" class="form-control">
                    <option value="공지" <c:if test="${notice.noticeType == '공지'}">selected</c:if>>공지</option>
                    <option value="이벤트" <c:if test="${notice.noticeType == '이벤트'}">selected</c:if>>이벤트</option>
                </select>
            </div>
        
            <div class="form-group">
                <label for="postTitle">제목</label>
                <input type="text" id="postTitle" name="noticeTitle" class="form-control" value="${notice.noticeTitle}">
            </div>
            <div class="form-group">
                <label for="authorName">작성자</label>
                <input type="text" id="authorName" name="userId" class="form-control" value="${notice.userId}" readonly>
            </div>
           
            <div class="form-group">
                <label for="postContent">내용</label>
                <textarea id="postContent" name="noticeContent" class="form-control" rows="5">${notice.noticeContent}</textarea>
            </div>
            
            <div class="buttons">
                <button type="submit" class="btn btn-success btn-custom">저장</button>
                <button type="button" class="btn btn-secondary btn-custom" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
