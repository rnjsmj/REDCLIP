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
	  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
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

            <form action="member/join" method="post" onsubmit="return ccc();">
                <div class="form-group rel">
                    <input type="text" class="form-control" id="userId" placeholder="아이디" name="userId" >
                    <button type="button" class="btn btn-outline-secondary" id="checkId">중복체크</button>
                </div>
				
				<div class="form-group">
                    <input type="password" class="form-control" id="userPwd" name="userPwd"  placeholder="비밀번호" name="" >
                </div>

                <div class="form-group">
                    <input type="password" class="form-control" id="checkPwd" placeholder="비밀번호확인" >
                </div>
                <!-- 비밀번호 확일 일치여부  -->
				<script>
				let pwOk ='N'
				$(()=>{
					const $checkPwd = $('#checkPwd');
					const $userPwd = $('#userPwd')
				    	
					$checkPwd.blur( () => {
						if($checkPwd.val() != $userPwd.val() ){
							alert("비밀번호확인이 일치하지 않습니다.");
							
						}else{
							 pwOk ='Y'
						}
					});
				});
				</script>
                <div class="form-group">
                    <input type="text" class="form-control" id="userName" placeholder="이름" name="userName">
                </div>
                <!-- 이름 정규식패턴   -->
				<script>
				$(()=>{
					const $userName =$('#userName');
					const $pattern = /^[가-힣]{2,30}$/;
					
					$userName.blur(() => {
						if(!$pattern.test($userName.val())){
							alert("이름은 한글 2~10글자 로 작성해주세요");
						}else{
							 nameOk='Y'
						}
					});
					
				});
				
				</script>

                <div class="form-group rel">
                    <input type="text" class="form-control" id="nickName" placeholder="닉네임" name="nickname" >
                    <button class="btn btn-outline-secondary" type="button" id="checkNickName">중복체크</button>
                </div>

                <div class="form-group rel">
                    <input type="text" class="form-control" id="email" placeholder="이메일" name="email">
                    <button class="btn btn-outline-secondary" type="button" id="checkEmail" hidden>메일인증</button>
                </div>

                <div class="form-group">
                    <input type="tel" class="form-control" id="tel" placeholder="연락처" name="tel">
                </div>
                <script>
                $(()=>{
                	const $tel =$('#tel');
                	const $pattern =/^(?=.{12,13}$)01[016789]-\d{3,4}-\d{4}$/;
                	
                	$tel.blur(()=>{
                		if(!$pattern.test($tel.val())){
                			alert("핸드폰번호 양식에 어긋납니다\n(-를 포함한 12~13자리로 입력해주세요)")
                		}else{
                			 telOk='Y'
                		}
                	});
                });
                </script>
                
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
                    <select class="form-control " id="dong" name="villageCode" disabled>
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
				                url: 'member/guSelect', 
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
					    //동 선택값이 널이아니라면 동ok 는 Y값
					    if($dongSelect.val()!=null){
					    	 villageOk = 'Y'
					    }
				    });
				   
				    
				    $guSelect.change(() => {
				    	 const guValue = $guSelect.val();
				         console.log("선택한구벨류값:", guValue);
				    	if (guValue !== null) {
				    		$.ajax({
					    		url: 'member/dongSelect',
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
                    <input type="text" class="form-control" id="postcode" placeholder="우편번호" name="postCode">
                    <button class="btn btn-outline-secondary" type="button" id="findaddr">주소검색</button>
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" id="address1" placeholder="도로명주소" name="addr1">
                </div>

                <div class="form-group">
                    <input type="text" class="form-control" id="address2" placeholder="상세주소" name="addr2">
                </div>
				<script>
			    $(() => {
			        const $findaddr = $('#findaddr');
			        const $postCode =$('#postcode');
			        const $addr1 =$('#address1');
			        const $addr2 =$('#address2');
			        
			        $findaddr.click(() => {//주소찾기 버튼클릭
			            new daum.Postcode({
			                oncomplete: (result) => {
			                	//통합 로딩 방식 : postcode.v2.js 라는 이름의 파일 로딩을 통해 우편번호 서비스를 이용하실 수 있습니다. 카카오 우편번호서비스 공식문서
			                	// oncomplete: 우편번호 찾기가 완료되었을때 실행되는코드를 이후에 작성한다
			                    var addr = '';
			                    var extraAddr = '';
			                    
			                    if (result.userSelectedType === 'R') {//R은 도로명주소를 선택했을때 반환되는 값 
			                        addr = result.roadAddress;
			                    } else {
			                        addr = result.jibunAddress;
			                    }

			                    if (result.userSelectedType === 'R') {
			                        if (result.bname !== '' && /[동|로|가]$/g.test(result.bname)) {
			                            // result.bname이 빈 문자열이 아니고, '동', '로', '가'로 끝나는지 확인
				                        // 법정동명이 있는 경우 '삼성동', '종로', '경복궁가' 등으로 끝나는지 확인
			                            extraAddr += result.bname;
			                            // 추가 주소 변수(extraAddr)에 법정동명을 추가
			                        }
			                        if (result.buildingName !== '' && result.apartment === 'Y') {
			                        	 // result.buildingName이 빈 문자열이 아니고, result.apartment가 'Y'인 경우 (아파트인 경우)
			                            extraAddr += (extraAddr !== '' ? ', ' + result.buildingName : result.buildingName);
			                            // 만약 extraAddr에 이미 동로가 이름이 있다면 쉼표와 함께 건물명을 적음 아니라면 그냥 건물명적음
			                        }
			                        if (extraAddr !== '') {
			                            extraAddr = ' (' + extraAddr + ')';
			                            // extraAddr이 빈 문자열이 아닌 경우 괄호로 감싼다(법정동명, 건물명)
			                        }
			                    } 
			                    $('#postcode').val(result.zonecode);
			                    //postcode의 값을 result.zonecod
			                    $('#address1').val(addr + extraAddr);
			                    //address1의 값을 addr+extraAddr로 함
			                }
			            }).open(); //우편번호 검색창을여는거
			        });
			        if ($postCode.val() !== null && $addr1.val() !== null && $addr2.val() !== null){
			        	 addrOk='Y'
			        }
			       
			    });
			</script>


                <div class="buttonwrap">
                    <button type="submit" class="btn btn-primary joinbtn" id="joinbtn" >회원가입</button>
                    <button type="reset" class="btn btn-secondary joinbtn">초기화</button>
                </div>
               <script>
			               let idOkay = 'N';
			               let nickOk = 'N';
						  
						function ccc(){
							console.log("이거됨?");
				        if (idOkay !== 'Y') {
				            alert("아이디 중복 체크를 해주세요.");
				           return false;
				        } else if (pwOk !== 'Y') {
				            alert("비밀번호가 일치하지 않습니다.");
				        	return false;
				        } else if (nameOk !== 'Y') {
				            alert("이름을 확인해주세요.");
				        	return false ;
				        } else if (nickOk !== 'Y') {
				            alert("닉네임 중복 체크를 해주세요.");
				        	return false;
				        } else if (telOk !== 'Y') {
				            alert("핸드폰번호를 확인해주세요.");
				        	return false;
				        } else if (addrOk !== 'Y') {
				            alert("주소를 확인해주세요.");
				        	return false;
				        }
				        return true;
					}
				</script>

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
                    url: 'member/check-id',
                    type: 'POST',
                    data: { userId: userId }, 
                    success: response => {
                        if (response === 'Y') {
                            alert("중복된 아이디 입니다. 다른 아이디를 사용해주세요");
                        } else {
                            alert("사용 가능한 아이디 입니다.");
                             idOkay ='Y'
                        }
                        console.log("아이디오케?",idOkay);
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
                    url: 'member/check-nick',
                    type: 'POST',
                    data: { userNick: userNick }, 
                    success: response => {
                        if (response === 'Y') {
                            alert("중복된 닉네임 입니다. 다른 닉네임을 사용해주세요");
                        } else {
                            alert("사용 가능한 닉네임 입니다.");
                            nickOk='Y'
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
