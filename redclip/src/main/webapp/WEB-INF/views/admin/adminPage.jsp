<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

  .btn-success {
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
                <th scope="col"></th>
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
           		
           		<td id="reportTitle">${ report.reportTitle }</td>
           		<td id="reportType">${ report.reportType }</td>
           		<td id="reportedId">${ report.reportedId }</td>
           		<td id="reportDate">${ report.reportDate }</td>
           		<fmt:formatDate value="${report.reportDate}" pattern="yyyy-MM-dd" var="formattedReportDate" />
	            ${formattedReportDate}
	
	            <%-- 신고일과 현재 날짜의 차이를 계산 --%>
	            <fmt:parseDate value="${ report.reportDate }" pattern="yyyy-MM-dd" var="reportDateParsed" />
	            <fmt:parseDate value="${ currentDate }" pattern="yyyy-MM-dd" var="currentDateParsed" />
	            <c:set var="differenceInMilliseconds" value="${currentDateParsed.time - reportDateParsed.time}" />
	            <c:set var="differenceInDays" value="${differenceInMilliseconds / (1000 * 60 * 60 * 24)}" />
	
	            <%-- 하루 미만 경과한 경우 배지 표시 --%>
	            <c:if test="${differenceInDays < 1}">
	                <td><span class="badge text-bg-secondary" style="color:red">New</span></td>
	            </c:if>
           		
           		
           	</tr>
           	</c:forEach>
            </c:otherwise>
            </c:choose>
            </tbody>
          </table>
          <a href="reportList" style="float: right; margin-right: 300px;">더 보기</a>
          <div class="icon" align="center" style="margin-top: 40px; ">
            <a href="${pageContext.request.contextPath}/noticeform"><i class="bi bi-megaphone" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
            <a href="${pageContext.request.contextPath}/admin/adminFaq"><i class="bi bi-question" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
            <a href="${pageContext.request.contextPath}/admin/memList"><i class="bi bi-person-lines-fill" style="margin: 25px; font-size: 8rem; color: rgb(0, 0, 0);"></i></a>
          </div>
    </div>
    <script>
    
    const now = new Date();
    
    
    
    console.log(createDate);
    console.log(now);
    
    </script>
	<!-- Button trigger modal -->
	<!-- <button type="button" class="btn btn-success" data-toggle="modal" data-target="#adminModal">
	  관리자 계정 생성
	</button>
	
	Modal
	<div class="modal fade" id="adminModal" tabindex="-1" aria-labelledby="adminModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">노예 양성소</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
			  </div>
			  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			 <div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
			  </div>
			  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			 <div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="inputGroup-sizing-default">비밀번호 확인</span>
			  </div>
			  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">양성</button>
	      </div>
	    </div>
	  </div>
	</div> -->
    <script>
    
    </script>
    
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>