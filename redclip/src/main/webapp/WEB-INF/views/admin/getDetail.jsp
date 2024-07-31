<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고 상세보기</title>
<style>
body {
	margin: 20px;
	line-height: 1.6;
	height: auto;
}
.allwrap{
	margin:auto;
	margin-top:2rem;
	width: 1200px;
	height: 700px;
	
}

#title {
	margin: 30px;
}

.container {
	max-width: 1200px;
	margin: auto;
	border: 1px solid #ccc;
	padding: 30px;
	border-radius: 5px;
}

.row {
	display: flex;
	margin-bottom: 10px;
}

.row div {
	flex: 1;
	padding: 5px;
}

.row div:first-child {
	font-weight: bold;
	flex: 0 0 200px;

}

.buttons {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
	margin-right:120px;
}

	
.buttons button {
	margin-left: 10px;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- 헤더 영역-->
	<header>
		<jsp:include page="../common/header.jsp" />
	</header>

	<div class="allwrap">

		<nav style="-bs-breadcrumb-divider: '&gt;';" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">관리자 페이지</a></li>
				<li class="breadcrumb-item active" aria-current="page">신고내역
					상세보기</li>
			</ol>
		</nav>
		<div id="content">

			<h3 id="title" style="text-align:center;">신고 내역 상세보기</h3>

			<div class="container">
				<div class="row">
					<div>신고 당한 회원의 아이디</div>
					<div>${ report.reportedId }</div>
				</div>
				<div class="row">
					<div>신고 유형</div>
					<div>${ report.reportType }<a style="margin-left:20px" href="/redclip/barters/${report.referenceNo}">바로가기</a></div>
				</div>
				<div class="row">
					<div>제목</div>
					<div>${ report.reportTitle }</div>
				</div>
				<div class="row">
					<div>신고 일시</div>
					<div>${ report.reportDate }</div>
				</div>
				<div class="row">
					<div>누적 신고 횟수</div>
					<div>
						<p>${report.reportCount }</p>
					</div>
				</div>
				<div class="row">
					<div>신고 내용</div>
					<div>${ report.reportContent }</div>
				</div>
			</div>
			<div class="buttons">
				<button type="button" class="btn btn-success" hidden>정지</button>
				<form id="deleteReport" action="deleteReport" method="post">
				<input type="hidden" name="reportNo" value="${report.reportNo}">
					<button type="submit" class="btn btn-success">삭제</button>
				</form>
				<button type="button" class="btn btn-secondary" onclick="history.back()">목록으로</button>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
</body>
</html>