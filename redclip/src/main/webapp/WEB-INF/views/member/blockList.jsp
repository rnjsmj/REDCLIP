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
    <title>차단 유저 목록</title>
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
        #blockList {
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
          <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
          <li class="breadcrumb-item active" aria-current="page">차단회원 관리</li>
        </ol>
    </nav>
     <!-- 탭 클릭 시 비동기식 요청으로 화면 전환 -->
     <div class="tab">
        <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">내 정보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">차단 목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">내가 쓴 글</a>
            </li>
          </ul>
    </div>
    <div id="content">

        <h3 id="title">차단 유저 관리</h3>

        <table class="table" id="blockList">
            <thead>
                <tr>
                    <th>선택</th>
                    <th>차단한 회원</th>
                    <th>차단한 날짜</th>
                </tr>
            </thead>
            <tbody>
                <!-- 반복문으로 회원 아이디와 일치하는 레코드를 전부 출력-->
                 <tr>
                    <td><div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      </div></td>
                      <td>blockuser3</td>
                      <td>2024-06-26</td>
                 </tr>
            </tbody>
        </table>
        <button type="button" id="btn-none" class="btn btn-success">차단해제</button>
    </div>
    <footer>
        <!-- 푸터 영역 -->
    </footer>
</body>
</html>