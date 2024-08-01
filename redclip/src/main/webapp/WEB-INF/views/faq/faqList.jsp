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
    <title>FAQ</title>
    <style>
    
      body {
        margin: 30px; 
        margin-left: 340px;
      }
		
      .tab {
            width: 1115px;
            margin-bottom: 20px;
            margin : 0 auto;
        }

        #title {
             margin: 100px auto;
             margin-bottom:65px;
             padding: 0 350px;
        }
        
        #accordionExample {
             width: 1115px;
             margin: 0 auto;
             margin-bottom : 100px;
            }

        #btn-none {
            float: right;
            margin-right: 330px;
         }
		.breadcrumb {
        background-color: transparent;
        padding: 0;
    }
    </style>
</head>
<body>
     <!-- 헤더 영역-->
     <header>
        <jsp:include page="../common/header.jsp" />
    </header>
    <div id="content" style="width:1115px; text-align: center; margin: 0 auto; padding: 0 auto;">
		  	<nav aria-label="breadcrumb">
	        <ol class="breadcrumb">
	            <img src="/redclip/resources/img/house-door-fill.svg" style="margin-right: 4px" />
	            <li class="breadcrumb-item"><a href="/redclip">홈</a></li>
	            <li class="breadcrumb-item"><a href="/redclip/faq">FAQ 목록</a></li>
	        </ol>
	    </nav>
        <h3 id="title">자주 묻는 질문</h3>

        <div class="tab">
            <ul class="nav nav-pills">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" >전체</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">회원</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">포인트</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">시스템</a>
                  </li>
              </ul>
       	 </div>
        <c:choose>
        <c:when test="${ empty list }">
        	<div align="center">FAQ 목록이 존재하지 않습니다.</div>
        </c:when>
       
        <c:otherwise>
        <div class="accordion" id="accordionExample">
         <c:forEach items="${ list }" var="faq">
            <div class="card">
              <div class="card-header" id="headingOne">
              	  <h2 class="mb-0">
	                  <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse-${ faq.faqNo }" aria-expanded="true" >
	                    [${ faq.faqType }] ${ faq.question }
	                  </button>
	              </h2>
	           </div>
	      
	           <div id="collapse-${ faq.faqNo }" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample" style="text-align: right;">
	              <div class="card-body" style="text-align: left;">
	                  ${ faq.answer }
	              </div>
	          	</div>
	          </div>
	          	</c:forEach>
	    </div>
	    </c:otherwise>
	    </c:choose>
    </div>
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>