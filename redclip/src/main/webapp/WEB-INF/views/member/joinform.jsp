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
            width: 400px;
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
            width: 400px;
            margin: 0 auto;
            margin-bottom: 10px;
        }

        #checkId {
            position: absolute;
            width: 95px;
            height: 40px !important;
            top: 0;
            left: 455px;
        }

        #checkNickName {
            position: absolute;
            width: 95px;
            height: 40px !important;
            margin-left: 10px;
            top: 0;
            left: 445px;
        }

        #findaddr {
            position: absolute;
            width: 95px;
            height: 40px !important;
            margin-left: 10px;
            top: 0;
            left: 445px;
        }
        
        #checkEmail{
        	position: absolute;
            width: 95px;
            height: 40px !important;
            margin-left: 10px;
            top: 0;
            left: 445px;
        }
        
           #si{
            width : 400px
           }
        
           #gu, #dong{
            display: inline-block;
          	width : 195px;
          	margin-right : 5px; 
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

            <form action="join" method="post">
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

                <div class="form-group rel">
                    <input type="text" class="form-control" id="email" placeholder="이메일" name="">
                    <button class="btn btn-outline-secondary" type="button" id="checkEmail" hidden>메일인증</button>
                </div>

                <div class="form-group">
                    <input type="tel" class="form-control" id="tel" placeholder="연락처" name="">
                </div>
                
                <!-- 시 구 동 정보가 담긴 selectbox  -->
                <div class="form-group">
                    <select class="form-control " id="si">
                        <option value="">관심지역 선택</option>
                        <option value="1">서울특별시</option>
                        <option value="2">인천광역시</option>
                    </select>
                    <select class="form-control " id="gu" disabled>
                        <option value="">구 선택</option>
                    </select>
                    <select class="form-control " id="dong" disabled>
                        <option value="">동 선택</option>
                    </select>
                </div>
                
				<script>
				  // 시 선택 시 벨류 값을
				$(() => {
				    const $siSelect = $('#si');
				    const $guSelect = $('#gu');
				    const $dongSelect = $('#dong');
				
				    $siSelect.change(() => {
				        const siValue = $siSelect.val();  
						console.log(siValue);
						
				        if (siValue !== null ) {
				            // console.log("시밸류값:", siValue); 
				            $.ajax({
				                url: 'guSelect', 
				                type: 'GET',
				                data: { si: siValue },
				                success: response => {
				                	 console.log(response);
				                	$guSelect.empty().append('<option value="">구 선택</option>');
				                    response.forEach((a) => {
				                    	$guSelect.append('<option value='+a.townCode+'>'+a.townName+'</option>');
				                    });
				                    $guSelect.prop('disabled', false); // 구 셀렉트 박스 활성화
				                },
				                error: function() {
				                    alert('오류임 ㅉㅉ');
				                }
				            });
				        }
				    });
				   
				    $guSelect.change(() => {
				    	 const guValue = $guSelect.val();
				         console.log("선택한구벨류값:", guValue);
				    	if (guValue !== null) {
				    		$.ajax({
					    		url: 'dongSelect',
					    		type: 'GET',
					    		data: { gu: guValue },
					    		success: response => {
					    			console.log(response);
					    			$dongSelect.empty().append('<option value="">동 선택</option>')
					    			response.forEach((a) => {
					    				$dongSelect.append('<option value='+a.villageCode+'>'+a.villageName+'</option>');
					    			});
					    			$dongSelect.prop('disabled', false); // 동 셀렉트 박스 활성화
					    		},
					    		error: function() {
					    			alert('오류임 키키 ');
					    		}
				    		});
				    	}
				    });
				});
				</script>


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

    <!-- 모달 
    <div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="emailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <!-- Modal Header
                <div class="modal-header">
                    <h5 class="modal-title" id="emailModalLabel">이메일 인증</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <!-- Modal body 
                <div class="modal-body">
                    <div class="form-group">
                        <label for="authCode" class="mr-sm-2">인증번호 : </label>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Enter Auth Code" id="authCode" name="authCode">
                            <div class="input-group-append">
                                <button type="button" class="btn btn-primary" id="checkAuthCode">인증</button>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-secondary mt-2" id="resendAuthCode">인증번호 재전송</button>
                </div>

                <!-- Modal footer 
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    -->
    <script>
        // 아이디 중복체크
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
                console.log("콘솔에 잘 찍힘?:", userId); 
                $.ajax({
                    url: 'check-id',
                    type: 'POST',
                    data: { userId: userId }, 
                    success: response => {
                        if (response === 'Y') {
                            alert("중복된 아이디 입니다. 다른 아이디를 사용해주세요");
                        } else {
                            alert("사용 가능한 아이디 입니다.");
                        }
                    },
                    error: function() {
                        alert('오류 발생');
                    }
                });
            });
        });

        // 닉네임 유효성 검사후 중복검사
        $(() => {
            const $nickInput = $('#nickName');
            const pattern = /^[가-힣a-zA-Z0-9]{2,10}$/;
            const $checknick = $('#checkNickName');
            $checknick.click(() => {
                const userNick = $nickInput.val();
                if (!pattern.test(userNick)) {
                    alert("닉네임은 한글/영문/숫자를 이용하여 2~10 자리로 작성해주세요");
                    return;
                }
                console.log("콘솔에 잘 찍힘?:", userNick);
                $.ajax({
                    url: 'check-nick',
                    type: 'POST',
                    data: { userNick: userNick }, 
                    success: response => {
                        if (response === 'Y') {
                            alert("중복된 닉네임 입니다. 다른 닉네임을 사용해주세요");
                        } else {
                            alert("사용 가능한 닉네임 입니다.");
                        }
                    },
                    error: function() {
                        alert('오류 발생');
                    }
                });
            });
        });

    </script>
</body>
</html>
