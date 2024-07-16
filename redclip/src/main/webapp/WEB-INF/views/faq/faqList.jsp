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
            width: 1200px;
            margin-bottom: 20px;
            margin : 0 auto;
        }

        #title {
             margin: 30px auto; 
             padding: 0 350px;
        }
        
        #accordionExample {
             width: 1200px;
             margin: 0 auto;
             margin-bottom : 100px;
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
        <li class="breadcrumb-item active" aria-current="page">FAQ 목록</li>
      </ol>
  </nav>
    <div id="content">

        <h3 id="title">자주 묻는 질문</h3>

        <div class="tab">
            <ul class="nav nav-pills">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">전체</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">회원</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">포인트</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">기타</a>
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
	      
	           <div id="collapse-${ faq.faqNo }" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
	              <div class="card-body">
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