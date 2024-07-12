<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Bootstrap JS, Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/signin.css" rel="stylesheet">
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
  .input-group{
   margin-bottom :10px;
  }
</style>
</head>
<body class="text-center">

<form class="form-signin" action="member/login" method="post">
  <img class="mb-4" src="" alt="" width="72" height="72">
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

  <button class="btn btn-custom kakao-button" type="button">
    <img src="" alt="카카오 로그인" class="icon">
    <span class="btn-text">카카오 로그인</span>
  </button>

  <button class="btn btn-custom naver-button" type="button">
    <img src="" alt="네이버 로그인" class="icon">
    <span class="btn-text">네이버 로그인</span>
  </button>

  <div class="link-container">
    <a href="#" data-toggle="modal" data-target="#findIdModal">아이디 찾기</a>
    <span>|</span>
    <a href="#">비밀번호 찾기</a>
    <span>|</span>
    <a href="#">회원가입</a>
  </div>
</form>
<!-- 모달 시작 -->
  <div class="modal fade" id="findIdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModal" aria-hidden="true">
      <div class="modal-dialog modal-md" role="document">
          <div class="modal-content">
              <!-- 모달 헤더 -->
              <div class="modal-header">
                  <h5 class="modal-title" id="emailModalLabel">아이디 찾기</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
              <!-- 모달 본문 -->
              <div class="modal-body">
                  <div class="form-group">
                      <div class="input-group">
                          <input type="text" class="form-control" placeholder="이름 입력" id="inputName" name="a">
                      </div>
                      <div class="input-group">
                      <input type="text" class="form-control" placeholder="전화번호 입력" id="inputTel" name="authCode">
                      </div>
                  </div>
                  <button type="button" class="btn btn-secondary " id="searchId">검색</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              </div>
          </div>
      </div>
  </div>
  
<script>
$(() => {
    const $inputName = $('#inputName');
    const $inputTel = $('#inputTel');
    const $searchId = $('#searchId');

    $searchId.click(() => {
        if ($inputName.val() !== null && $inputTel.val() !== null) {
            $.ajax({
                url: 'member/searchId',
                type: 'GET',
                data: {
                    userName: $inputName.val(),
                    tel: $inputTel.val()
                },
                success: response => {
                    console.log(response);
                },
                error: function () {
                    alert('오류임 똥멍청이야!!');
                }
            });
        }
    });
});
</script>


</body>
</html>
