<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>메인페이지</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
 <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

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
        margin-bottom: 20px;
        text-align: center;
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
    </style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="all">
      <div class="search">
        <input type="text" placeholder="검색어를 입력하세요" />
        <input type="submit" value="검색" />
      </div>

      <div id="content_1">
        <!-- 첫 번째 Slider main container -->
        <div class="swiper large">
          <!-- Additional required wrapper -->
          <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"
              />
            </div>
          </div>

          <!-- If we need pagination -->
          <div class="swiper-pagination"></div>

          <!-- If we need navigation buttons -->
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
      </div>

      <div id="content_2">
        <h2>방금 올라온 상품</h2>
        <!-- 두 번째 Slider main container -->
        <div class="swiper small">
          <!-- Additional required wrapper -->
          <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"
              />
              <div class="text-container">
                <div class="title">아이폰 11</div>
                <div class="author">작성자: 홍길동</div>
                <div class="date">등록날자</div>
                <div class="location">지역: 서울</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"
              />
              <div class="text-container">
                <div class="title">갤럭시 S20</div>
                <div class="author">작성자: 김철수</div>
                <div class="price">등록날자</div>
                <div class="location">지역: 부산</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"
              />
              <div class="text-container">
                <div class="title">애플 워치</div>
                <div class="author">작성자: 이영희</div>
                <div class="date">등록날자</div>
                <div class="location">지역: 대구</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"
              />
              <div class="text-container">
                <div class="title">노트북</div>
                <div class="author">작성자: 박민수</div>
                <div class="date">등록날자</div>
                <div class="location">지역: 인천</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"
              />
              <div class="text-container">
                <div class="title">태블릿</div>
                <div class="author">작성자: 정수연</div>
                <div class="date">가격: 500,000원</div>
                <div class="location">지역: 광주</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"
              />
              <div class="text-container">
                <div class="title">카메라</div>
                <div class="author">작성자: 최지우</div>
                <div class="price">가격: 600,000원</div>
                <div class="location">지역: 대전</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"
              />
              <div class="text-container">
                <div class="title">헤드폰</div>
                <div class="author">작성자: 김정환</div>
                <div class="date">가격: 100,000원</div>
                <div class="location">지역: 울산</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"
              />
              <div class="text-container">
                <div class="title">스피커</div>
                <div class="author">작성자: 이준호</div>
                <div class="date">등록날짜</div>
                <div class="location">지역: 수원</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"
              />
              <div class="text-container">
                <div class="title">무선 충전기</div>
                <div class="author">작성자: 박소현</div>
                <div class="price">가격: 50,000원</div>
                <div class="location">지역: 전주</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"
              />
              <div class="text-container">
                <div class="title">게임 콘솔</div>
                <div class="author">작성자: 신동엽</div>
                <div class="date">등록날짜</div>
                <div class="location">지역: 창원</div>
              </div>
            </div>
          </div>

          <!-- If we need pagination -->
          <div class="swiper-pagination"></div>

          <!-- If we need navigation buttons -->
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
      </div>

      <div id="content_3">
        <h2>인기 상품</h2>
        <!-- 세 번째 Slider main container -->
        <div class="swiper small">
          <!-- Additional required wrapper -->
          <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"
              />
              <div class="text-container">
                <div class="title">아이폰 11</div>
                <div class="author">작성자: 홍길동</div>
                <div class="date">등록날짜</div>
                <div class="location">지역: 서울</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"
              />
              <div class="text-container">
                <div class="title">갤럭시 S20</div>
                <div class="author">작성자: 김철수</div>
                <div class="date">등록날짜</div>
                <div class="location">지역: 부산</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"
              />
              <div class="text-container">
                <div class="title">애플 워치</div>
                <div class="author">작성자: 이영희</div>
                <div class="date">등록날짜</div>
                <div class="location">지역: 대구</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"
              />
              <div class="text-container">
                <div class="title">노트북</div>
                <div class="author">작성자: 박민수</div>
                <div class="price">가격: 800,000원</div>
                <div class="location">지역: 인천</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"
              />
              <div class="text-container">
                <div class="title">태블릿</div>
                <div class="author">작성자: 정수연</div>
                <div class="price">가격: 500,000원</div>
                <div class="location">지역: 광주</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"
              />
              <div class="text-container">
                <div class="title">카메라</div>
                <div class="author">작성자: 최지우</div>
                <div class="price">가격: 600,000원</div>
                <div class="location">지역: 대전</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"
              />
              <div class="text-container">
                <div class="title">헤드폰</div>
                <div class="author">작성자: 김정환</div>
                <div class="price">가격: 100,000원</div>
                <div class="location">지역: 울산</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"
              />
              <div class="text-container">
                <div class="title">스피커</div>
                <div class="author">작성자: 이준호</div>
                <div class="price">가격: 150,000원</div>
                <div class="location">지역: 수원</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"
              />
              <div class="text-container">
                <div class="title">무선 충전기</div>
                <div class="author">작성자: 박소현</div>
                <div class="price">가격: 50,000원</div>
                <div class="location">지역: 전주</div>
              </div>
            </div>
            <div class="swiper-slide">
              <img
                src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"
              />
              <div class="text-container">
                <div class="title">게임 콘솔</div>
                <div class="author">작성자: 신동엽</div>
                <div class="price">가격: 400,000원</div>
                <div class="location">지역: 창원</div>
              </div>
            </div>
          </div>

          <!-- If we need pagination -->
          <div class="swiper-pagination"></div>

          <!-- If we need navigation buttons -->
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
      </div>

      <script>
        // 첫 번째 슬라이더 동작 정의
        const swiper1 = new Swiper("#content_1 .swiper", {
          autoplay: {
            delay: 3000, // 3초마다 이미지 변경
          },
          loop: true, // 반복 재생 여부
          slidesPerView: 3, // 한 번에 보여지는 슬라이드 수
          slidesPerGroup: 1, // 한 번에 넘어가는 슬라이드 수
          pagination: {
            // 페이징 버튼 클릭 시 이미지 이동 가능
            el: "#content_1 .swiper-pagination",
            clickable: true,
          },
          navigation: {
            // 화살표 버튼 클릭 시 이미지 이동 가능
            prevEl: "#content_1 .swiper-button-prev",
            nextEl: "#content_1 .swiper-button-next",
          },
        });

        // 두 번째 슬라이더 동작 정의
        const swiper2 = new Swiper("#content_2 .swiper", {
          autoplay: {
            delay: 10000, // 3초마다 이미지 변경
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
            delay: 100000, // 3초마다 이미지 변경
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
