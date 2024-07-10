<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상품 등록</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  	.container {margin-bottom: 80px;}
  	.title {margin-top: 40px; margin-bottom: 20px;}
	.image-placeholder {
	  width: 100%;
	  height: 150px;
	  background-color: #ddd;
	  border: 1px solid #ccc;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  margin-bottom: 10px;
	  position: relative;
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
  <div class="container">
	<!-- breadcrumb -->
	<section id="page1" class="page">
	    <nav aria-label="breadcrumb">
	        <ol class="breadcrumb">
		        <img src="/redclip/resources/img/house-door-fill.svg" style="margin-right: 4px" />
		        <li class="breadcrumb-item"><a href="/redclip">홈</a></li>
		        <li class="breadcrumb-item"><a href="/redclip/barters">상품목록</a></li>
		        <li class="breadcrumb-item active" aria-current="page">${ barter.barterName }</li>
	    </ol>
	</nav>
    <h2 class="title">상품 등록하기</h2>
    <form id="enrollForm" method="post" action="${pageContext.request.contextPath}/barters/insert" enctype="multipart/form-data">
      <div class="form-group">
       <label for="name">상품명</label>
        <div class="input-group">
          <select class="form-control" style="max-width: 150px;" required>
            <option>카테고리</option>
            <option>전자기기</option>
            <option>가구</option>
            <option>의류</option>
            <option>도서</option>
          </select>
          <input type="text" class="form-control" id="name" name="barterName" maxlength="250" placeholder="내용을 입력해주세요." required>
        </div>
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" id="writer" class="form-control" value="${sessionScope.loginUser.userId }" name="barterWriter" readonly>
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
            <select class="form-control" id="dong" disabled>
              <option value="">동 선택</option>
            </select>
          </div>
        </div>
      </div>
      <div class="form-group">
	    <label for="productDescription">상세 설명</label>
	    <textarea class="form-control" id="barterContent" name="barterContent" rows="4" placeholder="내용을 입력해주세요."></textarea>
	  </div>
      <div class="form-group">
		<label>이미지 등록</label>
		<div class="form-row">
		    <div class="col image-placeholder">
		        <img id="imagePreview1" class="image-preview" src="" alt="이미지 미리보기">
		        <label for="upfile">첨부파일</label>
		        <input type="file" id="upfile" class="file-input" name="upfile" onchange="loadImg(this)">
		    </div>
		</div>
	</div>
    <button type="submit" class="btn btn-success" href="insert">등록하기</button>
    </form>
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
	
    
    function loadImg(inputFile) {
        if (inputFile.files.length) {
          const reader = new FileReader();
          reader.readAsDataURL(inputFile.files[0]);
          reader.onload = e => {
            document.getElementById('imagePreview1').src = e.target.result;
            document.getElementById('imagePreview1').style.display = 'block';
          };
        } else {
          document.getElementById('imagePreview1').src = "";
          document.getElementById('imagePreview1').style.display = 'none';
        }
      }

  </script>
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>