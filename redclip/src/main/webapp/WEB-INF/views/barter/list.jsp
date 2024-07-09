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
    .btn {
        margin: 20px 0;
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
    #form-all {
        width: 800px;
        margin-right: 10px;
    }
    .header-nav a {
        margin-right: 20px;
        color: black;
        text-decoration: none;
    }
    .header-nav a:hover {
        text-decoration: underline;
    }
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
        <section id="page1" class="page">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <img src="house-door-fill.svg" style="margin-right: 4px" />
                    <li class="breadcrumb-item"><a href="/redclip">홈</a></li>
                    <li class="breadcrumb-item"><a href="/redclip/barters">상품목록</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${ barter.barterName }</li>
                </ol>
            </nav>
            <jsp:include page="/WEB-INF/views/common/search.jsp" />
            <div id="filter-info" class="clr-fix">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex">
                        <select class="form-control filter-select" id="form-all">
                            <option selected>전체보기</option>
                            <option>전자기기</option>
                            <option>가구</option>
                            <option>의류</option>
                            <option>도서</option>
                        </select>
                        <select class="form-control filter-select" id="city-select">
                            <option selected>시</option>
                            <option>서울특별시</option>
                            <option>부산광역시</option>
                            <!-- 다른 시/도 옵션 추가 -->
                        </select>
                        <select class="form-control filter-select" id="district-select">
                            <option selected>구</option>
                            <!-- 구 옵션들 추가 -->
                        </select>
                        <select class="form-control filter-select" id="town-select">
                            <option selected>동</option>
                            <!-- 동 옵션들 추가 -->
                        </select>
                    </div>
                </div>
            </div>

        <div class="container">
            <p>추천 물물교환</p>
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
        $(document).ready(function() {
            $('#form-all').on('change', function() {
                const category = $(this).val();
                console.log('선택한 카테고리:', category);
            });

            $('#city-select').on('change', function() {
                const city = $(this).val();
                console.log('선택한 시:', city);
                updateDistrictOptions(city);
            });

            $('#district-select').on('change', function() {
                const district = $(this).val();
                console.log('선택한 구:', district);
                updateTownOptions(district);
            });

            $('#town-select').on('change', function() {
                const town = $(this).val();
                console.log('선택한 동:', town);
            });

            function updateDistrictOptions(city) {
                const districtSelect = $('#district-select');
                districtSelect.empty();
                districtSelect.append('<option selected>구</option>');

                if (city === '서울특별시') {
                    districtSelect.append('<option>강남구</option><option>서초구</option><!-- 다른 구 옵션 추가 -->');
                } else if (city === '부산광역시') {
                    districtSelect.append('<option>해운대구</option><option>수영구</option><!-- 다른 구 옵션 추가 -->');
                }
                // 다른 시/도에 대한 구 옵션 추가
            }

            function updateTownOptions(district) {
                const townSelect = $('#town-select');
                townSelect.empty();
                townSelect.append('<option selected>동</option>');

                if (district === '강남구') {
                    townSelect.append('<option>삼성동</option><option>대치동</option><!-- 다른 동 옵션 추가 -->');
                } else if (district === '서초구') {
                    townSelect.append('<option>서초동</option><option>방배동</option><!-- 다른 동 옵션 추가 -->');
                }
                // 다른 구에 대한 동 옵션 추가
            }
        });

        const cardContainer = document.getElementById('card-container');
        const loadMoreBtn = document.getElementById('load-more-btn');
        let cardCount = 0;

        function createCard(item) {
            const col = document.createElement('div');
            col.className = 'col';
            const card = document.createElement('div');
            card.className = 'card shadow-sm';
            const img = document.createElement('img');
            img.className = 'bd-placeholder-img card-img-top';
            img.setAttribute('width', '100%');
            img.setAttribute('height', '200');
            img.setAttribute('src', item.imgUrl);
            img.setAttribute('alt', '상품 이미지');
            card.appendChild(img);
            const cardBody = document.createElement('div');
            cardBody.className = 'card-body';
            const cardText = document.createElement('p');
            cardText.className = 'card-text';
            cardText.textContent = item.title;
            cardBody.appendChild(cardText);
            const cardFooter = document.createElement('div');
            cardFooter.className = 'd-flex justify-content-between align-items-center';
            const btnGroup = document.createElement('div');
            btnGroup.className = 'btn-group';
            const viewBtn = document.createElement('button');
            viewBtn.className = 'btn btn-sm btn-outline-secondary';
            viewBtn.textContent = 'View';
            viewBtn.onclick = function() {
                showModal(item.title, item.writer, item.content, item.date);
            };
            btnGroup.appendChild(viewBtn);
            cardFooter.appendChild(btnGroup);
            const smallText = document.createElement('small');
            smallText.className = 'text-body-secondary';
            smallText.textContent = item.time;
            cardFooter.appendChild(smallText);
            cardBody.appendChild(cardFooter);
            card.appendChild(cardBody);
            col.appendChild(card);
            return col;
        }

        function loadMoreCards() {
            $.ajax({
                url: '/redclip/barters/barter-registration',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    data.forEach(item => {
                        cardContainer.appendChild(createCard(item));
                    });
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', status, error);
                }
            });
        }

        loadMoreBtn.addEventListener('click', loadMoreCards);

        // 초기 로드 시 카드 추가
        loadMoreCards();
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
