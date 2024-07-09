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
  <div class="container mt-5">
    <h2>상품 등록하기</h2>
    <form>
      <div class="form-group">
        <label for="productName">상품명</label>
        <div class="input-group">
          <select class="form-control" style="max-width: 150px;" required>
            <option>카테고리</option>
            <option>전자기기</option>
            <option>가구</option>
            <option>의류</option>
            <option>도서</option>
          </select>
          <input type="text" class="form-control" id="productName" maxlength="250" placeholder="내용을 입력해주세요." required>
        </div>
      </div>
      <div class="form-group">
        <label for="registrant">등록자</label>
        <input type="text" class="form-control" id="registrant" placeholder="이름을 입력해주세요." required>
      </div>
      <div class="form-group">
        <label>주소 입력</label>
        <div class="form-row">
          <div class="col">
            <select class="form-control" id="city" required>
              <option value="">시/도</option>
              <option value="서울특별시">서울특별시</option>
              <option value="부산광역시">부산광역시</option>
              <option value="대구광역시">대구광역시</option>
              <option value="인천광역시">인천광역시</option>
              <option value="광주광역시">광주광역시</option>
              <option value="대전광역시">대전광역시</option>
              <option value="울산광역시">울산광역시</option>
              <option value="세종특별자치시">세종특별자치시</option>
              <option value="경기도">경기도</option>
              <option value="강원도">강원도</option>
              <option value="충청북도">충청북도</option>
              <option value="충청남도">충청남도</option>
              <option value="전라북도">전라북도</option>
              <option value="전라남도">전라남도</option>
              <option value="경상북도">경상북도</option>
              <option value="경상남도">경상남도</option>
              <option value="제주특별자치도">제주특별자치도</option>
            </select>
          </div>
          <div class="col">
            <select class="form-control" id="district" required>
              <option value="">시/군/구</option>
            </select>
          </div>
          <div class="col">
            <select class="form-control" id="neighborhood" required>
              <option value="">읍/면/동</option>
            </select>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label for="productDescription">상품 상세 설명</label>
        <textarea class="form-control" id="productDescription" rows="4" placeholder="내용을 입력해주세요."></textarea>
      </div>
      <div class="form-group">
        <label>이미지 등록</label>
        <div class="form-row">
          <div class="col image-placeholder">
            <img id="imagePreview1" class="image-preview" src="#" alt="이미지 미리보기">
            <input type="file" class="file-input" id="imageUpload1" accept="image/*" required>
          </div>
          <div class="col image-placeholder">
            <img id="imagePreview2" class="image-preview" src="#" alt="이미지 미리보기">
            <input type="file" class="file-input" id="imageUpload2" accept="image/*">
          </div>
          <div class="col image-placeholder">
            <img id="imagePreview3" class="image-preview" src="#" alt="이미지 미리보기">
            <input type="file" class="file-input" id="imageUpload3" accept="image/*">
          </div>
          <div class="col image-placeholder">
            <img id="imagePreview4" class="image-preview" src="#" alt="이미지 미리보기">
            <input type="file" class="file-input" id="imageUpload4" accept="image/*">
          </div>
        </div>
      </div>
      <button type="submit" class="btn btn-success">등록하기</button>
    </form>
  </div>
  <script>
    const cityToDistricts = {
      '서울특별시': ['종로구', '중구', '용산구', '성동구', '광진구', '동대문구', '중랑구', '성북구', '강북구', '도봉구', '노원구', '은평구', '서대문구', '마포구', '양천구', '강서구', '구로구', '금천구', '영등포구', '동작구', '관악구', '서초구', '강남구', '송파구', '강동구'],
      '부산광역시': ['중구', '서구', '동구', '영도구', '부산진구', '동래구', '남구', '북구', '해운대구', '사하구', '금정구', '강서구', '연제구', '수영구', '사상구', '기장군'],
      // 나머지 시도와 구 데이터 추가
    };

    const districtToNeighborhoods = {
      '종로구': ['청운동', '신교동', '팔판동', '삼청동', '부암동', '평창동', '무악동', '교남동'],
      // 나머지 구와 읍면동 데이터 추가
    };

    document.getElementById('city').addEventListener('change', function() {
      const city = this.value;
      const districtSelect = document.getElementById('district');
      districtSelect.innerHTML = '<option value="">시/군/구</option>';
      const neighborhoodSelect = document.getElementById('neighborhood');
      neighborhoodSelect.innerHTML = '<option value="">읍/면/동</option>';
      if (cityToDistricts[city]) {
        cityToDistricts[city].forEach(district => {
          const option = document.createElement('option');
          option.value = district;
          option.textContent = district;
          districtSelect.appendChild(option);
        });
      }
    });

    document.getElementById('district').addEventListener('change', function() {
      const district = this.value;
      const neighborhoodSelect = document.getElementById('neighborhood');
      neighborhoodSelect.innerHTML = '<option value="">읍/면/동</option>';
      if (districtToNeighborhoods[district]) {
        districtToNeighborhoods[district].forEach(neighborhood => {
          const option = document.createElement('option');
          option.value = neighborhood;
          option.textContent = neighborhood;
          neighborhoodSelect.appendChild(option);
        });
      }
    });

    function handleFileSelect(event, previewId) {
      const input = event.target;
      const preview = document.getElementById(previewId);
      if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
          preview.src = e.target.result;
          preview.style.display = 'block';
        };
        reader.readAsDataURL(input.files[0]);
      } else {
        preview.src = '#';
        preview.style.display = 'none';
      }
    }

    document.getElementById('imageUpload1').addEventListener('change', function(event) {
      handleFileSelect(event, 'imagePreview1');
    });

    document.getElementById('imageUpload2').addEventListener('change', function(event) {
      handleFileSelect(event, 'imagePreview2');
    });

    document.getElementById('imageUpload3').addEventListener('change', function(event) {
      handleFileSelect(event, 'imagePreview3');
    });

    document.getElementById('imageUpload4').addEventListener('change', function(event) {
      handleFileSelect(event, 'imagePreview4');
    });
  </script>
</body>
</html>