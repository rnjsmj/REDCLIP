<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 목록</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .btn-container {
    display: flex;
    align-items: center;
    }
    .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }
    .col {
        margin-bottom: 30px;
    }
    .sub-title {
        margin-top: 60px;
        font-size: 22px;
        font-weight: bold;
    }
    .d-flex { width: 1100px; margin-bottom: 40px;}
    .form-control { margin-right: 4px;}
    .filter-select {
        margin: 0 5px;
    }
    .breadcrumb {
        background-color: transparent;
        padding: 0;
    }
    .load-more-btn {
        display: block;
        margin: 20px auto;
    }
    .card-text {
        font-size: 16px;
    }
    .card-container {
        display: flex;
        flex-wrap: wrap;
    }
    .filter-info-container {
        display: flex;
        align-items: center;
    }
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="container">
        <!-- breadcrumb -->
        <section>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <img src="/redclip/resources/img/house-door-fill.svg" style="margin-right: 4px" />
                    <li class="breadcrumb-item"><a href="/redclip">홈</a></li>
                    <li class="breadcrumb-item"><a href="/redclip/barters">상품목록</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${ barter.barterName }</li>
                </ol>
            </nav>
            <jsp:include page="/WEB-INF/views/common/search.jsp" />
            <div id="filter-info" class="clr-fix">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex">
                        <select class="form-control" id="categoryNo" name="categoryNo" style="max-width: 150px;" required>
				           <option value="0">카테고리</option>
				           <option value="1">디지털기기</option>
				           <option value="2">가구/인테리어</option>
				           <option value="3">유아용품</option>
				           <option value="4">여성의류</option>
				           <option value="5">여성잡화</option>
				           <option value="6">남성의류</option>
				           <option value="7">남성잡화</option>
				           <option value="8">생활가전</option>
				           <option value="9">주방용품</option>
				           <option value="10">스포츠/레저</option>
				           <option value="11">게임/음반</option>
				           <option value="12">뷰티/미용</option>
				           <option value="13">식물</option>
				           <option value="14">가공식품</option>
				           <option value="15">건강기능식품</option>
				           <option value="16">반려동물용품</option>
				           <option value="17">티켓/교환권</option>
				           <option value="18">도서</option>
				        </select>
                        <select class="form-control" id="si">
                            <option selected value="0">시</option>
                            <option value="1">서울특별시</option>
                            <option value="2">인천광역시</option>
                        </select>
                        <select class="form-control" id="gu" disabled>
                            <option selected value="0">구</option>
                        </select>
                        <select class="form-control" id="dong" disabled>
                            <option selected value="0">동</option>
                        </select>
                    </div>
                </div>
            </div>

        <div class="container" style="max-width: 1200px;">
	            <h5 style="font-weight: bold">추천 물물교환</h5>
	            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
	            <c:if test="${not empty sessionScope.loginUser }">
	                <a class="btn btn-secondary" style="float: right;" href="barters/registration">글쓰기</a> <br>
	            </c:if>
	            <br>
	            <div class="card-container">
	            <!--
                    <c:forEach items="${list}" var="barter">
                    <div class="card" style="width: 270px; height:300px;">
                        <img src="${barter.barterFileList[0].barterFileName}" class="card-img-top" alt="${barter.barterName}">
                        <div class="card-body">
                            <h5 class="card-title">${barter.barterName}</h5>
                            <p class="card-text">${barter.barterWriter}</p>
                            <p class="card-text">${barter.region.cityName} ${barter.region.townName} ${barter.region.villageName}</p>
                            <p class="card-text">${barter.barterDate}</p>
                            <a href="/redclip/barters/${ barter.barterNo }" class="btn btn-primary">상세보기</a>
                        </div>
                    </div>
                </c:forEach>
                 -->
                </div>
                <div class="btn-container">
                    <button id="load-more-btn" class="btn btn-danger load-more-btn">더보기</button>
                </div>
	        </div>
            </section>
        </div>
    </div>
	
    <script>
    $(document).ready(function() {
        const $categorySelect = $('#categoryNo');
        const $siSelect = $('#si');
        const $guSelect = $('#gu');
        const $dongSelect = $('#dong');
        const $cardContainer = $('.card-container');

        // 시 선택 시 구 목록 로드
        $siSelect.change(() => {
            const siValue = $siSelect.val();
            if (siValue !== "") {
                $.ajax({
                    url: '/redclip/member/guSelect',
                    type: 'GET',
                    data: { si: siValue },
                    success: response => {
                        $guSelect.empty().append('<option value="">구 선택</option>');
                        response.forEach(a => {
                            $guSelect.append('<option value=' + a.townCode + '>' + a.townName + '</option>');
                        });
                        $guSelect.prop('disabled', false); // 구 셀렉트 박스 활성화
                        $dongSelect.prop('disabled', true).empty().append('<option value="">동 선택</option>'); // 동 셀렉트 박스 비활성화 및 초기화
                    },
                    error: function() {
                        alert('오류가 발생했습니다.');
                    }
                });
            }
        });

        // 구 선택 시 동 목록 로드
        $guSelect.change(() => {
            const guValue = $guSelect.val();
            if (guValue !== "") {
                $.ajax({
                    url: '/redclip/member/dongSelect',
                    type: 'GET',
                    data: { gu: guValue },
                    success: response => {
                        $dongSelect.empty().append('<option value="">동 선택</option>');
                        response.forEach(a => {
                            $dongSelect.append('<option value=' + a.villageCode + '>' + a.villageName + '</option>');
                        });
                        $dongSelect.prop('disabled', false); // 동 셀렉트 박스 활성화
                    },
                    error: function() {
                        alert('오류가 발생했습니다.');
                    }
                });
            }
        });

        // 필터링된 바터 목록 로드
        function loadFilteredBarters() {
            const categoryNo = $categorySelect.val();
            const si = $siSelect.val();
            const gu = $guSelect.val();
            const dong = $dongSelect.val();
            const $cardContainer = $('.card-container');
            console.log(dong);
            let code;

            if (dong != 0) {
                code = dong;
            } else if (gu != 0) {
                code = gu;
            } else if (si) {
                code = si;
            }

            $.ajax({
                url: '/redclip/barters/' + categoryNo + '/' + code,
                type: 'GET',
                success: function(response) {
                    // 필터링된 결과를 기존 카드 목록에 추가
                    console.log('카테고리번호:', categoryNo);
                    console.log('지역코드번호:', code);
                    response.forEach(barter => {
                    	console.log(barter);
                        const card =
                        	'<div class="card" style="width: 270px; height:300px;">'
                        	 +'<img src="' + barter.barterFileList[0].barterFileName+ '" class="card-img-top" alt="' +barter.barterName+ '">'
                             +'<div class="card-body">'
                             +'<h5 class="card-title">' +barter.barterName+ '</h5>'
                             +'<p class="card-text">' +barter.region.cityName+' '+barter.region.townName+' '+barter.region.villageName+ '</p>'
                             +'<p class="card-text">' +barter.barterDate+ '</p>'
                             +'<a href="/redclip/barters/' + barter.barterNo+ '" class="btn btn-primary">상세보기</a>'
                             +'</div>'
                             +'</div>';
                             console.log(response);
                        $cardContainer.append(card); // 기존 카드 목록에 추가
                    });

                    // 결과가 없을 때 처리 (예: 아무 항목도 찾지 못했을 때)
                    if (response.length === 0) {
                        $cardContainer.html('<p class="text-center">검색 결과가 없습니다.</p>');
                    }
                },
                error: function(xhr, status, error) {
                    alert('항목을 불러오는데 실패했습니다. 에러 메시지: ' + xhr.status + ' ' + error);
                }
            });
        }

        // 카테고리 및 위치 변경 시 필터링된 목록 로드
        $('#categoryNo, #si, #gu, #dong').change(function() {
            $cardContainer.empty(); // 기존 카드 목록 비우기
            loadFilteredBarters(); // 필터링된 목록 다시 로드
        });

        // 페이지 로드시 처음 필터링된 목록 로드
        loadFilteredBarters();
    });
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
