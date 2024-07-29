<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 수정</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  .container {margin-bottom: 80px;}
  .title {margin-top: 40px; margin-bottom: 20px;}
  .form-row {
   display: flex;
   padding: 0;
   margin: 0;
 }
 .image-placeholder {
   width: 100%;
   height: 260px;
   display: flex;
   align-items: center;
   overflow: hidden;
   border: 1px solid #ddd;
}
 .image-preview {
   width: 100%;
   height: 100%;
   object-fit: cover;
   display: none;
 }
 .file-input {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   opacity: 0;
 }

</style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp" />
  <div class="container" style="max-width: 1140px;">
	<!-- breadcrumb -->
	<section>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
	        <img src="/redclip/resources/img/house-door-fill.svg" style="margin-right: 4px" />
	        <li class="breadcrumb-item"><a href="/redclip">홈</a></li>
	        <li class="breadcrumb-item"><a href="/redclip/barters">상품목록</a></li>
	        <li class="breadcrumb-item active" aria-current="page">게시글 수정</li>
	    </ol>
	</nav>
    <h2 class="title">게시글 수정</h2>
    <form id="updateForm" method="post" action="${pageContext.request.contextPath}/barters/update" enctype="multipart/form-data">
      <div class="form-group">
       <label for="name">상품명</label>
        <div class="input-group">
          <select class="form-control" id="categoryNo" name="categoryNo" style="max-width: 150px;" required >
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
          <input type="text" class="form-control" id="name" name="barterName" value="${barter.barterName}" maxlength="250" placeholder="내용을 입력해주세요." required>
        </div>
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" id="writer" class="form-control" value="${barter.barterWriter}" name="barterWriter" readonly>
      </div>
      <div class="form-group">
        <label>주소 입력</label>
        <div class="form-row">
          <div class="col">
            <select class="form-control" id="si" required>
              <option value="">시 선택</option>
              <option value="1">서울특별시</option>
              <option value="2">인천광역시</option>
            </select>
          </div>
          <div class="col">
            <select class="form-control" id="gu" disabled>
              <option value="">구 선택</option>
            </select>
          </div>
          <div class="col">
            <select class="form-control" id="dong" name="villageCode" disabled>
              <option value="">동 선택</option>
            </select>
          </div>
        </div>
      </div>
      <div class="form-group">
	    <label for="productDescription">상세 설명</label>
	    <textarea class="form-control" id="barterContent" name="barterContent" rows="4" placeholder="내용을 입력해주세요.">${barter.barterContent }</textarea>
	  </div>
      <div class="form-group">
	    <label>이미지 등록</label>
	    <div class="form-row">
	        <div class="col image-placeholder">
	            <img id="imagePreview1" class="image-preview" src="" alt="이미지 미리보기">
	            <input type="file" id="upfile" class="file-input" name="upfile" value="reupfile" onchange="loadImg(this, 1)">
	        </div>
	        <div class="col image-placeholder">
	            <img id="imagePreview2" class="image-preview" src="" alt="이미지 미리보기">
	            <input type="file" id="upfile" class="file-input" name="upfile" value="reupfile" onchange="loadImg(this, 2)">
	        </div>
	        <div class="col image-placeholder">
	            <img id="imagePreview3" class="image-preview" src="" alt="이미지 미리보기">
	            <input type="file" id="upfile" class="file-input" name="upfile" value="reupfile" onchange="loadImg(this, 3)">
	        </div>
	        <div class="col image-placeholder">
	            <img id="imagePreview4" class="image-preview" src="" alt="이미지 미리보기">
	            <input type="file" id="upfile" class="file-input" name="upfile" value="reupfile" onchange="loadImg(this, 4)">
	        </div>
	    </div>
	 </div>
	 <div align="center">
	     <button type="submit" class="btn btn-success">수정하기</button>
	     <button type="reset" class="btn btn-danger">취소하기</button>
     </div>
     </form>
    </section>
  </div>
  <script>
  $(() => {
      enteredData();
  });

  function enteredData() {
  //    console.log('Barter Data:', '${barter}');
  //    console.log('Category No:', '${barter.categoryNo}');
  //    console.log('City Code:', '${barter.region.cityCode}');
  //    console.log('Town Code:', '${barter.region.townCode}');
  //    console.log('Village Code:', '${barter.region.villageCode}');

      $('#categoryNo').val('${barter.categoryNo}');
      $('#si').val('${barter.region.cityCode}');

      const siValue = $('#si').val();
      if (siValue) {
          $.ajax({
              url: '/redclip/member/guSelect',
              type: 'GET',
              data: { si: siValue },
              success: response => {
                  console.log("구 데이터:", response);
                  const $guSelect = $('#gu');
                  $guSelect.empty().append('<option value="">구 선택</option>');
                  response.forEach((a) => {
                      $guSelect.append('<option value="' + a.townCode + '">' + a.townName + '</option>');
                  });
                  $guSelect.prop('disabled', false).val('${barter.region.townCode}');

                  const guValue = $('#gu').val();
                  if (guValue) {
                      $.ajax({
                          url: '/redclip/member/dongSelect',
                          type: 'GET',
                          data: { gu: guValue },
                          success: response => {
                              console.log("동 데이터:", response);
                              const $dongSelect = $('#dong');
                              $dongSelect.empty().append('<option value="">동 선택</option>');
                              response.forEach((a) => {
                                  $dongSelect.append('<option value="' + a.villageCode + '">' + a.villageName + '</option>');
                              });
                              $dongSelect.prop('disabled', false).val('${barter.region.villageCode}');
                          },
                          error: function() {
                              alert('오류가 발생했습니다.');
                          }
                      });
                  }
              },
              error: function() {
                  alert('오류가 발생했습니다.');
              }
          });
      }
  }

  function loadImg(inputFile, index) {
      const previewImage = $('#imagePreview' + index);
      if (inputFile.files.length) {
          const reader = new FileReader();
          reader.readAsDataURL(inputFile.files[0]);
          reader.onload = function(e) {
              previewImage.attr('src', e.target.result).show();
          };
      } else {
          previewImage.attr('src', '').hide();
      }
  }
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
                     url: '/redclip/member/guSelect', 
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
                  url: '/redclip/member/dongSelect',
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
	
	function loadImg(inputFile, index) {
	    const previewImage = document.getElementById('imagePreview' + index);

	    if (inputFile.files.length) {
	        const reader = new FileReader();
	        
	        reader.readAsDataURL(inputFile.files[0]);
	        reader.onload = function (e) {
	            previewImage.src = e.target.result;
	            previewImage.style.display = 'block';
	        };
	    } else {
	        previewImage.src = "";
	        previewImage.style.display = 'none';
	    }
	}

  </script>
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>