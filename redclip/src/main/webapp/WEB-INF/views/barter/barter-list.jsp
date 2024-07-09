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
              display: flex;
              justify-content: center;
              align-items: center;
              margin: 20px 0;
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
      </style>
   </head>
   <body>
       <div class="container">
           <nav aria-label="breadcrumb">
               <ol class="breadcrumb">
                   <img src="house-door-fill.svg" style="margin-right: 4px" />
                   <li class="breadcrumb-item"><a href="main.jsp" class="p-2 text-dark">홈</a></li>
                   <li class="breadcrumb-item active" aria-current="page">${ barter.barterName }</li>
               </ol>
           </nav>
           <div class="d-flex justify-content-between align-items-center mb-3">
               <div class="d-flex">
                   <select class="form-control filter-select" id="form-all">
                       <option selected>전체보기</option>
                       <option>전자기기</option>
                       <option>가구</option>
                       <option>의류</option>
                       <option>도서</option>
                   </select>
                   <select class="form-control filter-select">
                       <option selected>시</option>
                       <option>서울특별시</option>
                       <option>부산광역시</option>
                       <option>대구광역시</option>
                       <option>인천광역시</option>
                   </select>
                   <select class="form-control filter-select">
                       <option selected>구</option>
                       <option>종로구</option>
                       <option>중구</option>
                       <option>용산구</option>
                       <option>성동구</option>
                   </select>
                   <select class="form-control filter-select">
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
           <div id="card-container" class="row row-cols-1 row-cols-sm-3 row-cols-md-4 g-4">
               <!-- JavaScript에 의해 동적으로 카드가 추가됩니다 -->
           </div>
           <div class="btn">
               <button id="load-more-btn" class="btn btn-success load-more-btn">더보기</button>
           </div>
       </div>

       <script>
           const cardContainer = document.getElementById('card-container');
           const loadMoreBtn = document.getElementById('load-more-btn');
           let cardCount = 0;

           function createCard() {
               const col = document.createElement('div');
               col.className = 'col';
               const card = document.createElement('div');
               card.className = 'card shadow-sm';
               const svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
               svg.className = 'bd-placeholder-img card-img-top';
               svg.setAttribute('width', '100%');
               svg.setAttribute('height', '200');
               svg.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
               svg.setAttribute('role', 'img');
               svg.setAttribute('preserveAspectRatio', 'xMidYMid slice');
               svg.setAttribute('focusable', 'false');
               const title = document.createElementNS('http://www.w3.org/2000/svg', 'title');
               title.textContent = 'Placeholder';
               const rect = document.createElementNS('http://www.w3.org/2000/svg', 'rect');
               rect.setAttribute('width', '100%');
               rect.setAttribute('height', '100%');
               rect.setAttribute('fill', '#55595c');
               svg.appendChild(title);
               svg.appendChild(rect);
               card.appendChild(svg);
               const cardBody = document.createElement('div');
               cardBody.className = 'card-body';
               const cardText = document.createElement('p');
               cardText.className = 'card-text';
               cardText.textContent = '상품 어쩌고 저쩌고';
               cardBody.appendChild(cardText);
               const cardFooter = document.createElement('div');
               cardFooter.className = 'd-flex justify-content-between align-items-center';
               const btnGroup = document.createElement('div');
               btnGroup.className = 'btn-group';
               const viewBtn = document.createElement('button');
               viewBtn.className = 'btn btn-sm btn-outline-secondary';
               viewBtn.textContent = 'View';
               const editBtn = document.createElement('button');
               editBtn.className = 'btn btn-sm btn-outline-secondary';
               editBtn.textContent = 'Edit';
               btnGroup.appendChild(viewBtn);
               btnGroup.appendChild(editBtn);
               cardFooter.appendChild(btnGroup);
               const smallText = document.createElement('small');
               smallText.className = 'text-body-secondary';
               smallText.textContent = '9 mins';
               cardFooter.appendChild(smallText);
               cardBody.appendChild(cardFooter);
               card.appendChild(cardBody);
               col.appendChild(card);
               return col;
           }

           function loadMoreCards() {
               for (let i = 0; i < 20; i++) {
                   cardContainer.appendChild(createCard());
                   cardCount++;
               }
           }

           loadMoreBtn.addEventListener('click', loadMoreCards);

           // 초기 로드 시 20개 카드 추가
           loadMoreCards();
       </script>
   </body>
</html>