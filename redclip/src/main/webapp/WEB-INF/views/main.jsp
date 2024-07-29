<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>메인페이지</title>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <style>
        body {
            width: 100%;
        }
        .all {
            width: 1200px;
            margin: auto;
        }
        /* 첫 번째 슬라이더 이미지 영역 사이즈 조절 */
        .swiper.large {
            width: 1150px;
            height: 450px;
            margin-bottom: 50px; /* 슬라이더 사이 여백 추가 */
        }
        .swiper-slide {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        /* 첫 번째 슬라이더 이미지 사이즈 조절 */
        .swiper.large .swiper-slide > img {
            width: 350px;
            height: 400px;
            object-fit: cover;
        }
        /* 두 번째, 세 번째 슬라이더 이미지 영역 사이즈 조절 */
        .swiper.small {
            width: 1150px;
            height: 350px; /* 이미지와 텍스트를 포함한 높이 */
        }
        /* 두 번째, 세 번째 슬라이더 이미지 사이즈 조절 */
        .swiper.small .swiper-slide > img {
            width: 175px; /* 절반 크기 */
            height: 175px; /* 정사각형 이미지 */
            object-fit: cover;
            border-radius: 10px; /* 이미지 모서리를 둥글게 */
        }
        .swiper.small .swiper-slide .text-container {
            text-align: center;
            margin-top: 10px;
        }
        .swiper.small .swiper-slide .title {
            font-size: 16px;
            font-weight: bold;
        }
        .swiper.small .swiper-slide .author {
            font-size: 14px;
            color: gray;
        }
        .swiper.small .swiper-slide .price {
            font-size: 14px;
            color: green;
            margin-top: 5px;
        }
        .swiper.small .swiper-slide .location {
            font-size: 14px;
            color: blue;
            margin-top: 5px;
        }
        /* 화살표 버튼색 변경 (기본색은 파란색) */
        div[class^="swiper-button"] {
            color: black;
        }
        .swiper-button-prev {
            left: 20px !important; /* 왼쪽 버튼을 약간 안쪽으로 조정 */
        }
        .swiper-button-next {
            right: 20px !important; /* 오른쪽 버튼을 약간 안쪽으로 조정 */
        }
        .swiper-pagination {
            margin-top: 10px !important;
        }
        .search {
		    width: 100%;
		    height: 500px;
		    margin: auto;
		    text-align: center;
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		}

        .search input[type="text"] {
            width: 300px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .search input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
        }
        .search input[type="submit"]:hover {
            background-color: #218838;
        }
        
        #content_3{
        	margin-bottom:200px;
        	margin-top:60px;	
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="all">
        <div class="search">
            <input type="text" placeholder="검색어를 입력하세요" />
            <input type="submit" value="검색" />
        </div>

        <div id="content_2">
            <h2>방금 올라온 상품</h2>
            <!-- 두 번째 Slider main container -->
            <div class="swiper small">
                <!-- Additional required wrapper -->
                <div class="swiper-wrapper">
                    <!-- Slides -->
                    <c:forEach var="product" items="${recentProducts}">
                        <div class="swiper-slide">
                            <c:if test="${not empty product.barterFileList}">
                                <img src="${product.barterFileList[0].barterFileName}" alt="이미지" />
                            </c:if>
                            <div class="text-container">
                                <div class="title">${product.barterName}</div>
                                <div class="author">작성자: ${product.barterNickname}</div>
                                <div class="date">등록날짜: ${product.barterDate}</div>
                                <div class="location">지역: ${product.region.villageName}</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>

        <div id="content_3">
            <h2>인기 상품</h2>
            <div class="swiper small">
                <div class="swiper-wrapper">
                    <c:forEach var="product" items="${topProducts}">
                        <div class="swiper-slide">
                            <c:if test="${not empty product.barterFileList}">
                                <img src="${product.barterFileList[0].barterFileName}" alt="이미지" />
                            </c:if>
                            <div class="text-container">
                                <div class="title">${product.barterName}</div>
                                <div class="author">작성자: ${product.barterNickname}</div>
                                <div class="date">등록날짜: ${product.barterDate}</div>
                                <div class="location">지역: ${product.region.villageName}</div>
                                <div class="views">조회수: ${product.wishCount}</div> <!-- 조회수 출력 -->
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>

        <script>
            // 두 번째 슬라이더 동작 정의
            const swiper2 = new Swiper("#content_2 .swiper", {
                autoplay: {
                    delay: 10000, 
                },
                loop: true, // 반복 재생 여부
                slidesPerView: 6, // 한 번에 보여지는 슬라이드 수
                slidesPerGroup: 6, // 한 번에 6개씩 넘어가는 슬라이드 수
                pagination: {
                    // 페이징 버튼 클릭 시 이미지 이동 가능
                    el: "#content_2 .swiper-pagination",
                    clickable: true,
                },
                navigation: {
                    // 화살표 버튼 클릭 시 이미지 이동 가능
                    prevEl: "#content_2 .swiper-button-prev",
                    nextEl: "#content_2 .swiper-button-next",
                },
            });

            // 세 번째 슬라이더 동작 정의
            const swiper3 = new Swiper("#content_3 .swiper", {
                autoplay: {
                    delay: 100000, 
                },
                loop: true, // 반복 재생 여부
                slidesPerView: 6, // 한 번에 보여지는 슬라이드 수
                slidesPerGroup: 6, // 한 번에 6개씩 넘어가는 슬라이드 수
                pagination: {
                    // 페이징 버튼 클릭 시 이미지 이동 가능
                    el: "#content_3 .swiper-pagination",
                    clickable: true,
                },
                navigation: {
                    // 화살표 버튼 클릭 시 이미지 이동 가능
                    prevEl: "#content_3 .swiper-button-prev",
                    nextEl: "#content_3 .swiper-button-next",
                },
            });
        </script>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
