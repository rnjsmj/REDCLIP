<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

   
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 60%;
            margin: 0 auto;
            margin-top: 20px;
        }

        h1 {
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
            vertical-align: top;
        }

        th {
            background-color: #f5f5f5;
            width: 20%;
        }

        .content-cell {
            height: 150px;
        }

        .buttons {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn-custom {
            margin: 0 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>게시글 상세보기</h1>
        <table>
            <tr>
                <th>글 유형</th>
                <td>공지</td>
                <th>등록일</th>
                <td>날짜</td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3">공지사항 제목입니다.</td>
            </tr>
            <tr>
                <th>이름</th>
                <td colspan="3">작성자이름</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3" class="content-cell">공지사항 내용입니다.</td>
            </tr>
        </table>
        
        <div class="buttons">
            <button class="btn btn-success btn-custom">수정</button>
            <button class="btn btn-danger btn-custom">삭제</button>
            <button class="btn btn-secondary btn-custom" onclick="history.back()">뒤로</button>
        </div>
    </div>
    
  
</body>
</html>