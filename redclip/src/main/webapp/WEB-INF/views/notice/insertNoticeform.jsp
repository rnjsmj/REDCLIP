<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록(관리자만 접근가능)</title>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .content {
            width: 1140px;
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
        
        #enrollForm>table {
            width: 80%;
            margin: 0 auto; 
        }
        
        #enrollForm>table * {
            margin: 5px;
        }
        
        #img-area {
            width: 100%;
            margin: auto;
            text-align: center;
        }
        
        #img-area>img {
            width: 80%;
        }
        .buttons{
            text-align: center;
        }
        #enrollForm th {
            width: 100px;
        }
    </style>
</head>


</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="content">
        <br>
        <br>
        <div class="innerOuter">
            <h2>게시글 작성하기</h2>
            <br>

            <form id="enrollForm" method="post" action="insertNotice">
                <table>
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${sessionScope.loginUser.userId}" name="userId" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="category">글 분류</label></th>
                        <td>
                            <select id="category" class="form-control" name="noticeType" required>
                                <option value="공지">공지</option>
                                <option value="이벤트">이벤트</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize: none;" name="noticeContent" required></textarea></td>
                    </tr>
                </table>
                <br>
                
                <div class="buttons">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br>
        <br>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>