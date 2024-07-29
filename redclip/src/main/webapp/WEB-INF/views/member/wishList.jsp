<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
 body {
        	width:100%;
        	height:auto;
            margin: 20px;
            line-height: 1.6;
            height: auto;
        }

        .tab {
            width: 1200px;
            margin: 0 auto;
            margin-top: 50px;
        }
        
        #title {
        	margin: 30px; 
            margin-left: 340px;
            }

		#content {
			width:100%;
			height: auto;
			margin-bottom: 300px;
    		margin-top: 100px;
			}
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <!-- breadcrumb -->
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <img src="/redclip/resources/img/house-door-fill.svg" style="margin-right: 4px" />
                    <li class="breadcrumb-item"><a href="/redclip">홈</a></li>
                    <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
                    <li class="breadcrumb-item active" aria-current="page">위시리스트</li>
                </ol>
            </nav>
           <div class="tab">
		        <ul class="nav nav-tabs">
		            <li class="nav-item">
		              <a class="nav-link" href="${pageContext.request.contextPath}/member/myPage">내 정보</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" href="${pageContext.request.contextPath}/member/blockList/${ sessionScope.loginUser.userId }">차단 목록</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" href="${pageContext.request.contextPath}/member/myProduct/${ sessionScope.loginUser.userId  }">내가 쓴 글</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" aria-current="page" href="#">찜한 상품</a>
		            </li>
		          </ul>
		    </div>
           <div id="content">
           
           <h3 id="title">찜 목록</h3>
           
           <div id="wishList">
           <c:when test="${ empty list }">
           		<div>찜한 목록이 존재하지 않습니다.</div>
           </c:when>
           <c:otherwise>
           <c:forEach items="${ list }" var="barter">
           <div class="card" style="width: 18rem;">
			  <img src="${ barter.barterFileName }" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">${ barter.barterName }</h5>
			    <p class="card-text">${ barter.barterContent }</p>
			    <a href="/barters/wish" class="btn btn-primary">♥</a>
			  </div>
			</div>
           </c:forEach>
           </c:otherwise>
           </div>
           
           </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
