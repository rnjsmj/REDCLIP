<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 부트스트랩 CSS 파일 포함 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- 부트스트랩 JS 파일 포함 (옵션) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 60%;
            height: 500px;
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
            text-align: right;
        }

        .pagination {
            display: block;
            text-align: center;
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
                <a class="nav-link active" id="all-tab" data-toggle="tab" href="#all" role="tab" aria-controls="all" aria-selected="true">전체보기</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="notice-tab" data-toggle="tab" href="#notice" role="tab" aria-controls="notice" aria-selected="false">공지</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="event-tab" data-toggle="tab" href="#event" role="tab" aria-controls="event" aria-selected="false">이벤트</a>
            </li>
        </ul>

        <br>

        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
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
                        <c:forEach var="notice" items="${noticeList}">
                            <tr>
                                <td>${notice.noticeNo}</td>
                                <td>${notice.type}</td>
                                <td><a href="noticeDetail?boardNo=${notice.boardNo}">${notice.title}</a></td>
                                <td>${notice.createDate}</td>
                                <td>${notice.userId}</td>
                                <td><input type="checkbox"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <div class="buttons">
                <button class="btn btn-primary write-button">글쓰기</button>
                <button class="btn btn-danger delete-button">글삭제</button>
            </div>
        
            <div class="pagination">
                <ul>
                    <!-- 이전 페이지 링크 -->
                    <c:if test="${pageInfo.currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="boardlist?page=${pageInfo.currentPage - 1}">&lt;</a>
                        </li>
                    </c:if>
                    <!-- 페이지 번호 -->
                    <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="p">
                        <c:choose>
                            <c:when test="${pageInfo.currentPage == p}">
                                <li class="page-item active">
                                    <span class="page-link">${p}</span>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="boardlist?page=${p}">${p}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <!-- 다음 페이지 링크 -->
                    <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
                        <li class="page-item">
                            <a class="page-link" href="boardlist?page=${pageInfo.currentPage + 1}">&gt;</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
