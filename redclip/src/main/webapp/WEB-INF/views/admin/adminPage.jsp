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
       text-align: center;
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
                <th scope="col">신고 유형</th>
                <th scope="col">신고 당한 아이디</th>
                <th scope="col">신고 일자</th>
              </tr>
            </thead>
            <tbody>
            <c:choose>
            <c:when test="${ empty list }">
            <tr>
            	<td colspan="4" align="center">신고 내역이 존재하지 않습니다.</td>
            </tr>
            </c:when>
            <c:otherwise>
           	<c:forEach items="${ list }" var="report">
           	<tr>
           		<td id="reportTitle"><a data-bs-toggle="modal" data-bs-target="#exampleModal">${ report.reportTitle }</a></td>
           		<td id="reportType">${ report.reportType }</td>
           		<td id="reportDate">${ report.reportedId }</td>
           		<td id="reportDate">${ report.reportDate }</td>
           	</tr>
           	</c:forEach>
            </c:otherwise>
            </c:choose>
            </tbody>
          </table>
          <div class="icon" align="center" style="margin-top: 40px; ">
            <a href="${pageContext.request.contextPath}/noticeform"><i class="bi bi-megaphone" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
            <a href="${pageContext.request.contextPath}/admin/adminFaq"><i class="bi bi-patch-question" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
            <a href="${pageContext.request.contextPath}/admin/memList"><i class="bi bi-person-lines-fill" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
            <a href=""><i class="bi bi-person-exclamation" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
          </div>
    </div>
    
    <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    <script>
    
    </script>
    
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>