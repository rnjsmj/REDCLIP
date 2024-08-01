<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <style>



body {
 font-family: "Noto Sans KR", sans-serif !important;
}

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
  <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
  <label for="inputEmail" class="sr-only">아이디</label>
  <input type="text" id="userId" name="userId" class="form-control" placeholder="ID입력" required autofocus>
  <label for="inputPassword" class="sr-only">패스워드</label>
  <input type="password" id="userPwd" name="userPwd" class="form-control" placeholder="PW입력" required>
  <div class="checkbox mb-3">
    <label>
         <input type="checkbox" id="remember-me" name="remember-me" value="on">로그인 유지하기
    </label>
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>

  <button class="btn btn-custom kakao-button" type="button" id="kakaoLogin" hidden>
    <img src="" alt="카카오 로그인" class="icon">
    <span class="btn-text">카카오 로그인</span>
  </button>
  	<c:if test="${ not empty alertMsg }">
         <script>alert("${ alertMsg }")</script>
         <c:remove var="alertMsg" scope="session" />
   </c:if>
<script>
    $(() => {
        $('#kakaoLogin').click(() => {
            location.href = 'https://kauth.kakao.com/oauth/authorize?' +
                'client_id=dd2c51ceb08c2d3fd9f505935aa18931' +
                '&redirect_uri=http://localhost/redclip/member/oauth' +
                '&response_type=code' +
                '&scope=profile_nickname,profile_image';
        });
    });
</script>



	
  <button class="btn btn-custom naver-button" type="button" hidden>
    <img src="" alt="네이버 로그인" class="icon">
    <span class="btn-text">네이버 로그인</span>
  </button>

  <div class="link-container">
    <a href="#" data-toggle="modal" data-target="#findIdModal">아이디 찾기</a>
    <span>|</span>
    <a href="#" data-toggle="modal" data-target="#findPwModal">비밀번호 찾기</a>
    <span>|</span>
    <a href="#">회원가입</a>
  </div>
</form>
<!-- 아이디찾기 모달 시작 -->
  <div class="modal fade" id="findIdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModal" aria-hidden="true">
      <div class="modal-dialog modal-md" role="document">
          <div class="modal-content">
              
              <div class="modal-header">
                  <h5 class="modal-title" id="emailModalLabel">아이디 찾기</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
              
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
 <!--아이디찾기 결과창 모달 -->
<div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
        
            <div class="modal-header">
                <h5 class="modal-title" id="resultModalLabel">아이디 찾기 결과</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                
            </div>
            <div class="modal-body" id="resultModalBody">
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="findAfterLongin">로그인</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<!-- 결과 모달 끝 -->
<!--  비밀번호 찾기 모달 -->
<div class="modal fade" id="findPwModal" tabindex="-1" role="dialog" aria-labelledby="findPwModal" aria-hidden="true">
      <div class="modal-dialog modal-md" role="document">
          <div class="modal-content">
              
              <div class="modal-header">
                  <h5 class="modal-title" id="emailModalLabel">비밀번호 찾기</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
              
              <div class="modal-body">
                  <div class="form-group">
                      <div class="input-group">
                          <input type="text" class="form-control" placeholder="아이디입력" id="inputId" name="">
                      </div>
                      <div class="input-group">
                      <input type="text" class="form-control" placeholder="이메일입력" id="inputEmail" name="">
                      </div>
                  </div>
                  <button type="button" class="btn btn-secondary " id="searchPw">검색</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              </div>
          </div>
      </div>
  </div>
 <!-- 비밀번호찾기 모달끝  -->
 <!-- 비밀번호찾기 결과창 모달 -->
 <div class="modal fade" id="resultPwModal" tabindex="-1" role="dialog" aria-labelledby="resultPwModal" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
        
            <div class="modal-header">
                <h5 class="modal-title" id="resultPwModalLabel">비밀번호 찾기 결과</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                
            </div>
            <div class="modal-body" id="resultPwModalBody">
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="findAfterRecovery" style="display:none">새 비밀번호 변경</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
 <!-- 비밀번호찾기 결과창 모달 끝 -->
 <!-- 비밀번호 변경 모달창 시작 -->
 <div class="modal fade" id="recoveryPwModal" tabindex="-1" role="dialog" aria-labelledby="recoveryPwModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
        
            <div class="modal-header">
                <h5 class="modal-title" id="recoveryPwModalLabel">비밀번호 변경</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <div class="input-group">
                        <input type="password" class="form-control" placeholder="새 비밀번호 입력" id="newPassword" name="newPassword">
                    </div>
                    <div class="input-group">
                        <input type="password" class="form-control" placeholder="새 비밀번호 확인" id="confirmPassword" name="confirmPassword">
                    </div>
                </div>
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="updatePassword">변경</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
 <!-- 비밀번호 변경 모달창 끝끝끝 -->
