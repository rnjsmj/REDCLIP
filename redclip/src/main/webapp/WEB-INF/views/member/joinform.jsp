<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .content {
            width: 50%;
            margin: auto;
        }

        .innerOuter {
            border: 1px solid lightgray;
            width: 80%;
            margin: auto;
            padding: 5% 10%;
            background-color: white;
            text-align: center;
        }

        #userId, #userPwd, #checkPwd, #userName, #tel,
         #email, #postcode, #address1, #address2, #nickName {
            width: 350px;
        }

        .form-group.rel {
            width: 500px;
            margin: 0px auto;
            position: relative !important;
        }

        .form-control {
            display: inline-block;
            margin: 0 auto;
            margin-bottom: 10px;
        }

        .btns {
            text-align: center;
        }

        .joinbtn, .resetbtn {
            display: block;
            width: 350px;
            margin: 0 auto;
            margin-bottom: 10px;
        }

        #checkId {
            position: absolute;
            width: 95px;
            height: 40px !important;
            top: 0;
            left: 435px;
        }

        #checkNickName {
            position: absolute;
            width: 95px;
            height: 40px !important;
            margin-left: 10px;
            top: 0;
            left: 425px;
        }

        #findaddr {
            position: absolute;
            width: 95px;
            height: 40px !important;
            margin-left: 10px;
            top: 0;
            left: 425px;
        }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>회원가입</h2>
            <br>

            <form action="" method="post">
                <div class="form-group rel">
                    <input type="text" class="form-control" id="userId" placeholder="아이디" name="" required>
                    <button type="button" class="btn btn-outline-secondary" id="checkId">중복체크</button>
                </div>
				
				<div class="form-group">
                    <input type="password" class="form-control" id="userPwd" placeholder="비밀번호" name="" required>
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" id="checkPwd" placeholder="비밀번호확인" required>
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" id="userName" placeholder="이름" name="" required>
                </div>

                <div class="form-group rel">
                    <input type="text" class="form-control" id="nickName" placeholder="닉네임" name="" required>
                    <button class="btn btn-outline-secondary" type="button" id="checkNickName">중복체크</button>
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" id="email" placeholder="이메일" name="">
                </div>

                <div class="form-group">
                    <input type="tel" class="form-control" id="tel" placeholder="연락처" name="">
                </div>

                <div class="form-group rel">
                    <input type="text" class="form-control" id="postcode" placeholder="우편번호" name="">
                    <button class="btn btn-outline-secondary" type="button" id="findaddr">주소검색</button>
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" id="address1" placeholder="도로명주소" name="">
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" id="address2" placeholder="상세주소" name="">
                </div>

                <div class="buttonwrap">
                    <button type="submit" class="btn btn-primary joinbtn" >회원가입</button>
                    <button type="reset" class="btn btn-secondary joinbtn">초기화</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script>
        $(() => {
            const $idInput = $('#userId');
            const pattern = /^[a-z0-9]{5,12}$/; 
            const $checkId = $('#checkId');

            $checkId.click(() => {
                const userId = $idInput.val();
                if (!pattern.test(userId)) {
                    alert("아이디는 소문자와 숫자를 포함하여 5~12자여야 합니다.");
                    return;
                }
                console.log("AJAX request will send userId:", userId); 
                $.ajax({
                    url: '/check-id',
                    type: 'POST',
                    data: { userId: userId }, //사용자가입력한 아이디값
                    success: function(response) {
                        if (response===Y) {
                            alert("중복된 아이디 입니다. 다른 아이디를 사용해주세요");
                        } else {
                            alert("사용 가능한 아이디 입니다.");
                        }
                    },
                    error: function() {
                        alert('서버와의 통신 중 오류가 발생했습니다.');
                    }
                });

            });
        });
<<<<<<< HEAD
    });
</script>
<!-- 닉네임 유효성 검사후 중복검사  -->
<script>
$(() => {
	const $nickInput = $('#nickName');
	const pattern =/^[가-힣a-zA-Z0-9]{2-10}$/;
	const $checknick = $('#checkNickName')
	
	 $checknick.click(() => {
            const usernick = $nickInput.val();
            if (!pattern.test(usernick)) {
                alert("닉네임은 한글/영문/숫자를 이용하여 2~10 자리로 작성해주세요");
                return;
            }
        
</script>            
</body>
</html>
