<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸터</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            clear: both;
        }

        footer {
            background-color: #1c1c1e;
            color: #fff;
            padding: 20px 40px;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            border-bottom: 1px solid #333;
            padding-bottom: 10px;
        }

        .footer-left, .footer-right {
            flex: 1;
        }

        .footer-left {
            text-align: left;
        }

        .footer-right {
            text-align: right;
            color: lightgray;
        }

        .footer-left a {
            color: lightgray;
            text-decoration: none;
            margin: 0 10px;
        }

        .footer-left a:hover {
            text-decoration: underline;
        }

        .footer-bottom {

            font-size: 14px;
            color: #aaa;
            text-align: center;
            margin-top: 10px;
        }

        .footer-info {
            margin-top: 1px;
        }
    </style>
</head>
<body>
	<footer>
        <div class="footer-content">
            <div class="footer-left">
                <a href="team">이용약관</a>
                <a href="#">개인정보처리방침</a>
            </div>
            <div class="footer-right">
                <p class="footer-info">상호: RED CLIP | 대표자명: 이성하 </p>
                <p class="footer-info">사업자등록번호: 000-00-00000 | 이메일: REDCLIP@naver.com</p>
                <p class="footer-info">주소: 서울시 동대문구 왕십리로 11</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>Copyright © REDCLIP</p>
        </div>
    </footer>
</body>
</html>