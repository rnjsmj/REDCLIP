<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
* {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .content ul {
            list-style: none;
        }
        .clr-fix::after {
            clear: both;
            width: 100%;
            content: '';
            display: block;
        }
        #hd {
            width: 100%;
            min-width: 960px;
            height: 90px;
            border-bottom: 1px solid #e0e0e0;
            padding-left: 20px;
            align-content: center;
            text-align: center;
        }
        #ft {
            width: 100%;
            min-width: 960px;
            height: 300px;
            background-color: #ececec;
            align-content: center;
            text-align: center;
        }

        #content {
            width: 1200px;
            min-width: 960px;
            margin: 0 auto;
            text-align: center;
        }
        #page1 {
            width: 960px;
            margin: 0 auto;
        }
        #detail-wrap {
            width: 960px;
            margin: 0 auto;
            margin-bottom: 50px;
        }
        #trade-image {
            width: 100%;
            margin: 0 auto;
        }
        #trade-info {
            width: 100%;
            padding: 20px;
        }
        #main-info {
            margin-bottom: 20px;
        }
        #left-info {
            width: 68%;
            float: left;
            text-align: left;
        }
        #left-info h2 {
            white-space: normal;
        }
        #left-info span {
            color: #393939;
        }
        #right-info {
            float: right;
            width: 30%;
            text-align: right;
        }
        #right-info svg {
            float: right;
            margin-left: 10px;
        }
        #userNickname a {
            font-weight: 600;
            color: #101010;
        }
        #level {
            color: #149f55;
        }
        #content-info {
            text-align: left;
        }
        #detail-data span {
            color: #6d6d6d;
        }
        #content-data {
            margin: 20px 0;
        }

        .btn-group {
            display: inline-block;
        }
        #writer-btn {
            float: left;
        }
        #user-btn {
            float: right;
        }
        .btn-group a {
            display: inline-block;
            width: 100px;
            background-color: #149f55;
            color: #fff;
            padding: 8px 0;
            border-radius: 5px;
        }
        .btn-group #delbtn {
            color: #fff;
        }

        #reply-wrap {
            margin-top: 30px;
            width: 100%;
            padding: 20px;
            text-align: left;
        }
        #reply-table {
            width: 100%;
        }
        #reply-table td[rowspan='2'] {
            width: 88%;
        }
        #reply-content {
            resize: none;
            width: 100%;
            height: 150px;
            padding: 20px;
        }
        #replybtn {
            float: right;
            width: 100px;
            background-color: #149f55;
            color: #fff;
            padding: 8px 0;
            border: none;
            border-radius: 5px;
            vertical-align: top;
            height: 100px;
            margin-bottom: 10px;
        }
        #input-reply label {
            float: right;
            cursor: pointer;
        }
        input[type='file'] {
            display: none;
        }

        #reply-list {
            margin-top: 50px;
        }

        .reply-item {
            width: 900px;
            margin: 0 auto;
            padding: 10px;
            min-height: 150px;
            position: relative;
        }
        .reply-img {
            width: 200px;
            height: 200px;
            margin-right: 20px;
            float: left;
            overflow:hidden;
        }
        
        .reply-img img {
        	width:100;
        	height:100%;
        	object-fit:cover;
        }

        .reply-detail {
            display: flex;
            padding: 20px 0;
        }

        .reply-list-content {
            display: inline-block;
            width: 100%;
        }

        .reply-list-content a {
            color: #101010;
            font-weight: 600;
            margin-left: 10px;
        }

        .reply-list-content p {
            margin-top: 10px;
            color: #333333;
        }

        .btn-group2 {
            display: block;
            position: absolute;
            bottom: 0;
            right: 0;
        }

        #page2 {
            width: 1200px;
            min-width: 1200px;
            margin: 0 auto;
            margin-top: 100px;
            text-align: left;
            padding-bottom: 100px;
        }
        #popular-list-wrap {
            margin-top: 20px;
        }
        .card-list {
            display: inline-block;
        }
        #popular-list .card {
            width: 283px;
            cursor: pointer;
        }
        #popular-list li:not(:last-child) {
            margin-right: 11px;
        }

        #popular-list .card-title {
            font-weight: 600;
        }
        #popular-list .card-date {
            color: #6d6d6d;
        }
        #popular-list .card-region {
            color: #393939;
        }
        .card-body li {
            display: block;
        }

        .modal-content {
            width: 100%;
        }

        .modal-dialog.modal-dialog-centered {
            width: 90%;
            max-height: 90vh;
        }
        
        h2 {
        	margin-bottom:10px;
        }
        
        #writer-btn #updbtn {
        	margin-right:5px;
        }
        .reply-date {
        	float:right;
        	color:#999;
        }
        
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="content" id="content">
		<!--breadcrumb-->
            <section id="page1" class="page">
            <nav aria-label="breadcrumb">
               <ol class="breadcrumb">
                   <img src="/redclip/resources/img/house.svg" style="margin-right: 4px" />
                   <li class="breadcrumb-item"><a href="/redclip">홈</a></li>
                   <li class="breadcrumb-item"><a href="/redclip/barters">상품목록</a></li>
                   <li class="breadcrumb-item active" aria-current="page">${ barter.barterName }</li>
               </ol>
           </nav>
                <div id="detail-wrap">
                    <div id="trade-image">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                            </ol>
                            <div
                                class="carousel-inner"
                                data-toggle="modal"
                                data-target="#trade-image-modal"
                                onclick="modalContent(this);"
                            >
                                <div class="carousel-item active">
                                    <img
                                        class="d-block w-100 img-fluid"
                                        src="https://via.placeholder.com/800x400?auto=yes&bg=777&fg=555&text=First slide"
                                        alt="First slide"
                                    />
                                </div>
                                <div class="carousel-item">
                                    <img
                                        class="d-block w-100"
                                        src="https://via.placeholder.com/800x400?auto=yes&bg=666&fg=444&text=Second slide"
                                        alt="Second slide"
                                    />
                                </div>
                                <div class="carousel-item">
                                    <img
                                        class="d-block w-100"
                                        src="https://via.placeholder.com/800x400?auto=yes&bg=555&fg=333&text=Third slide"
                                        alt="Third slide"
                                    />
                                </div>
                                <div class="carousel-item">
                                    <img
                                        class="d-block w-100"
                                        src="https://via.placeholder.com/800x400?auto=yes&bg=555&fg=333&text=Fourth slide"
                                        alt="Fourth slide"
                                    />
                                </div>
                            </div>
                            <a
                                class="carousel-control-prev"
                                href="#carouselExampleIndicators"
                                role="button"
                                data-slide="prev"
                            >
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a
                                class="carousel-control-next"
                                href="#carouselExampleIndicators"
                                role="button"
                                data-slide="next"
                            >
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>

                    <!--이미지 모달 창-->
                    <div
                        class="modal fade"
                        id="trade-image-modal"
                        tabindex="-1"
                        role="dialog"
                        aria-labelledby="exampleModalCenterTitle"
                        aria-hidden="true"
                    >
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div
                                        id="carouselExampleIndicators-modal"
                                        class="carousel slide"
                                        data-ride="carousel"
                                    >
                                        <ol class="carousel-indicators">
                                            <li
                                                data-target="#carouselExampleIndicators-modal"
                                                data-slide-to="0"
                                                class="active"
                                            ></li>
                                            <li data-target="#carouselExampleIndicators-modal" data-slide-to="1"></li>
                                            <li data-target="#carouselExampleIndicators-modal" data-slide-to="2"></li>
                                            <li data-target="#carouselExampleIndicators-modal" data-slide-to="3"></li>
                                        </ol>
                                        <div class="carousel-inner modal-inner"></div>
                                        <a
                                            class="carousel-control-prev"
                                            href="#carouselExampleIndicators-modal"
                                            role="button"
                                            data-slide="prev"
                                        >
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a
                                            class="carousel-control-next"
                                            href="#carouselExampleIndicators-modal"
                                            role="button"
                                            data-slide="next"
                                        >
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="trade-info">
                        <div id="main-info" class="clr-fix">
                            <div id="left-info">
                                <h2>${ barter.barterName }</h2>
                                <span>${ barter.categoryName }</span>
                                <span> · </span>
                                <span>${ barter.region.cityName }&nbsp;${ barter.region.townName }&nbsp;${ barter.region.villageName }</span>
                            </div>
                            <div id="right-info">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="70" height="70">
                                    <path
                                        d="M12 2.5a5.25 5.25 0 0 0-2.519 9.857 9.005 9.005 0 0 0-6.477 8.37.75.75 0 0 0 .727.773H20.27a.75.75 0 0 0 .727-.772 9.005 9.005 0 0 0-6.477-8.37A5.25 5.25 0 0 0 12 2.5Z"
                                    ></path>
                                </svg>
                                <ul>
                                    <li id="userNickname"><a href="">${ barter.barterNickname }</a></li>
                                    <li id="level">${ barter.point } 포인트</li>
                                    <li style="float: right; margin-top: 5px">
                                        <div class="progress" style="height: 7px; width: 100px">
                                            <div
                                                class="progress-bar"
                                                role="progressbar"
                                                style="width: ${ barter.point }%; background-color: #149f55"
                                                aria-valuenow="25"
                                                aria-valuemin="0"
                                                aria-valuemax="100"
                                            ></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <hr />
                        <div id="content-info">
                            <div id="detail-data">
                                <span>${ barter.barterDate }</span>
                                <span> · </span>
                                <span>조회 ${ barter.hit }</span>
                                <span> · </span>
                                <span>좋아요 ${ barter.wishCount }</span>
                            </div>
                            <div id="content-data">
                                ${ barter.barterContent }
                            </div>
                        </div>
                        <hr />
                        <!--글 작성자에게만 보여질 버튼-->
                        <c:if test="${ sessionScope.loginUser.userId eq barter.barterWriter }">
                        <div class="btn-group" id="writer-btn">
                            <a href="" id="updbtn">수정</a>
                            <a onclick="" id="delbtn">삭제</a>
                        </div>
                        </c:if>
                        <div class="btn-group" id="user-btn">
                            <a id="listbtn" href="/redclip/barters">목록</a>
                        </div>
                    </div>
                </div>
                <!-- 로그인한 사용자만 reply-wrap 볼 수 있음-->
                <div id="reply-wrap">
                <c:if test="${ not empty sessionScope.loginUser.userId && sessionScope.loginUser.userId ne barter.barterWriter }">
                    <div id="input-reply">
                            <table id="reply-table">
                                <tr>
                                    <td rowspan="2">
                                        <textarea
                                            name="replyContent"
                                            id="reply-content"
                                            placeholder="교환을 원하시면 답글을 달아주세요."
                                            required
                                        ></textarea>
                                    </td>
                                    <td><button type="button" id="replybtn" onclick="saveReply();">교환 신청</button></td>
                                </tr>
                                <tr>
                                    <td id="filebtn">
                                        <label for="reply-file">
                                            <svg
                                                width="100"
                                                height="40"
                                                viewBox="0 0 100 40"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <rect width="100" height="40" rx="5" fill="#D9D9D9" />
                                                <path
                                                    d="M46.9165 32.5298V8.87926H54.0756V32.5298H46.9165ZM38.6707 24.2841V17.125H62.3213V24.2841H38.6707Z"
                                                    fill="white"
                                                />
                                            </svg>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div>
                                            <span class="length"><span class="reply_length">0 </span> / 200</span>
                                        </div>
                                        <script>
                                            $('#reply-content').keyup(function (e) {
                                                var content = $(this).val();

                                                if (content.length == 0 || content == '') {
                                                    $('.reply_length').text('0');
                                                } else {
                                                    $('.reply_length').text(content.length);
                                                }

                                                if (content.length > 200) {
                                                    $(this).val($(this).val().substring(0, 199));
                                                }
                                            });
                                        </script>
                                    </td>
                                </tr>
                            </table>
                            <input type="file" id="reply-file" />
                        </div>
                        <!--script로 선택한 사진들 li로 출력-->
                       <div id="file-list"> 
                       
                       </div>
                        </c:if>
                    
                    <div id="reply-list">
                        <!--  답글 목록 -->
                	</div>
                
                </div>
                <script>
                
                	$(() => {
                		
                		selectReply();
                		
                	});
                	
                	function selectReply() {
                		
                		$.ajax({
                			
                			url : 'reply',
                			type : 'get',
                			data : { barterNo : ${ barter.barterNo }},
                			success : result => {
                				console.log(result);
                				
                				// 1. 답글 개수만틈 반복하여 답글 출력
                				// 2. 그 반복문 내부에서, replyFileList의 length가 0보다 크면 반복문으로 캐러셀 출력
                				// 3. 답글 내용 출력 
                				
                				let resultStr = '';
                				for (let i in result) {
                					
                					resultStr += '<hr /><div class="reply-item">';
                					
                					const fileList = result[i].replyFileList;
                					
                					if(fileList.length != 0) {
                						
                						resultStr += '<figure class="reply-img">'
                                            	  +'<div id="reply-img-' + result[i].replyNo + '" class="carousel slide" data-ride="carousel">'
                                        		  + '<div class="carousel-inner" data-toggle="modal" data-target="#trade-image-modal" onclick="modalContent(this);">';
                						
                						for (let j in fileList) {
                							resultStr += '<div class="carousel-item">'
                                            		  + '<img src="'
                                            		  + fileList.replyFileName
                                            		  + '" alt="' + fileList.replyFileNo + '"/></div>';
                						}
                                        		  
                                        resultStr += '</div><a class="carousel-control-prev"'
                                        		  + 'href="#reply-img-' + result[i].replyNo + '" '
                                            	  + 'role="button" data-slide="prev">'
                                            	  + '<span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span></a>'
                                            	  + '<a class="carousel-control-next" '
                                            	  + 'href="#reply-img-' + result[i].replyNo + 
                                            	  + '" role="button" data-slide="next"> '
                                            	  + '<span class="carousel-control-next-icon" aria-hidden="true"></span>'
                                                  + '<span class="sr-only">Next</span></a></div></figure>';
                						
                						$('.reply-img .carousel-inner').addClass('active');
                						
                					}
                					
                					resultStr += '<div class="reply-detail">'
                							  + '<div class="reply-list-content">'
                                    		  + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="40" height="40"><path d="M12 2.5a5.25 5.25 0 0 0-2.519 9.857 9.005 9.005 0 0 0-6.477 8.37.75.75 0 0 0 .727.773H20.27a.75.75 0 0 0 .727-.772 9.005 9.005 0 0 0-6.477-8.37A5.25 5.25 0 0 0 12 2.5Z"></path>'
                                    		  + '</svg><a href="">' + result[i].replyNickname 
                                    		  + '</a><span class="reply-date">' + result[i].replyDate + '</span><p>'
                                    		  + result[i].replyContent
                                    		  + '</p></div>';
                                    
                                    const userId = "${ sessionScope.loginUser.userId }";
                                    
                                    if( userId === "${ barter.barterWriter}") {
                                    	resultStr += '<div class="btn-group2"><a href="'
                                    			  +'" id="chatbtn" class="btn btn-light">채팅하기</a></div>'
                                    			  +'</div></div>';
                                    } else if( userId === result[i].replyWriter) {
                                    	resultStr += '<div class="btn-group2"><button onclick="editReply('
                                    			  + '" id="updbtn" class="btn btn-light">수정</a>'
                                    			  + result[i].replyNo + '); <button id="rep-delbtn" class="btn btn-light"'
                                    			  + ' onclick="deleteReply('+ result[i].replyNo + ')">삭제</button></div>'
                                    			  + '</div></div>';
                                    } else {
                                    	resultStr += '</div></div>';
                                    }
                                    
                                    
                				};
                				resultStr += "<hr/>";
                				 $('#reply-list').html(resultStr);
                				
                			}
                			
                		});
                		
                	};
                	
                	
                	function saveReply() {
                		
                		if($('#reply-content').val().trim() != '') {
                			
                			$.ajax({
                				
                				url : 'reply',
                				type : 'post',
                				//barterNo, replyContent, replyWriter
                				data : {
                					barterNo : ${ barter.barterNo },
                					replyContent : $('#reply-content').val(),
                					replyWriter : '${ sessionScope.loginUser.userId }'
                				},
                				success : result => {
                					
                					console.log(result);
                					if (result == 'success') {
                						
                						selectReply();
                						$('#reply-content').val('');
                						
                					}
                					
                				}
                			});
                			
                		} else {
                			alert('댓글 내용을 입력해주세요.');
                		}
                	};
                	
                	
                	function deleteReply(no) {
                		console.log(no);
                		
                		if(confirm('삭제하시겠습니까?')) {
                			
                			$.ajax({
                				
                				url : 'reply/' + no,
                				type : 'delete',
                				success : result => {
                					
                					console.log(result);
                					if(result == 'success') {
                						
                						selectReply();
                						alert('삭제되었습니다.');
                						
                					} else {
                						alert('오류가 발생했습니다.');
                					}
                				}
                				
                			});
                			
                		}
                		
                	};
                	
                	function editReply(no) {
                		
                		console.log(no);
                		
                		
            
                	}
                
                </script>
                
                
            </section>
            <section id="page2" class="page">
                <h4>${ barter.region.villageName } 인기 교환</h4>
                <div id="popular-list-wrap">
                    <!--해당 게시글 정보의 동 정보를 이용하여 가져온 인기글 리스트 (조회수 상위 4개 추후 댓글 개수로 바꿀지 고민중)-->
                    <div id="popular-list">
                        <ul>
                            <!-- 반복문으로 li 출력 -->
                            <li class="card-list">
                                <a>
                                    <div class="card">
                                        <img
                                            class="card-img-top"
                                            src="https://via.placeholder.com/300x300/"
                                            alt="Card image cap"
                                        />
                                        <div class="card-body">
                                            <ul>
                                                <li class="card-title">물물교환 상품 제목</li>
                                                <li class="card-date">O시간 전</li>
                                                <li class="card-region">서울시 중구 삼각동</li>
                                            </ul>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <!--반복문 끝-->
                            <li class="card-list">
                                <a>
                                    <div class="card">
                                        <img
                                            class="card-img-top"
                                            src="https://via.placeholder.com/300x300/"
                                            alt="Card image cap"
                                        />
                                        <div class="card-body">
                                            <ul>
                                                <li class="card-title">물물교환 상품 제목</li>
                                                <li class="card-date">O시간 전</li>
                                                <li class="card-region">서울시 중구 삼각동</li>
                                            </ul>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="card-list">
                                <a>
                                    <div class="card">
                                        <img
                                            class="card-img-top"
                                            src="https://via.placeholder.com/300x300/"
                                            alt="Card image cap"
                                        />
                                        <div class="card-body">
                                            <ul>
                                                <li class="card-title">물물교환 상품 제목</li>
                                                <li class="card-date">O시간 전</li>
                                                <li class="card-region">서울시 중구 삼각동</li>
                                            </ul>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="card-list">
                                
                                    <div class="card">
                                        <img
                                            class="card-img-top"
                                            src="https://via.placeholder.com/300x300/"
                                            alt="Card image cap"
                                        />
                                        <div class="card-body">
                                            <ul>
                                                <li class="card-title">물물교환 상품 제목</li>
                                                <li class="card-date">O시간 전</li>
                                                <li class="card-region">서울시 중구 삼각동</li>
                                            </ul>
                                        </div>
                                    </div>
                                
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
	
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
        $('.carousel').carousel({
            interval: false,
        });

        function modalContent(track) {
            var innerContent = track.innerHTML;
            $('.modal-inner').html(innerContent);
            console.log($('.modal-inner').html());
        }
    </script>
</body>
</html>