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
        <!-- 메뉴바 -->
        <nav class="menuBar"></nav>
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
                    <th>선택</th>
                    <th>제목</th>
                    <th>아이디</th>
                    <th>신고일시</th>
                    <th>누적횟수</th>
                </tr>
            </thead>
            <tbody>
                <jsp:include page="../common/header.jsp" />
                 <tr>
                    <td><div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      </div></td>
                      <td>신고하묘</td>
                      <td>reportUser1</td>
                      <td>2024-07-03 21:55</td>
                      <td>2</td>
                 </tr>
                 <tr>
                    <td><div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      </div></td>
                      <td>신고요</td>
                      <td>reportUser2</td>
                      <td>2024-07-03 20:25</td>
                      <td>4</td>
                 </tr>
                 <tr>
                    <td><div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      </div></td>
                      <td>신고합니다</td>
                      <td>reportUser3</td>
                      <td>2024-07-03 10:43</td>
                      <td>1</td>
                 </tr>
            </tbody>
        </table>
        <button id="btn-none" class="btn btn-success">활동정지</button>
    </div>
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>