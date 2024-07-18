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
	                    <input class="form-check-input" type="checkbox" value="${ faq.faqNo }" id="flexCheckDefault" name="faqNo" onclick="selectNo(this);">
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
                <button type="button" id="update" class="btn btn-success" data-toggle="modal" data-target="#updateForm" onclick="updateForm();">수정</button> | <button type="submit" id="delete" class="btn btn-secondary">삭제</button>
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
                                <option selected>시스템</option>
                                <option>회원</option>
                                <option>등급</option>
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
                    <div class="modal-body">
                   		<div>
                    		<input type="hidden" id="userId" value="${ sessionScope.loginUser.userId }" />
                    		<input type="hidden" id="faqNo" value="${ faq.faqNo }" />
                    	</div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">제목</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" value="${ faq.question }">
                        </div>
                        <div class="mb-3">
                            <label for="Default select example" class="form-label">분류</label>
                            <select class="form-select" aria-label="Default select example" id="faqType">
                                <option selected value="${ faq.faqType }"></option>
                                <option value="시스템">시스템</option>
                                <option value="회원">회원</option>
                                <option value="등급">등급</option>
                              </select>
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" value="${ faq.answer }"></textarea>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="button" class="btn btn-success" onclick="update();">수정</button>
                        <button type="reset" class="btn btn-secondary">취소</button>
                    </div>
            </div>
        </div>
    </div>

	<script>
	 
		//체크 박스에 체크 된 글번호 가져오기
			
		function selectNo() {
			
			
			const faqNo = $("input[name='faqNo']:checked").val();
			
			//const numbers = Array.from(faqNo).map(checkbox => parseInt(checkbox.value, 10));
			
			console.log(faqNo);
			
			$.ajax({
				url : '/redclip/faq/' + faqNo,
				type : 'get',
				success : result => {
					console.log('글이 있져');
				},
				error : e => {
					console.log('글이 없져');
				}
			});
			

			//글수정 입력창 띄우기
			function updateForm() {
				
				console.log(faq);
				
		/* 		selectNo(function(faq) {
					if(faq) {
						const value += '<div class="mb-3">'
							+	'<label for="exampleFormControlInput1" class="form-label">제목</label>'
							+	'<input type="text" class="form-control" id="exampleFormControlInput1" value="'
							+ 	${ faq.question } +'">'
							+	'</div>'
							+	'<div class="mb-3">'
							+	'<label for="Default select example" class="form-label">분류</label>'
							+	'<select class="form-select" aria-label="Default select example" id="faqType">'
							+	'<option selected value="' + ${ faq.faqType } + '"></option>'
							+	'<option value="시스템">시스템</option>'
							+	'<option value="회원">회원</option>'
							+	'<option value="등급">등급</option>'
							+	'</select>'
							+	'</div>'
							+	'<div class="mb-3">'
	              			+	'<label for="exampleFormControlTextarea1" class="form-label">내용</label>'
	              			+	'<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" value="' + ${ faq.answer } + '"></textarea>'
							+	'</div>'
							
						
						
					}
				}); */
			
		};
						
		//글 추가
		function insert() {
			
			const newFaq = {
				"question" : $('#exampleFormControlInput2').val(),
				"answer" : $('#exampleFormControlTextarea2').val(),
				"faqType" : $('#faqType').val(),
				"userId" : $('#userId').val()
			};
			
			console.log(newFaq);
			
			$.ajax({
				url : '/redclip/faq',
				type : 'post',
				contentType: 'application/json',
				data : JSON.stringify(newFaq),
				success : result => {
					//console.log('작성 성공');
					alert('FAQ가 추가되었습니다.');
					location.reload();
				},
				error : (xhr, status, error) => {
					//console.log('작성 실패');
					//console.log('상태: ', status);
					//console.log('오류: ', error);
					//console.log('응답: ', xhr.responseText);
					alert('FAQ 추가에 실패했습니다.');
				}
			});
		};
		

			
			
		};
		
		
	/* 	//글 수정
		function update() {
			
			const updateData = {
					"question" : $('#exampleFormControlInput2').val(),
					"answer" : $('#exampleFormControlTextarea2').val(),
					"faqType" : $('#faqType').val(),
					"userId" : $('#userId').val()
				};
			
			console.log(updateData);
			
			$.ajax({
				url : faqNo,
				type : 'put',
				data : JSON.stringify(updateData),
				contentType : 'application.json',
				success : result => {
					console.log('요청 성공');
				},
				error : e => {
					console.log('요청 실패');
				}
			});
			
		}; */
	</script>
    <footer>
        <jsp:include page="../common/footer.jsp" />
    </footer>
</body>
</html>