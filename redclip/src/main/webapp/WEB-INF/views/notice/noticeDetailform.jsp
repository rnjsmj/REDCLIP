<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        font-family: Arial, sans-serif;
    }

    .container {
        width: 60%;
        margin: 0 auto;
        margin-top: auto;
        min-height: 700px;
        padding-top:100px;
    }

    h1 {
    	
        margin-bottom: 50px;
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
     	margin-top: 50px
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: left;
        vertical-align: top;
    }

    th {
        background-color: #f5f5f5;
        width: 20%;
    }

    .content-cell {
        height: 150px;
    }

    .buttons {
        text-align: right;
        margin-bottom: 20px;
    }

    .btn-custom {
        margin: 0 5px;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<c:if test="${ not empty alertMsg }">
         <script>alert("${ alertMsg }")</script>
         <c:remove var="alertMsg" scope="session" />
 	</c:if>
    <div class="container">
        <h1>게시글 상세보기</h1>
        <table>
            <tr>
                <th>글 유형</th>
                <td>${notice.noticeType}</td>
                <th>등록일</th>
                <td>${notice.noticeDate}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3">${notice.noticeTitle}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td colspan="3">${notice.userId}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3" class="content-cell">${notice.noticeContent}</td>
            </tr>
        </table>
        
        <div class="buttons">
        <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.status == 'A'}">
            <a class="btn btn-success btn-custom" href="noticeUpdateform?noticeNo=${notice.noticeNo}">수정</a>
        </c:if>    
            <a class="btn btn-secondary btn-custom" href="noticeform">목록으로</a>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>
