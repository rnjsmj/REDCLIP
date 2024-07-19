<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 부트스트랩 CSS 파일 포함 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- 부트스트랩 JS 파일 포함 (옵션) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 60%;
            height: 780px;
            margin: 0 auto;
        }

        h1 {
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f5f5f5;
        }

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .buttons {
        margin-bottom: 20px;
        margin-top:20px;
	    display: flex;
	    justify-content: flex-end;
	    gap: 10px; 
	    
        }

        .pagination {
            display: block !important;
            text-align: center;
            margin:auto;
        }

        .pagination ul {
            list-style: none;
            padding: 0;
        }

        .pagination li {
            display: inline;
            margin: 0 2px;
        }

        .pagination a, .pagination span {
            display: inline-block;
            padding: 10px 15px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            text-decoration: none;
        }

        .pagination a:hover {
            background-color: #e9ecef;
        }

        .pagination .active span {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .pagination .disabled span {
            color: #ccc;
        }
        .tatable {
        height:500px
        }
        
    </style>
    
    <meta charset="UTF-8">
    <title>공지사항</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="container">
        <h1>공지사항</h1>
      
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link ${param['type'] == null || param['type'] == '1' ? 'active' : ''}" id="all-tab" href="noticeform?type=1" role="tab" aria-controls="all" aria-selected="${param['type'] == null || param['type'] == '1'}">전체보기</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param['type'] == '2' ? 'active' : ''}" id="notice-tab" href="noticeform?type=2" role="tab" aria-controls="notice" aria-selected="${param['type'] == '2'}">공지</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param['type'] == '3' ? 'active' : ''}" id="event-tab" href="noticeform?type=3" role="tab" aria-controls="event" aria-selected="${param['type'] == '3'}">이벤트</a>
            </li>
        </ul>


        <br>

        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active tatable" id="all" role="tabpanel" aria-labelledby="all-tab">
                <!-- 전체보기 내용 -->
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>분류</th>
                            <th>제목</th>
                            <th>등록날짜</th>
                            <th>작성자</th>
                            <th>선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="notice" items="${noticeList}" varStatus ='status'>
                            <tr>
                                <td>${(pageInfo.currentPage - 1) * 10 + status.count}</td>
                                <td>${notice.noticeType}</td>
                                <td><a href="noticeDetail?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></td>
                                <td>${notice.noticeDate}</td>
                                <td>${notice.userId}</td>
                                <td><input type="checkbox" name="noticeNo" value="${notice.noticeNo}"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
	            <div class="buttons">
		             <c:if test="${sessionScope.loginUser != null && sessionScope.loginUser.status == 'A'}">
		             	<form action="insertNoticeform" method="post">
		                    <button class="btn btn-primary write-button" >글쓰기</button>
		              	</form>      
		             	 <form id="deleteForm" action="deleteNotice" method="post">
		             	 	<input type="hidden" name="deleteNo" id="deleteNoInput">
				            <button class="btn btn-danger delete-button" type="button" id="deleteBtn">글삭제</button>
				        </form>
		             </c:if>
	            </div>
	            
	         <script>
			    $(() => {
			        $('#deleteBtn').click(() => {
			            let deleteNo = [];
			            $('input[type=checkbox]:checked').each(function() {
			                deleteNo.push($(this).val());
			            });
			
			            console.log("잘나오냐{} ", deleteNo); 
			
			            if (deleteNo.length > 0) {
			            	$('#deleteNoInput').val(deleteNo);
			              $('#deleteForm').submit();
			              
			            } else {
			                alert("삭제할 항목을 선택해주세요.");
			            }
			        });
			    });
			</script>

	            
	            
	            
	            
		     <div class="pagination">
		        <ul>
		            <!-- 이전 페이지 링크 -->
		            <c:if test="${pageInfo.currentPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="noticeform?page=${pageInfo.currentPage - 1}&type=${param['type']}">&lt;</a>
		                </li>
		            </c:if>
		            <!-- 페이지 번호 -->
		            <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="page">
		                <c:choose>
		                    <c:when test="${pageInfo.currentPage == page}">
		                        <li class="page-item active">
		                            <span class="page-link">${page}</span>
		                        </li>
		                    </c:when>
		                    <c:otherwise>
		                        <li class="page-item">
		                            <a class="page-link" href="noticeform?page=${page}&type=${param['type']}">${page}</a>
		                        </li>
		                    </c:otherwise>
		                </c:choose>
		            </c:forEach>
		            <!-- 다음 페이지 링크 -->
		            <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
		                <li class="page-item">
		                    <a class="page-link" href="noticeform?page=${pageInfo.currentPage + 1}&type=${param['type']}">&gt;</a>
		                </li>
		            </c:if>
		        </ul>
		    </div>
        </div>
    </div>
</body>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>
