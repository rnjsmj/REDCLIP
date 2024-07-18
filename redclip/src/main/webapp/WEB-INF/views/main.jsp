<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>메인페이지</title>
	<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
	<style>
	.content{
	 width :1200px;
	 height : 1000px !important;
	 margin : auto;
	}
	</style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <div class="content">
  <h1 style="color:red; font-size:80px; text-align:center">
  	<img src="https://i.pinimg.com/736x/16/04/d2/1604d2c16cf7eb32ffbfff35f2c7f799.jpg" />
  	<p>지켜보고있다!</p>
  </h1>
  </div>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
