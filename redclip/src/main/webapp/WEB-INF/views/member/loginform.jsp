<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/signin.css" rel="stylesheet">
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

      .btn-custom {
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 10px 20px;
        font-size: 18px;
        border: none;
        border-radius: 0.25rem;
        width: 100%;
        margin-bottom: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
      }

      .kakao-button {
        background-color: #FEE500;
        color: #3C1E1E;
        margin-top: 10px; /* 상단 여백 추가 */
      }

      .kakao-button:hover {
        background-color: #E5CC00;
        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
      }

      .naver-button {
        background-color: #03C75A;
        color: #FFFFFF;
      }

      .naver-button:hover {
        background-color: #02B14F;
        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
      }

      .icon {
        margin-right: 10px;
        width: 24px; /* 이미지 크기를 조정 */
        height: 24px;
      }

      .btn-text {
        flex: 1;
        text-align: center;
      }
      .link-container {
        margin-top: 10px;
        display: flex;
        justify-content: center;
        gap: 10px;
      }

      .link-container a {
        color: #333;
        text-decoration: none;
      }

      .link-container a:hover {
        color:blue
      }
    </style>
</head>
<body class="text-center">
    
<form class="form-signin" action="member/login" method="post">
  <img class="mb-4" src="../assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
  <label for="inputEmail" class="sr-only">아이디</label>
  <input type="text" id="userId" name="userId" class="form-control" placeholder="ID입력" required autofocus>
  <label for="inputPassword" class="sr-only">패스워드</label>
  <input type="password" id="userPwd" name="userPwd" class="form-control" placeholder="PW입력" required>
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> 아이디 저장하기
    </label>
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>

  <button class="btn btn-custom kakao-button" type="submit">
    <img src="image/kakaologo.png" alt="카카오 로그인" class="icon">
    <span class="btn-text">카카오 로그인</span>
  </button>
  
  <button class="btn btn-custom naver-button" type="submit">
    <img src="image/naverlogo.png" alt="네이버 로그인" class="icon">
    <span class="btn-text">네이버 로그인</span>
  </button>
   
  <div class="link-container">
    <a href="#">아이디 찾기</a>
    <span>|</span>
    <a href="#">비밀번호 찾기</a>
    <span>|</span>
    <a href="#">회원가입</a>
  </div>
</form>

  </body>
</html>