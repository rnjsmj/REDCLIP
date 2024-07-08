<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>상품 목록</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
  <style>
       .container {
           max-width: 960px;
       }

       .pricing-header {
           max-width: 700px;
       }

       .card-deck .card {
           min-width: 220px;
       }

       .navbar {
           display: flex;
           justify-content: space-between;
           align-items: center;
           width: 100%;
       }

       .navbar h5 {
           margin: 0;
           width: auto;
       }

       .btnbox {
           margin-left: auto;
           display: flex;
           gap: 10px;
       }
       .my-2 {
           margin-left: 20px;
       }

       .btn {
           margin: 0 auto;
           padding: 0 auto;
           text-align: center;
       }

       .bd-placeholder-img {
           font-size: 1.125rem;
           text-anchor: middle;
           -webkit-user-select: none;
           -moz-user-select: none;
           user-select: none;
       }

       .card-text {
           font-size: 14px;
       }

       .col {
           margin-bottom: 20px; /* 간격 20px로 설정 */
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

       .search {
           width: 500px;
           margin: auto;
           margin-bottom: 60px;
           display: flex;
           justify-content: center;
       }
       .search-button {
           width: 100px;
           margin-left: 10px;
       }
       .filter-select {
           margin: 0 5px;
       }
       .breadcrumb {
           background-color: transparent;
           padding: 0;
       }
       .load-more-btn {
           margin: 20px auto;
           display: block;
       }
   </style>
   </head>
   <body>
       <header id="header">
           <div
               class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm navbar"
           >
               <h5 class="my-0 font-weight-normal">회사이름이던 로고던 암거나</h5>
               <nav class="my-2 my-md-0 mr-md-3">
                   <a class="p-2 text-dark" href="#">물물교환</a>
                   <a class="p-2 text-dark" href="#">체팅</a>
                   <a class="p-2 text-dark" href="#">공지사항</a>
                   <a class="p-2 text-dark" href="#">FAQ</a>
               </nav>
               <nav class="btnbox">
                   <a class="btn btn-outline-primary" href="#" id="btn sign">회원가입</a>
                   <a class="btn btn-outline-primary" href="#" id="btn sign">로그인</a>
               </nav>
           </div>
       </header>

       <div class="container">
           <nav aria-label="breadcrumb">
               <ol class="breadcrumb">
                   <img src="house-door-fill.svg" style="margin-right: 4px" />
                   <li class="breadcrumb-item"><a href="#">홈</a></li>
                   <li class="breadcrumb-item active" aria-current="page">상품목록</li>
               </ol>
           </nav>

           <div class="search">
               <input type="text" class="form-control search-bar" placeholder="키워드를 입력해주세요." />
               <button id="btn-search" class="btn btn-outline-secondary search-button" type="button">검색</button>
           </div>

           <div class="d-flex justify-content-between align-items-center mb-3">
               <div class="d-flex">
                   <select class="form-control" id="form-all">
                       <option selected>전체보기</option>
                       <option>전자기기</option>
                       <option>가구</option>
                       <option>의류</option>
                       <option>도서</option>
                   </select>
                   <select class="form-control" id="city">
                       <option selected>시</option>
                       <option>서울특별시</option>
                       <option>인천광역시</option>
                   </select>
                   <select class="form-control" id="district">
                       <option selected>구</option>
                       <option>종로구</option>
                       <option>중구</option>
                       <option>용산구</option>
                       <option>성동구</option>
                   </select>
                   <select class="form-control" id="neighborhood">
                       <option selected>동</option>
                       <option>청운동</option>
                       <option>신교동</option>
                       <option>팔판동</option>
                       <option>삼청동</option>
                   </select>
               </div>
           </div>
           <div class="sub-title">
               <p>추천 물물교환</p>
           </div>
           <!-- 상품 카드가 표시될 곳 -->
           <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4" id="product-list"></div>
           <button id="load-more" class="btn btn-primary load-more-btn">더보기</button>
       </div>
       <script>
           const cityToDistricts = {
               서울특별시: [
                   '종로구',
                   '중구',
                   '용산구',
                   '성동구',
                   '광진구',
                   '동대문구',
                   '중랑구',
                   '성북구',
                   '강북구',
                   '도봉구',
                   '노원구',
                   '은평구',
                   '서대문구',
                   '마포구',
                   '양천구',
                   '강서구',
                   '구로구',
                   '금천구',
                   '영등포구',
                   '동작구',
                   '관악구',
                   '서초구',
                   '강남구',
                   '송파구',
                   '강동구',
               ],
               인천광역시: [
                   '중구',
                   '동구',
                   '미추홀구',
                   '연수구',
                   '남동구',
                   '부평구',
                   '계양구',
                   '서구',
                   '강화군',
                   '옹진군',
               ],
           };

           // 시 선택에 따라 구 업데이트
           document.getElementById('city').addEventListener('change', function () {
               const citySelect = this;
               const districtSelect = document.getElementById('district');
               const neighborhoodSelect = document.getElementById('neighborhood');

               // 선택된 시
               const selectedCity = citySelect.value;

               // 구 옵션 초기화
               districtSelect.innerHTML = '<option selected>구</option>';
               neighborhoodSelect.innerHTML = '<option selected>동</option>';

               if (cityToDistricts[selectedCity]) {
                   // 선택된 시에 해당하는 구 목록 가져오기
                   const districts = cityToDistricts[selectedCity];

                   // 구 옵션 추가
                   districts.forEach((district) => {
                       const option = document.createElement('option');
                       option.value = district;
                       option.textContent = district;
                       districtSelect.appendChild(option);
                   });
               }
           });

           // 구 선택에 따라 동 업데이트 (추가할 경우)
           document.getElementById('district').addEventListener('change', function () {
               const neighborhoodSelect = document.getElementById('neighborhood');

               // 동 옵션 초기화
               neighborhoodSelect.innerHTML = '<option selected>동</option>';

               // 선택된 구에 따른 동 목록 업데이트 로직을 여기에 추가하세요.
               // 예: if (selectedDistrict === '종로구') { ... }
           });

           let currentPage = 1;
           const itemsPerPage = 20;

           function fetchProducts(page) {
               $.get(`/api/products?page=${page}&limit=${itemsPerPage}`, function (data) {
                   const productList = $('#product-list');

                   data.forEach((product) => {
                       const productCard = `
                       <div class="col">
                           <div class="card shadow-sm">
                               <img src="${product.image}" class="card-img-top" alt="${product.title}">
                               <div class="card-body">
                                   <h5 class="card-title">${product.title}</h5>
                                   <p class="card-text">${product.description}</p>
                               </div>
                           </div>
                       </div>`;
                       productList.append(productCard);
                   });
               });
           }

           $(document).ready(function () {
               fetchProducts(currentPage);

               $('#load-more').on('click', function () {
                   currentPage++;
                   fetchProducts(currentPage);
               });
           });
       </script>
        <footer>
            <div class="footer-content">
                <div class="footer-left">
                    <p class="footer-info">회사 이름 | 주소 | 연락처</p>
                    <a href="#">이용약관</a>
                    <a href="#">개인정보처리방침</a>
                </div>
                <div class="footer-right">추가적인 정보나 링크가 여기에 올 수 있습니다.</div>
            </div>
            <div class="footer-bottom">&copy; 2023 Company Name. All rights reserved.</div>
        </footer>
    </body>
</html>