<script>
// 아이디 찾기 스크립트
$(() => {
    const $inputName = $('#inputName');
    const $inputTel = $('#inputTel');
    const $searchId = $('#searchId');
    const $resultModal = $('#resultModal');
    const $resultModalBody = $('#resultModalBody');
    const $findIdModal = $("#findIdModal");
    const $findAfterLongin = $('#findAfterLongin');
    let resp = "";
    
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
                    $resultModalBody.html("회원님의 ID는 " + '<strong style="color: green;">' + response + '</strong>' + " 입니다."); 
                    $findIdModal.modal('hide');
                    $resultModal.modal('show');
                    resp = response;
                },
                error: function () {
                    alert('오류임!!');
                }
            });
        }
    });
    
    $findAfterLongin.click(() => {
        $('#userId').val(resp);
    });
});

// 비밀번호 찾기 스크립트
$(() => {
    const $inputId = $('#inputId');
    const $inputEmail = $('#inputEmail');
    const $searchPw = $('#searchPw');
    const $resultPwModal = $('#resultPwModal');
    const $resultPwModalBody = $('#resultPwModalBody');
    const $findPwModal = $("#findPwModal");
    const $findAfterRecovery = $('#findAfterRecovery');
    const $recoveryPwModal = $('#recoveryPwModal');
    const $newPassword = $('#newPassword');
    const $confirmPassword = $('#confirmPassword');
    const pattern = /^[a-z0-9]{5,12}$/;
    
    $searchPw.click(() => {
        if ($inputId.val() !== null && $inputEmail.val() !== null) {
            $.ajax({
                url: 'member/searchPw',
                type: 'GET',
                data: {
                    userId: $inputId.val(),
                    email: $inputEmail.val()
                },
                success: response => {
                    $resultPwModalBody.html(response);
                    $findPwModal.modal('hide');
                    $resultPwModal.modal('show');
                    if(response === "해당회원의 정보가 존재합니다.") {
                        $findAfterRecovery.show();
                    } else {
                        $findAfterRecovery.hide();
                    }
                },
                error: function () {
                    alert('오류임 똥멍청이야!!');
                }
            });
        }
    });

    $findAfterRecovery.click(() => {
        $resultPwModal.modal('hide');
        $recoveryPwModal.modal('show');
    });

    $('#updatePassword').click(() => {
        if (pattern.test($newPassword.val()) && $newPassword.val() === $confirmPassword.val()) {
            $.ajax({
                url: 'member/changePw',
                type: 'GET',
                data: { 
                    userPwd: $confirmPassword.val(),
                    userId: $inputId.val()
                },
                success: response => {
                    location.href = 'loginform';
                    alert('비밀번호 변경에 성공하였습니다.');
                },
                error: function() {
                    alert('오류래용 메롱메롱');
                }
            });
        } else if (!pattern.test($newPassword.val())) {
            alert('비밀번호는 영문,숫자를 사용하여 5~12자리로 입력해주세용');
        } else if ($newPassword.val() !== $confirmPassword.val()) {
            alert('비밀번호 확인이 일치하지 않습니다.');
        }
    });
});
</script>


</body>
</html>
