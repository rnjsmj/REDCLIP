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
    <title>회원 목록</title>
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
        #statusList {
             margin: 0 auto; 
             width: 1200px;
             margin-bottom: 50px;
             text-align: center;
            }

    </style>
</head>
<body>
    <!-- 헤더 영역-->
    <header>
        <jsp:include page="../common/header.jsp" />
    </header>
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">관리자 페이지</a></li>
        <li class="breadcrumb-item active" aria-current="page">회원관리</li>
      </ol>
    </nav>
    <div class="tab">
        <ul class="nav nav-tabs">
            <li class="nav-item">
              <a href="memList" id="all" class="nav-link">전체회원관리</a>
            </li>
            <li class="nav-item">
              <a id="status" class="nav-link active" aria-current="page">탈퇴대기</a>
            </li>
          </ul>
    </div>
    <div id="content">
        
        <h3 id="title">회원관리</h3>

        <table class="table" id="statusList">
            <thead>
                <tr>
                	<th scope="col"></th>
                    <th scope="col">아이디</th>
                    <th scope="col">이름</th>
                    <th scope="col">닉네임</th>
                    <th scope="col">가입일</th>
                    <th scope="col">회원상태</th>
                </tr>
            </thead>
            <tbody>
               <c:choose>
               <c:when test="${ empty list }">
               	<tr>
               		<td colspan="5">회원이 존재하지 않습니다.</td>
               	</tr>
               </c:when>
               <c:otherwise>
               <c:forEach items="${ list }" var="member">
               <tr>
               	<td>
               		<div class="form-check">
	                    <input class="form-check-input" type="checkbox" id="seletBox" />
	                </div>
               	</td>
               	<td id="userId">${ member.userId }</td>
               	<td>${ member.userName }</td>
               	<td>${ member.nickname }</td>
               	<td>${ member.createDate }</td>
               	<td>${ member.status }</td>
               </tr>
               </c:forEach>
               </c:otherwise>
               </c:choose>
            </tbody>
        </table>
        <div id="buttons">
	       	<button type="button" class="btn btn-success" onclick="change();">복구</button>
	        <button type="button" class="btn btn-secondary" onclick="deleteMember();">삭제</button>
        </div>
    </div>
    <script>
    	function change() {
    		
    		const userId = $('#userId').val();
			
			//배열 선언
			const members = [];
			
			//체크 박스에 체크된 차단당한 아이디 정보 배열에 담아주기
			$('#seletBox').each(function() {
				const member= $(this).closest('tr').find('#userId').text().trim();
				
                members.push(member);
			});
			
			console.log(members);

			$.ajax({
				url : '/redclip/admin/',
				type : 'put',
				data : JSON.stringify(members),
				contentType : 'application/json',
				success : result => {
					console.log('요청 성공');
				},
				error : e => {
					console.log('요청 실패');
				}
			});
		};
    	
    	function deleteMember() {
    		
    	}
    </script>
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>