<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .card-text {
        font-size: 16px;
    }
    .btn-container {
        display: flex;
        justify-content: center;
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
    .d-flex { width: 1110px; margin-bottom: 40px;}
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
    .card-container {
        display: flex;
        flex-wrap: wrap;
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
				           <option>카테고리</option>
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
                            <option selected>시</option>
                            <option value="1">서울특별시</option>
                            <option value="2">인천광역시</option>
                        </select>
                        <select class="form-control" id="gu" disabled>
                            <option selected>구</option>
                        </select>
                        <select class="form-control" id="dong" disabled>
                            <option selected>동</option>
                        </select>
                    </div>
                </div>
            </div>

        <div class="container" style="max-width: 1200px;">
            <h5 style="font-weight: bold">추천 물물교환</h5>
            <br>
            <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <c:if test="${not empty sessionScope.loginUser }">
                <a class="btn btn-secondary" style="float: right;" href="barters/registration">글쓰기</a> <br>
            </c:if>
            <br>
            
            <section id="portfolio" style="padding-top: 90px; padding-bottom: 0;">
                <div class="container">
                    <div class="card-container row row-cols-1 row-cols-sm-3 row-cols-md-4 g-4" id="card-container">
                        <!-- JavaScript에 의해 동적으로 카드가 추가 -->
                        <c:forEach items="${ baters}" var="img">
                            <div class="col" onclick="func(this);">
                                <input type="hidden" class="thumbnail-date" value="${ img.createDate}" />
                                <input type="hidden" class="thumbnail-content" value="${ img.boardContent}" />
                                <a class="portfolio-link" href="">
                                    <div class="portfolio-hover">
                                        <div class="portfolio-hover-content"></div>
                                    </div>
                                </a>
                                <div class="portfolio-caption">
                                    <h4 class="thumbnail-title">${ img.boardTitle}</h4>
                                    <p class="text-muted thumbnail-writer">${ img.boardWriter }</p>
                                    <span>${ img.region.cityName }&nbsp;${ img.region.townName }&nbsp;${ img.region.villageName }</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="btn-container">
                        <button id="load-more-btn" class="btn btn-danger load-more-btn">더보기</button>
                    </div>
                </div>
            </section>
        </div>
    </div>
	
    <script>
      	$(() => {
        	const $siSelect = $('#si');
		    const $guSelect = $('#gu');
		    const $dongSelect = $('#dong');
		
		    $siSelect.change(() => {
		        const siValue = $siSelect.val();  
				console.log(siValue);
		        if (siValue !== null ) { //시벨류값이 널이 아닐때 실행)
		             console.log("시밸류값:", siValue); 
		            $.ajax({
		                url: 'member/guSelect', 
		                type: 'GET',
		                data: { si: siValue }, 
		                success: response => {
		                	 console.log(response);
		                	$guSelect.empty().append('<option value="">구 선택</option>');
		                    response.forEach((a) => { 
		                    	$guSelect.append('<option value='+a.townCode+'>'+a.townName+'</option>');
		                    });
		                    $guSelect.prop('disabled', false); // 구 셀렉트 박스 활성화
		                },
		                error: function() {
		                    alert('오류가 발생했습니다.');
		                }
		            });
		        }
		    });
		   
		    $guSelect.change(() => {
		    	 const guValue = $guSelect.val();
		         console.log("선택한구벨류값:", guValue);
		    	if (guValue !== null) {
		    		$.ajax({
			    		url: 'member/dongSelect',
			    		type: 'GET',
			    		data: { gu: guValue },
			    		success: response => {
			    			console.log(response);
			    			$dongSelect.empty().append('<option value="">동 선택</option>')
			    			response.forEach((a) => {
			    				$dongSelect.append('<option value='+a.villageCode+'>'+a.villageName+'</option>');
			    			});
			    			$dongSelect.prop('disabled', false); // 동 셀렉트 박스 활성화
			    		},
			    		error: function() {
			    			alert('오류가 발생했습니다.');
			    		}
		    		});
		    	}
		    });
		});
		
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
