<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>가격 예시 · Bootstrap v4.6</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
    <!-- Bootstrap 핵심 CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
   
      @media (min-width: 768px) {
        html {
          font-size: 16px;
        }
      }

      .container {
        max-width: 960px;
      }

      .pricing-header {
        max-width: 700px;
      }

      .card-deck .card {
        min-width: 220px;
      }

      .navbar {
        display: flex;
        justify-content: space-between; 
        align-items: center;
        width: 100%;
      }

      .navbar h5 {
        margin: 0;
        width: auto; 
      }

      .btnbox {
        margin-left: auto; 
        display: flex;
        gap: 10px;
      }
      .my-2{
        margin-left:20px ;
      }
    </style>
</head>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm navbar">
   <h5 class="my-0 font-weight-normal"><a href="${requestScope.contextPath}">홈</a></h5>

   <nav class="my-2 my-md-0 mr-md-3">
      <a class="p-2 text-dark" href="${pageContext.request.contextPath}/barters">물물교환</a>
      <a class="p-2 text-dark" href="#">체팅</a>
      <a class="p-2 text-dark" href="#">공지사항</a>
      <a class="p-2 text-dark" href="#">FAQ</a>
   </nav>
   <c:choose>
   <c:when test="${empty sessionScope.loginUser }">
   <nav class="btnbox">
      <a class="btn btn-outline-primary" href="joinform" id="btn-sign">회원가입</a>
      <a class="btn btn-outline-primary" href="loginform" id="btn-sign">로그인</a>
   </nav>
   </c:when>
   <c:otherwise>
    <nav class="btnbox">
      <a class="btn btn-outline-primary" href="myPage" id="btn-sign">마이페이지</a>
      <a class="btn btn-outline-primary" href="#" id="btn-sign">로그아웃</a>
   </nav>
   </c:otherwise>
   </c:choose>
</div>    
</html>