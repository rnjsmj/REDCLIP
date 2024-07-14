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
    <title>내가 쓴 글</title>
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
        
        #content {
        	width:100%;
        	height: auto;
        	margin-bottom: 300px;
   			margin-top: 70px;
        }

        #title {
             margin: 30px; 
             margin-left: 340px;
        }

        #productList {
             margin: 0 auto; 
             width: 1200px;
        }

        #buttons {
            float: right;
            margin-right: 330px;
            margin-top: 20px;
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
          <li class="breadcrumb-item"><a href=" myPage">마이페이지</a></li>
          <li class="breadcrumb-item active" aria-current="page">내가 쓴 글</li>
        </ol>
    </nav>
     <!-- 탭 클릭 시 비동기식 요청으로 화면 전환 -->
     <div class="tab">
        <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/member/myPage">내 정보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/member/bolockList/${ sessionScope.loginUser.userId }">차단 목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">내가 쓴 글</a>
            </li>
          </ul>
    </div>
    <div id="content">

        <h3 id="title">내가 쓴 글 관리</h3>

        <table class="table" id="productList">
            <thead>
                <tr>
                    <th>선택</th>
                    <th>게시글 제목</th>
                    <th>작성일</th>
                    <th>거래상태</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <!-- 반복문으로 회원 아이디와 일치하는 레코드를 전부 출력-->
                <c:choose>
	                <c:when test="${ empty list }">
	                	<td colspan="5" align="center">글이 존재하지 않습니다.</td>
	                </c:when>
                <c:otherwise>
	                <c:forEach items="${ list }" var="barter">
		                 <tr>
		                    <td>
		                    <div class="form-check">
		                    	<input type="hidden" value="${barter.barterNo }" />
		                        <input class="form-check-input" type="checkbox" value=""  id="flexCheckDefault">
		                      </div></td>
		                      <td><a id="barterNo" href="${pageContext.request.contextPath}/barters/${ barter.barterNo }">${ barter.barterName }</a></td>
		                      <td>${ barter.barterDate }</td>
		                      <td>${ barter.barterStatus }</td>
		                      <td>${ barter.hit }</td>
		                 </tr>
	                 </c:forEach>
                 </c:otherwise>
                 </c:choose>
            </tbody>
        </table>
        <div id="buttons">
          <button id="btn-status" class="btn btn-success" onclick="upStatus(barterNo);">거래상태 변경</button> | <button id="btn-delete" class="btn btn-secondary">삭제</button>
        </div>
    </div>
    <script>
    
	//거래 상태 변경    
	
	/*
	function upStatus(barterNo) {
		
		
	}
    */
    //글 삭제
    
    </script>
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>