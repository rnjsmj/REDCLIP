<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<script>
        $(document).ready(function(){
          $('[data-toggle="popover"]').popover({
            html: true,
            content : function() {
                let popoverContent = '<ul id="popover-list"><li><a ">회원페이지</a></li>'
                                   + '<li><a href="/redclip/member/block">차단</a></li></ul>';
                return popoverContent;
            }
          });   
        });
        </script>
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
        
        .breadcrumb {
        	background-color:#fff;
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
        
        .popover-body {
        	width:100px;
        	ul {
        		margin:0;
        		list-style:none;
        		a {
        			color:#101010;
        		}
        		button {
        			background-color:#fff;
        			border:none;
        		}
        	}
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
        
        #carouselBarters {
        	width:100%;
        	height:600px;
        }
        
        #trade-image {
            width: 100%;
            margin: 0 auto;
            box-shadow: rgba(0, 0, 0, 0.35) 0px -50px 36px -28px inset;
            
            .carousel-item {
            	width: 100%;
            	height:600px;
            	overflow: hidden;
            	
            	img {
            	width:100%;
            	height:100%;
            	object-fit:cover;
            	
            	}
            }
            
            
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
            word-break: break-all;
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
        #userNickname {
        	a, span {
            font-weight: 600;
            color: #101010;
            cursor:pointer;
            }
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
        .btn-group #delbtn, #updbtn {
            color: #fff;
            cursor:pointer;
            
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
            display: flow-root;
        }
        .reply-img {
            width: 200px;
            height: 200px;
            margin-right: 20px;
            float: left;
            overflow:hidden;
            
            .carousel-item {
            	overflow: hidden;
   				 width: 200px;
    			height: 200px;
            }
        }
        
        .reply-img img {
        	width:100%;
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
            word-wrap:break-word;
        }
        
        .reply-list-content:after {
        
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
        
        .btn-group2 button {
        	margin-left:10px;
        	background-color:#e9eef7
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
        
        #updateModal * {
        	text-align:left;
        }
        
        #updateModalLabel {
        	font-size : 22px;
        	
        }
        
        
        .reply-content-area:before{
        	width: 100%; content: ""; clear: both;
        }
        
        .reply-content-area {
        	width: 100%;height: 100px;resize: none;margin-bottom: 10px; margin-top:10px;padding: 20px;
        }
        
        #edit-reply span {
        	float:right;
        	cursor:pointer;
        }
        #edit-reply span:hover {
        	color:#b6b9bf;
        	text-decoration:underline;
        }
        .reply-pre-list {
        	display:inline-block;
        	width:200px;
        	height:200px;
        	overflow:hidden;
        	
        	
        	> img {
        		width:100%;
        		height:100%;
        		object-fit:cover;
        	}	
        }
        
        .modal-content {
        	background-color: unset;
        	border : 0;
        }
        
        #carouselBarters-modal .carousel-item {
        	height:100%;
        	align-content: center;
        	
        	img {
        		object-fit: contain;
        		width: 960px;
        		height: 960px;
        	}
        }
        #heart {
        	float:right;
        	
        	svg:hover {
        		fill : darkgray;
        		cursor:pointer;
        	}
        }
        
        #report-div {
        	margin-top:20px;
        	a {
        		color:#999;
        		text-decoration:underline;
        		
        	}
        }
        
        #reportModal {
        	input {
        		margin-bottom:15px;
        	}
        	
        	textarea {
        		height:200px;
        	}
        }
        
        box-shadow: rgba(0, 0, 0, 0.35) 0px -50px 36px -28px inset;
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="content" id="content">
		<!--breadcrumb-->
            <section id="page1" class="page">
            <nav aria-label="breadcrumb">
               <ol class="breadcrumb">
                   <img src="/redclip/resources/img/house-door-fill.svg" style="margin-right: 4px" />
                   <li class="breadcrumb-item"><a href="/redclip">홈</a></li>
                   <li class="breadcrumb-item"><a href="/redclip/barters">상품목록</a></li>
                   <li class="breadcrumb-item active" aria-current="page">${ barter.barterName }</li>
               </ol>
           </nav>
                <div id="detail-wrap">
                <c:if test="${ barter.barterFileList[0].barterFileNo != 0 }">
                    <div id="trade-image">
                        <!-- <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel"> -->
                        <div id="carouselBarters" class="carousel slide" data-ride="carousel" data-interval="false">
                            <ol class="carousel-indicators">
                                <!-- <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li> -->
                                <c:forEach var="barterFile" items="${ barter.barterFileList }" varStatus="status">
                                	<li data-target="#carouselBarters" data-slide-to="${ status.index }"></li>
                                </c:forEach>
                            </ol>
                            <div
                                class="carousel-inner"
                                data-toggle="modal"
                                data-target="#barter-image-modal"
                                onclick="modalContent(this);">
                                <!-- <div class="carousel-item active"> -->
                                <c:forEach var="barterFile" items="${ barter.barterFileList }" >
                                
	                                <div class="carousel-item">
	                                    <img 
	                                        src="/redclip/${ barterFile.barterFileName }"
	                                        alt="${ barterFile.barterFileNo }"
	                                    />
	                                </div>
	                                
                                </c:forEach>
                            </div>
                            <a
                                class="carousel-control-prev"
                                href="#carouselBarters"
                                role="button"
                                data-slide="prev"
                            >
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a
                                class="carousel-control-next"
                                href="#carouselBarters"
                                role="button"
                                data-slide="next"
                            >
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                   
                    

                    
 					</c:if>
 					<!--이미지 모달 창-->
                    <div
                        class="modal fade"
                        id="barter-image-modal"
                        tabindex="-1"
                        role="dialog"
                        aria-labelledby="exampleModalCenterTitle"
                        aria-hidden="true"
                    >
                        <div class="modal-dialog modal-fullscreen-sm-down" role="document" style="position: relative; margin:auto; max-width:1200px; height:100%;">
                            <div class="modal-content" style="background-color: unset; border : 0; height:100%;">
                                <div class="modal-body">
                                	<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="position: absolute; top: 20px; right: 20px; z-index: 999">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <div
                                        id="carouselBarters-modal"
                                        class="carousel slide"
                                        data-ride="carousel"
                                        style="height:100%;"
                                        
                                    >
                                        <ol class="carousel-indicators" id="modal-indicators">
                                           
                                        </ol>
                                        <div class="carousel-inner modal-inner" style="height:960px; margin:auto;">
                                        
                                        </div>
                                        <a
                                            class="carousel-control-prev"
                                            href="#carouselBarters-modal"
                                            role="button"
                                            data-slide="prev"
                                            style="width:5%">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a
                                            class="carousel-control-next"
                                            href="#carouselBarters-modal"
                                            role="button"
                                            data-slide="next"
                                            style="width:5%">
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
                                    <li id="userNickname">
                                    <c:choose>
                                   		<c:when test="${ not empty barter.barterNickname }">
                                   			<c:choose>
		                                    	<c:when test="${ not empty sessionScope.loginUser.userId }">
		                                    		<a tabindex="0" data-toggle="popover" data-placement="right" data-trigger="focus" data-container="body" data-html="true" >
		                                        		${ barter.barterNickname }
		                                        	</a>
		                                    	</c:when>
		                                    	<c:otherwise>
		                                    		<span>${ barter.barterNickname }</span>
		                                    	</c:otherwise>
		                                    </c:choose>
                                   		</c:when>
                                   		<c:otherwise>
                                   			<span>(알 수 없음)</span>
                                   		</c:otherwise>
                                   	</c:choose>
                                    
                                      
                                    </li>
                                    <li id="level"><%-- ${ barter.point / 100 } 레벨 </li> --%>
                                    	<c:choose>
                                    		<c:when test="${ (barter.point / 100) lt '1'}">레벨1</c:when>
                                    		<c:when test="${ (barter.point / 100) lt '2'}">레벨2</c:when>
                                    	</c:choose>
                                    </li> 
                                    <li style="float: right; margin-top: 5px">
                                        <div class="progress" style="height: 7px; width: 100px">
                                            <div
                                                class="progress-bar"
                                                role="progressbar"
                                                style="width: ${ barter.point%100 }%; background-color: #149f55"
                                                aria-valuenow="25"
                                                aria-valuemin="0"
                                                aria-valuemax="100"
                                            ></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        
                        
                        <div class="modal fade reportModal" id="reportModal" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h3 class="modal-title fs-5" id="reportModalLabel">게시글 신고</h3>
						      </div>
						      <form id="reportForm" method="post" action="report">
						      <div class="modal-body report-body">
						      	
						      		<input class="form-control" id="report-no" name="referenceNo" value="${ barter.barterNo }" type="hidden" />
						      		<input class="form-control" id="report-name"  value="${ barter.barterName }" type="hidden" />
						      		<input class="form-control" id="reported-id" name="reportedId" value="${ barter.barterWriter }" type="hidden" />
						      		<input class="form-control" id="report-type" name="reportType" value="게시글" type="hidden" />
						      		<input class="form-control" id="report-title" name="reportTitle" type="text" maxlength="30" placeholder="신고 제목"/>
						      		<textarea class="form-control" id="report-content" name="reportContent" cols="5" maxlength="200" placeholder="신고 사유" style="resize:none;"></textarea>
						      	
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						        <button type="submit" class="btn btn-primary" onclick="">신고하기</button>
						      </div>
						      </form>
						    </div>
						  </div>
						</div>
						
						
                        <div id="content-info">
                            <div id="detail-data">
                                <span>${ barter.barterDate }</span>
                                <span> · </span>
                                <span>조회 ${ barter.hit }</span>
                                <span> · </span>
                                <span>좋아요 <span id="wishcount">${ barter.wishCount }</span></span>
                                <c:if test="${ (not empty sessionScope.loginUser.userId) && (sessionScope.loginUser.userId ne barter.barterWriter) }">
                                <p id="heart"><svg xmlns="http://www.w3.org/2000/svg" onclick="wish(1)" width="24" height="24" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
  												<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
												</svg></p>
								</c:if>
                            </div>
                            <div id="content-data">
                                ${ barter.barterContent }
                            </div>
                            <div id="report-div">
                            <c:if test="${not empty sessionScope.loginUser.userId }">
                            	<a type="button" data-toggle="modal" data-target="#reportModal">게시글신고</a>
                            </c:if>
                            </div>
                        </div>
                        <hr />
                        
                        <!--글 작성자에게만 보여질 버튼-->
                        <c:if test="${ (sessionScope.loginUser.userId eq barter.barterWriter) or (sessionScope.loginUser.status eq 'A')}">
                        <form action="" method="post" id="postForm">
                        	<input type="hidden" id="barterNo" name="barterNo" value="${ barter.barterNo }">
                        	<input type="hidden" name="fileExist" value="${barter.barterFileList[0].barterFileNo }" />
                        </form>
                        
                        <div class="btn-group" id="writer-btn">
                            <a onclick="updateBarter();" id="updbtn">수정</a>
                            <a onclick="deleteBarter();" id="delbtn">삭제</a>
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
                    <form id="input-reply" enctype="multipart/form-data">
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
                            <input type="file" id="reply-file" onchange="loadImg(this);" name="upfile" multiple/>
                        </form>
                        <!--script로 선택한 사진들 li로 출력-->
                       <div id="file-list-div"> 
                       		<ul id="file-list">
                       		
                       		</ul>
                       </div>
                       
                       
                       
                        </c:if>
                    <script>
                    	function loadImg(inputFile) {
                    		
                    		
                    		$('#file-list').html('');
        
                    		
                    		if(inputFile.files.length) {
                    			for(let i=0; i < inputFile.files.length; i++) {
                    				var reader = new FileReader();
                        			reader.readAsDataURL(inputFile.files[i]);
                        			reader.onload = e => {
                        				let preImage = '<li class="reply-pre-list"><img src="' + e.target.result + '"></li>';
                        				$('#file-list').append(preImage);
                        			}
                        			
                        		}
                    			
                    		} else {
                    			$('#file-list').html('');
                    		}
                    		
                    	};
                    </script>
                    <div id="reply-list">
                        <!--  답글 목록 -->
                	</div>
                
                </div>
                <script>
                
                	$(() => {
                		
                		selectReply();
                		addActive();
                		wishState();
                		
                	});
                	
                	function updateBarter() {
                		$('#postForm').attr("action", "update").submit();
                	};
                		
                	function deleteBarter() {
                		
                		if(confirm("글을 삭제하시겠습니까? 삭제된 게시글은 복구되지 않습니다.")) {
                			$('#postForm').attr("action", "delete").submit();
                		}
                	};
                	
                	function addActive() {
                    	$('.carousel-item:first-child').addClass('active');
                    	$('.reply-img .carousel-item:first-child').addClass('active');
                	};
                	
                	function wishState() {
                		
                		if('${sessionScope.loginUser.userId}' != '' ) {
	                		$.ajax({
	                			url:'wish',
	                			type:'get',
	                			data : {
	                				barterNo : ${barter.barterNo},
	                				wishUser : '${sessionScope.loginUser.userId}'
	                			},
	                			success : result => {
	                				const $heart = $('#heart');
	                				var svg;
	                				
	                				if(result === 'exist') {
	                					svg = '<svg xmlns="http://www.w3.org/2000/svg" onclick="wish(0)" width="24" height="24" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">'
	                	    		  		+ '<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/></svg>';
	                	        	
	                					
	                				} else {
	                					svg = '<svg xmlns="http://www.w3.org/2000/svg" onclick="wish(1)" width="24" height="24" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">'
	                						+ '<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/></svg>';
	                	        	
	                				}
	                				
	                				$heart.html(svg);
	                			}
	                		});
                		}
                	};
                	
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
                                            	  +'<div id="reply-img-' + result[i].replyNo + '" class="carousel slide" data-ride="carousel" data-interval="false">'
                                        		  + '<div class="carousel-inner" data-toggle="modal" data-target="#barter-image-modal" onclick="modalContent(this);">';
                						
                						for (let j in fileList) {
                							resultStr += '<div class="carousel-item">'
                                            		  + '<img src="/redclip/'
                                            		  + fileList[j].replyFileName
                                            		  + '" alt="이미지' + fileList[j].replyFileNo + '"/></div>';
                						}
                                       
                						resultStr += '</div>';
                						
                						if(fileList.length > 1) {
                                        resultStr += '<a class="carousel-control-prev"'
                                        		  + 'href="#reply-img-' + result[i].replyNo + '" '
                                            	  + 'role="button" data-slide="prev">'
                                            	  + '<span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="sr-only">Previous</span></a>'
                                            	  + '<a class="carousel-control-next" '
                                            	  + 'href="#reply-img-' + result[i].replyNo  
                                            	  + '" role="button" data-slide="next"> '
                                            	  + '<span class="carousel-control-next-icon" aria-hidden="true"></span>'
                                                  + '<span class="sr-only">Next</span></a>';
                                        }      
                						
                                        resultStr += '</div></figure>';
                						
                						
                						
                					}
                					
                					resultStr += '<div class="reply-detail">'
                							  + '<div class="reply-list-content" id="reply-content-' + result[i].replyNo + '">'
                                    		  + '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="40" height="40"><path d="M12 2.5a5.25 5.25 0 0 0-2.519 9.857 9.005 9.005 0 0 0-6.477 8.37.75.75 0 0 0 .727.773H20.27a.75.75 0 0 0 .727-.772 9.005 9.005 0 0 0-6.477-8.37A5.25 5.25 0 0 0 12 2.5Z"></path>'
                                    		  + '</svg><a href="">' + result[i].replyNickname 
                                    		  + '</a><span class="reply-date">' + result[i].replyDate + '</span><p>'
                                    		  + result[i].replyContent
                                    		  + '</p></div>';
                                    
                                    const userId = "${ sessionScope.loginUser.userId }";
                                    
                                    if( userId === "${ barter.barterWriter}") {
                                    	resultStr += '<div class="btn-group2" id="btn-group-' + result[i].replyNo +'"><button onclick="openChat(\'' +result[i].replyWriter+ '\');"'
                                    			  +' id="chatbtn" class="btn btn-light">채팅하기</button></div>'
                                    			  +'</div></div>';
                                    } else if( userId === result[i].replyWriter) {
                                    	resultStr += '<div class="btn-group2" id="btn-group-' + result[i].replyNo + '"><button id="updbtn" class="btn btn-light" data-toggle="modal" href="#updateModal"'
                                    			  + 'onclick="getReply(' + result[i].replyNo + ', 0)">수정</a>'
                                    			  + '<button id="rep-delbtn" class="btn btn-light"'
                                    			  + ' onclick="deleteReply('+ result[i].replyNo + ')">삭제</button></div>'
                                    			  + '</div></div>';
                                    } else {
                                    	resultStr += '</div></div>';
                                    }
                                    
                                    
                				};
                				if(result.length != 0) resultStr += "<hr/>";
                				$('#reply-list').html(resultStr);
                				
                			}
                			
                		});
                		
                	};
                	
                	
                	function saveReply() {
                		
                		if($('#reply-content').val().trim() != '') {
                			
                			var formData = new FormData();
                			var inputFile = $("#reply-file");
                			var files = inputFile[0].files;
                			
                			for (var i=0; i<files.length; i++) {
                				
                				formData.append("upfiles", files[i]);
                			}
                			
                			formData.append("barterNo", ${ barter.barterNo });
                			formData.append("replyContent", $('#reply-content').val());
                			formData.append("replyWriter", '${ sessionScope.loginUser.userId }');
                			
                			
                			$.ajax({
                				
                				url : 'reply',
                				type : 'post',
                				data : formData,
                				processData : false,
                				contentType : false,
                				success : result => {
                					
                					console.log(result);
                					if (result == 'success') {
                						
                						selectReply();
                						$('#reply-content').val('');
                						$('#reply-file').val('');
                						$('#file-list').html('');
                						
                						
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
                			
	                		var deleteData;
	                		
               				if($('#reply-img-'+no).length) {
               					console.log('deleteData true로 변경');
               					deleteData = true;
               				} else {
               					deleteData = false;
               				}
	                		
               				console.log(deleteData);
	                			
                			$.ajax({
                				
                				url : 'reply/' + no,
                				type : 'delete',
                				data : JSON.stringify(deleteData),
                    			contentType : 'application/json',
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
                	
                	function getReply(no, state) {
                		
                		console.log(no);
                		// 1. 선택한 답글 정보 SELECT 수행
                		// 2. p 태그를 textarea로 변환하여 select한 replyContent를 textarea에 출력
                		// 3. 내용 수정 후 다시 수정 버튼을 누르면 UPDATE 수행
                		var selectEl = '#reply-content-' + no;
           				var replyContentEl = '#reply-content-' + no + ' > p'; 
           				var btngroupEl = '#btn-group-' + no;
           				
           				$('#edit-reply').remove();
           				
           				if(state == 0) {
           					
	                		$.ajax({
	                			
	                			url : 'reply/' + no,
	                			type : 'get',
	                			success : result => {
	                				
	                				console.log(result);
	                				
	                				$(replyContentEl).hide();
	                				$(btngroupEl).hide();
	                				
	                				let replyContent = '<div id="edit-reply">'
	                				+ '<div style="width: 100%; content: "'+'"; clear: both"></div>'
	                                + '<textarea class="reply-content-area" id="edit-reply-content">'
	                                + result.replyContent + '</textarea>'
	                                + '<span style="margin-left: 10px" onclick="editReply('
	                				+ result.replyNo +')" >저장</span>'
	                				+ '<span style="margin-left: 10px" onclick="getReply('+ result.replyNo +', 1)">취소</span></div>';
	                                
	                				$(selectEl).append(replyContent);
	                				
	                			}
	                			
	                		});
                		
                		} else {
                			$(replyContentEl).show();
            				$(btngroupEl).show();
        					$('#edit-reply').remove();
                		}
                	};
                	
                	
                	function editReply(no) {
                		
                		const updateData = {
                				replyNo : no,
                				replyContent : $('#edit-reply-content').val()
                			};
                		
                		$.ajax({
                			
                			url : 'reply',
                			type : 'put',
                			data : JSON.stringify(updateData),
                			contentType : 'application/json',
                			success : result => {
                				console.log(result);
                				if(result == 'success') {
            						
            						selectReply();
            						
            					} else {
            						alert('오류가 발생했습니다.');
            					}
                			}
                			
                		});
                		
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
        	console.log('모달 동작');
            var innerContent = track.innerHTML;
            $('.carousel-inner.modal-inner').html(innerContent);
            
            var child = track.childElementCount;
            console.log(child);
            
           	let modalIndicators = '';
           	for (var step = 0; step < child; step++ ) {
           		modalIndicators += '<li data-target="#carouselBarters-modal" data-slide-to="'
           			 + step + '"></li>';
           	}
           	
           	
            $('#modal-indicators').html(modalIndicators);
            $('#modal-indicators').children().eq(0).addClass('active');
          
            $('#barter-image-modal').modal('show');
           	
        };
        
        function wish(state) {
        	
        	const $heart = $('#heart');
        	const $wishcount = $('#wishcount');
        	var wishcount;
        	var svg;
        	
        		
        	$.ajax({
        		url : 'wish',
        		type : 'post',
        		data : { barterNo : ${barter.barterNo},
        			wishUser : '${sessionScope.loginUser.userId}',
        			state : state
        			},
        		success : result => {
        			console.log(result);
            		wishcount = result; //좋아요 개수 반환받기
            		$wishcount.text(wishcount);
        			}
        		});
        	
        	if (state == 1) {
        		svg = '<svg xmlns="http://www.w3.org/2000/svg" onclick="wish(0)" width="24" height="24" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">'
    		  		+ '<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/></svg>';
        	} else {
        		svg = '<svg xmlns="http://www.w3.org/2000/svg" onclick="wish(1)" width="24" height="24" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">'
					+ '<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/></svg>';
        		
        	}
        	
        	$heart.html(svg);
        	
        	
        }
        
       
        function openChat(replyWriter) {
        	// 채팅하기 버튼을 누르면 컨트롤러로 이동
        	// => 채당 글 작성자, 답글 작성자로 채팅방 목록을 select
        	// 존재 하면 현재 글 번호로 글 번호 update 수행 후 채팅방 번호를 반환함
        	// 존재 하지 않으면 새로운 채팅방을 insert 하여 새로 추가된 채팅방 번호를 반환
        	//  => 방 번호를 파라미터로 WebSocket 주소를 지정하여 connect 수행 
        	console.log(replyWriter);
        	var roomNo;
        	
        	$.ajax({
        		
        		url : '../chatting/find',
        		type : 'get',
        		data : {
        			barterNo : ${ barter.barterNo },
        			barterWriter : '${ sessionScope.loginUser.userId }',
        			replyWriter : replyWriter
        		},
        		success : result => {
        			roomNo = result;
        			roomVar = roomNo;
        			connect(roomNo);
                	location.href = '../chatting/view';
        		}, error : err => {
        			console.log('오류가 발생했습니다.');
        			
        		}
        		
        	});
        	
        	
        	
        };
        
    	
    	window.onload = function() {
    		$('.carousel').carousel({
                interval: false,
            });
    		
    		addActive();
    		
    		
    		
    		/* $(document).on('click', '.carousel-inner', e => {
    			console.log('modal content 수정');
    			
    			var innerContent = e.innerHTML;
    			$('.carousel-inner.modal-inner').innerHTML = innerContent;
    			
    			var child = e.length;
                
               	let modalIndicators = '';
               	for (var step = 0; step < child; step++ ) {
               		let += '<li data-target="#carouselBarters-modal" data-slide-to="'
               			 + step + '"></li>';
               	}
               	
               	var child = e.childElementCount;
                $('#modal-indicators').children().eq(0).addClass('active');
    		}); */

            
    		
    	}
    </script>
</body>
</html>