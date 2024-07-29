<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>관리자 페이지</title>
</head>
<style>
  body {
      margin: 20px;
      line-height: 1.6;
      height: auto;
  }

  #title {
       margin: 30px; 
       margin-left: 340px;
  }
  #memberList {
       margin: 0 auto; 
       width: 1200px;
      }

  #btn-none {
      float: right;
      margin-right: 330px;
   }
</style>
<body>
     <!-- 헤더 영역-->
     <header>
       <jsp:include page="../common/header.jsp" />
    </header>
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">관리자 페이지</a></li>
        <li class="breadcrumb-item active" aria-current="page">FAQ 목록</li>
      </ol>
    </nav>
    <div id="content">

        <h3 id="title">관리자 페이지입니다.</h3>

        <table id="memberList" class="table table-hover">
            <thead>
              <tr>
                <th scope="col">신고 제목</th>
                <th scope="col">신고 내용</th>
                <th scope="col">신고 일자</th>
              </tr>
            </thead>
            <tbody>
            <c:choose>
            <c:when test="${ empty list }">
            	<td colspan="3" align="center">신고 내역이 존재하지 않습니다.</td>
            </c:when>
            <c:otherwise>
           	<c:forEach items="${ list }" var="reports">
           		<td>${ reports.reportTitle }</td>
           		<td>${ reports.reportContent }</td>
           		<td>${ reports.reportDate }</td>
           	</c:forEach>
            </c:otherwise>
            </c:choose>
            </tbody>
          </table>
          <div class="icon" align="center" style="margin-top: 40px; ">
            <a href=""><i class="bi bi-megaphone" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
            <a href="${pageContext.request.contextPath}/admin/adminFaq"><i class="bi bi-patch-question" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
            <a href=""><i class="bi bi-person-lines-fill" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
            <a href=""><i class="bi bi-person-exclamation" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
          </div>
    </div>
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>