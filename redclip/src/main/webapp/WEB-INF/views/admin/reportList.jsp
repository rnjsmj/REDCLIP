<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고 목록</title>
    <style>
        body {
            margin: 20px;
            line-height: 1.6;
            height: auto;
        }

        .tab {
            width: 1200px;
            margin: 0 auto;
        }

        #title {
             margin: 30px; 
             margin-left: 340px;
        }
        #reportList {
             margin: 0 auto; 
             width: 1200px;
             margin-bottom: 200px;
            }

        #btn-none {
            float: right;
            margin-right: 330px;
         }
    </style>
</head>
<body>
    <!-- 헤더 영역-->
    <header>
        <jsp:include page="../common/header.jsp" />
    </header>
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">관리자 페이지</a></li>
        <li class="breadcrumb-item active" aria-current="page">신고회원관리</li>
      </ol>
    </nav>
    <div id="content">
        
        <h3 id="title">신고 관리</h3>

        <table class="table" id="reportList">
            <thead>
                <tr>
                	<th>신고번호</th>
                	<th>신고유형</th>
                    <th>제목</th>
                    <th>아이디</th>
                    <th>신고일시</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                <c:when test="${ empty list }">
                	<td colspan="5" align="center">신고 내역이 존재하지 않습니다.</td>
                </c:when>
                <c:otherwise>
                <c:forEach items="${ list }" var="report">
                	 <tr>
                	 	  <td>${ report.reportNo }</td>
                	 	  <td>${ report.reportType }</td>
	                      <td><a href="getDetail">${ report.reportTitle }</a></td>
	                      <td>${ report.reportedId }</td>
	                      <td>${ report.reportDate }</td>
	                 </tr>
                </c:forEach>
                </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>