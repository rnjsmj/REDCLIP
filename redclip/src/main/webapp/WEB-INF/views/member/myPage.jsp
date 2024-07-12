<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
<style>
    .modal-body { line-height: 2rem; }

        body {
        	width:100%;
        	height:auto;
            margin: 20px;
            line-height: 1.6;
            height: auto;
        }

        .tab {
            width: 1200px;
            margin: 0 auto;
            margin-top: 50px;
        }
        
        #title {
        	margin: 30px; 
            margin-left: 340px;
            }

		#content {
			width:100%;
			height: auto;
			margin-bottom: 300px;
    		margin-top: 100px;
			}
       
        #updateForm {
             margin: 0 auto; 
             width: 1200px;
             margin-top: 30px;
            }
        
        #changeName {
        	width: 100px;
        	height: 100px;
        	
        }

        #buttons {
        	float: right;
            margin-top: 60px;
         }

         #delete-btn {
            margin-top: 80px;
        }
        
        #pointbar {
        	margin-top: 40px;
        }
        
        
</style>
</head>
<body>
    <header>
		<jsp:include page="../common/header.jsp"></jsp:include>
    </header>
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
          <li class="breadcrumb-item active" aria-current="page">회원정보 수정</li>
        </ol>
    </nav>
    <!-- 탭 클릭 시 비동기식 요청으로 화면 전환 -->
    <div class="tab">
        <ul class="nav nav-tabs">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">내 정보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="bolockList">차단 목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="myProduct">내가 쓴 글</a>
            </li>
          </ul>
    </div>
    <div id="content">
    
    <h3 id="title">회원정보 수정</h3>
    
        <div id="updateForm">
            <div>
                <div class="userImg">
                	<div id="changeName">
						<img alt="프로필 사진" src="">
					</div>
					<input type="file" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
				</div>
                    
                    <label for="userId">* ID </label><br>
                    <input type="text" class="form-control" value="${ sessionScope.loginUser.userId }" id="userId"  neme="userId" aria-label="Disabled input example" disabled readonly> <br>
                    
                    <input type="hidden" value="${ sessionScope.loginUser.userPwd }" id="userPwd"  neme="userPwd"> <br>

                    <label for="userName">* Name : </label>
                    <input type="text" class="form-control" id="userName" value="${ sessionScope.loginUser.userName }" name="userName" required> <br>

                    <label for="nickname">* Nickname : </label>
                    <input type="text" class="form-control" id="nickname" value="${ sessionScope.loginUser.nickname }" name="nickname" required> <br>

                    <label for="email"> &nbsp; Email : </label>
                    <input type="email" class="form-control" id="email" value="${ sessionScope.loginUser.email }" name="email"> <br>

                    <label for="tel"> &nbsp; Tel : </label>
                    <input type="tel" class="form-control" id="tel" value="${ sessionScope.loginUser.tel }" name="tel"> <br>

                    <label for="postCode"> &nbsp; PostCode : </label>
                    <input type="text" class="form-control" id="postCode" value="${ sessionScope.loginUser.postCode }" name="postCode"> <br>
                    
                    <label for="address"> &nbsp; Address : </label>
                    <input type="text" class="form-control" id="address" value="${ sessionScope.loginUser.address }" name="address">
                    
                    <label for="villageCode"> &nbsp; VillageCode : </label>
                    <input type="number" class="form-control" id="villageCode" value="${ sessionScope.loginUser.villageCode }" name="villageCode">

                    <!-- 자스 사용 -> aria-valuenow 값에 따라 progress-bar에 style 주기 -->
                    <div id="pointbar">다음 등급까지
	                    <div class="progress"  id="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" >
	                        <div class="progress-bar" style="width: 0%"></div>
	                    </div>
                    </div>
               
				<div id="buttons">
                    <button type="button" id="userUpdate" class="btn btn-success" onclick="update();">수정</button>
                    <button type="reset" class="btn btn-secondary" onclick="location.reloard">취소</button><br>
                    <button type="button" id="delete-btn" class="btn btn-secondary" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
				</div>
              </div>
            </div>
        </div>
	<footer>
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
    
    <!--회원 탈퇴 시 띄워줄 모달창 -->
    <div class="modal fade" id="deleteForm">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">회원탈퇴</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div>
                	<!-- 같은 조건의 pwd 값을 가진 모든 유저가 삭제 될 수 있으므로 행을 식별할 수 있는 값을 추가 -->
                	<input type="hidden" value="${ sessionScope.loginUser.userId }" id="loginUserId" name="userId">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div align="left">
                            회원 정보 삭제<br><br>
                            
                            회원 탈퇴와 함께 RED CRIP 에 등록된 모든 개인정보는 삭제, 폐기 처리되며 복구되지 않습니다.<br>
                            
                            단, 상법 및 '전자상거래 등에서 소비자 보호에 관한 법률' 등 관련 법령의 규정에 의하여 다음과 같이 ‘거래 관련 관리의무 관계 확인’ 등을 이유로 일정 기간 보관됩니다.<br>
                             - 거래에 관한 기록 : 5년<br>
                             - 소비자의 불만 또는 분쟁 처리에 관한 기록 : 3년<br>
                             - 설문조사, 이벤트 등 일시적 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등의 종료 시까지<br>
                            
                            회원 탈퇴와 함께 RED CRIP 에 등록된 모든 개인정보가 삭제됨에 따라 point 역시 함께 소멸됩니다.<br><br><br>

                            <strong>※ 탈퇴 시 회원님의 RED CRIP 이용정보가 삭제되며 복구가 불가능하오니 신중히 선택하시기 바랍니다.</strong><br>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                            <label class="form-check-label" for="flexCheckDefault">
                              모든 내용을 숙지하였으며 회원 탈퇴에 동의합니다.
                            </label>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                    	<button type="button" id="delete" class="btn btn-secondary" onclick="changeStatus();">탈퇴하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

   <script>
	
     	//회원정보 수정
   		function update() {
   			
   			var updateData = {
   					"userId" : $('#userId').val(),
   					"userName" : $('#userName').val(),
   					"nickname" : $('#nickname').val(),
   					"email" : $('#email').val(),
   					"tel" : $('#tel').val(),
   					"postCode" : $('#postCode').val(),
   					"address" : $('#address').val(),
   					"villageCode" : $('#villageCode').val(),
   					
   			};
   			
   			 //console.log(updateData);

   			$.ajax({
   				url : 'member/',
   				type : 'put',
   				data : JSON.stringify(updateData),
   				contentType : 'application/json',
   				success : function(result) {
   					
   					//console.log(result);
   					
   						alert('회원 정보가 수정되었습니다.');
   						
   					},
   				error : function(error) {
   					alert('회원 정보 수정에 실패했습니다.');
   				}
   			});
   		};

   		//체크박스 체크 여부 확인(시간 남으면 구현)
   		//프로필 이미지 사진 바뀌면 미리 보이는 기능(시간 남으면 구현)
   		
   		
   		//회원 탈퇴
   		function changeStatus() {
   			
   			const userId = $('#loginUserId').val();
   			
   			//console.log(userId);
   			
   			$.ajax({
   				url: 'member/' + userId,
   				type: 'put',
   				success : result => {
   					
   					alert('회원 탈퇴에 성공했습니다.');
   				},
   				error : (e) => {
   					
   					//console.log("요청 실패");
   					alert('회원 탈퇴에 실패했습니다.');
   				}
   			});
   			
   		};
		
    </script>
</body>
</html>