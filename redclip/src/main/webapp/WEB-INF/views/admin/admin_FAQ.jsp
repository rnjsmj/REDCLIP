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
    <title>관리자용 - FAQ</title>
    <style>

        body {
            margin: 20px;
            line-height: 1.6;
            height: auto;
        }

        #title {
             margin: 30px; 
             margin-left: 340px;
        }
        
        #content {
        	 height: auto;
        	 margin-bottom: 20px;
        	 width: 100%;
        }
        
        #faqList {
             margin: 0 auto; 
             width: 1200px;
             margin-bottom: 100px;
   			 height: auto;
            }

        #insert, #buttons {
            float: right;
            margin-right: 330px;
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
        <li class="breadcrumb-item active" aria-current="page">FAQ 목록</li>
      </ol>
    </nav>
    <div id="content">

        <h3 id="title">FAQ 관리 (관리자용)</h3> <br>
        <!-- 글 작성 버튼-->
        <button id="insert" type="button" class="btn btn-success" data-toggle="modal" data-target="#insertForm" align="right">글 작성</button><br><br>

        <table id="faqList" class="table table-hover">
            <thead>
              <tr>
                <th scope="col">선택</th>
                <th scope="col">질문종류</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
              </tr>
            </thead>
            <tbody>
            <c:choose>
            <c:when test="${ empty list }">
            	<tr>
            		<td align="center">글이 존재하지 않습니다.</td>
            	</tr>
            </c:when>
            <c:otherwise>
            <c:forEach items="${ list }" var="faq">
            	<tr>
	                <td>
	                <div class="form-check">
	                    <input class="form-check-input" type="checkbox" value="${ faq.faqNo }" id="flexCheckDefault">
	                </div>
	                </td>
	                <td>${ faq.faqType }</td>
	                <td>${ faq.question }</td>
	                <td>${ faq.userId }</td>
	             </tr>
	        </c:forEach>
            </c:otherwise>
            </c:choose>
            </tbody>
          </table>
          <!-- 수정 | 삭제 버튼 -->
            <div id="buttons" style="margin-top: 30px;">
                <button type="button" id="update" class="btn btn-success" data-toggle="modal" data-target="#updateForm">수정</button> | <button type="submit" id="delete" class="btn btn-secondary">삭제</button>
            </div>
    </div>
    
     <!-- 게시글 작성 모달창 -->
     <div class="modal fade" id="insertForm">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">FAQ 작성</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                    <div class="modal-body">
                    	<div>
                    		<input type="hidden" id="userId" value="${ sessionScope.loginUser.userId }" />
                    	</div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">제목</label>
                            <input type="text" class="form-control" id="exampleFormControlInput2" name="question" placeholder="제목을 입력하세요">
                        </div>
                        <div class="mb-3">
                            <label for="Default select example" class="form-label">분류</label>
                            <select class="form-select" aria-label="Default select example" id="faqType">
                                <option selected>글 분류</option>
                                <option value="시스템">시스템</option>
                                <option value="회원">회원</option>
                                <option value="등급">등급</option>
                              </select>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                            <textarea class="form-control" id="exampleFormControlTextarea2" rows="3" placeholder="내용을 입력하세요" name="answer"></textarea>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="button" class="btn btn-success" onclick="insert();">작성</button>
                        <button type="reset" class="btn btn-secondary">취소</button>
                    </div>
            </div>
        </div>
    </div>

    <!-- 게시글 수정 모달창 -->
    <div class="modal fade" id="updateForm">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">FAQ 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">제목</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" value="비밀번호를 잊어버렸어요">
                        </div>
                        <div class="mb-3">
                            <label for="Default select example" class="form-label">분류</label>
                            <select class="form-select" aria-label="Default select example">
                                <option selected>시스템</option>
                                <option value="1">시스템</option>
                                <option value="2">회원</option>
                                <option value="3">등급</option>
                              </select>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3">비밀번호 찾기는 로그인 페이지의 '비밀번호 찾기'를 이용해주세요.</textarea>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="button" class="btn btn-success">수정</button>
                        <button type="reset" class="btn btn-secondary">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

	<script>
		function insert() {
			
			const newFaq = {
				"question" : $('#exampleFormControlInput2').val(),
				"answer" : $('#exampleFormControlTextarea2').val(),
				"faqType" : $('#faqType').val(),
				"userId" : $('#userId').val()
			};
			
			$.ajax({
				url : '/faq',
				type : 'post',
				data : JSON.stringify(newFaq),
				contentType : 'application/json',
				success : result => {
					console.log('작성 성공');
				},
				error : e => {
					console.log('작성 실패');
				}
			});
		};
	
	</script>
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>