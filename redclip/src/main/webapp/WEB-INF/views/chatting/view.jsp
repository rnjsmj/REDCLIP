<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<style>
	.clr-fix::after {
            clear: both;
            width: 100%;
            content: '';
            display: block;
        }
        
       /* 헤더 마진 삭제 */
       #hd .navbar {
       	margin-bottom:0 !important;
       }

        body {
            overflow-x: hidden;
        }

      #content {
      	ul {
            list-style: none;
        }
        p {
        	margin-bottom : 0;
        }
      }
        .clr-fix::after {
            clear: both;
            width: 100%;
            content: '';
            display: block;
        }
        

        #content {
            min-width: 960px;
        }

        #page1 {
            display: flex;
            height: calc(100vh - 71px);
        }

        .sidebar {
            width: 400px; /* 왼쪽 목록의 고정 너비 */
            border-right: 1.5px solid #33333325;
            color: #303030;
        }

        .sidebar ul {
            list-style-type: none;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar-tab {
            height: 50px;
            padding: 10px;
            text-align: right;
            border-bottom: 1px solid #33333325;
        }

        .chat-room:first-child {
            border-top: 1px solid #33333325;
        }

        .chat-room {
            width: 100%;
            height: 150px;
            border-bottom: 1px solid #33333325;
            padding: 20px;
        }

        .chat-area {
            flex: 1; /* 오른쪽 채팅 부분이 줄어들도록 설정 */
            display: flex;
            flex-direction: column;
        }

        .chat-header {
            background-color: #f3f3f5;
            color: #303030;
            padding: 10px;
            text-align: left;
            height: 80px;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            justify-content: space-between;
        }

        .chat-header-left {
            display: flex;
            align-items: center;
        }
         .chat-header-right {
        	display:flex;
        	align-items: center;
        	
        	> button  {
        		padding: 5px;
			    line-height: 1;
			    height: 30px;
			    font-size: 14px;
    			font-weight: bold;
        	}
        }
       

        #profile-name {
            margin: 0;
            margin-left: 10px;
        }

        #nickname {
            font-weight: bold;
            font-size: 20px;
            display: inline-block;
        }
        #level {
            margin-left: 1px;
            display: inline-block;
            vertical-align: text-bottom;
            border: 2px solid orange;
            color: orange;
            font-weight: 500;
            border-radius: 10px;
            padding: 0 2px;
            font-size: 12px;
        }

        p {
            margin: 0;
        }

        .search-container {
            display: flex;
            align-items: center;
            margin-left:5px;
        }
        .search-container input[type='text'] {
            padding: 5px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 150px;
            margin-right: 10px;
            height: 40px;
        }

        .profile-img {
            width: 50px;
            height: 50px;
            border-radius: 50px;
            background-color: #898989;
            text-align: center;
            align-content: center;
            color: #fff;
        }

        .chat-messages {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }

        .chat-input {
            display: flex;
            padding: 10px;
            background-color: #f1f1f1;
        }


        .message {
            margin: 10px 0;
            padding: 10px;
            border-radius: 10px;
            max-width: 60%;
            display: inline-block;
            font-size: 18px;
            
            p {
            	word-break: break-all;
            }
        }
        
        .chat-div {
        	font-size: 13px;
		    color: gray;
        }
        .send-div {
        	text-align:right;
        	
        }
       

        .send {
            align-self: flex-end;
            background-color: #11aa00;
            color: #fff;
            text-align: left;
            margin-left : 5px;
        }
        
        .receive-div {
        
        }

        .receive {
            align-self: flex-start;
            background-color: #ffffff;
            color: #000;
            border: 1px solid #ccc;
            margin-right: 5px;
        }

        .chat-input input {
            flex: 1;
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .chat-input button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .chat-input button:hover {
            background-color: #0056b3;
        }

        .list-img {
            margin-right: 20px;
            width: 70px;
            height: 70px;
            border-radius: 50px;
            background-color: #898989;
            text-align: center;
            align-content: center;
            color: #fff;
        }

        .chat-list {
            padding: 0;
            list-style-type: none;
            max-height: calc(100vh - 121px);
            overflow-y: auto;
        }

        .chat-item {
            display: flex;
            align-items: center;
            background-color: #fff;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            height: 120px;
        }

        .chat-item.active {
            background-color: #33333325;
        }

        .chat-item:hover {
            background-color: #33333325;
        }
        .chat-item img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .chat-details {
            flex-grow: 1;
                width: 319px;
            
            .badge {
            	background-color: #007300;
            }
        }
        .nickname {
            font-weight: bold;
            margin: 0;
            display: inline;
            margin-right: 10px;
        }
        .latest-message {
            color: #666;
            margin: 5px 0 0;
            white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        }

        .small-detail {
            font-size: 14px;
            color: #999;
        }

        .chat-link {
            color: #fff;
            text-decoration: none;
             
        }

        .chat-link:hover {
            text-decoration: underline;
        }

        .tab-badge:not(.active):hover {
            background-color: #33333325;
        }

        .tab-badge {
            cursor: pointer;
            border: 1px solid #33333325;
            border-radius: 20px;
            padding: 5px 7px;
            margin-left: 3px;
            font-size: 14px;
            font-weight: bold;
        }

        .tab-badge.active {
            background-color: #007300;
            color: #fff;
            border: 1px solid #007300;
        }
</style>
</head>
<body>
	
	<div id="hd">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	</div>
	<div class="content clr-fix" id="content">
		<section class="page" id="page1">
                <div class="sidebar">
                    <!-- 카테고리, 선택 시 배경 색 바뀌는 자바스크립트 추가 예정-->
                    <div class="sidebar-tab">
                        <span class="tab-badge active" id="tab-all">전체</span>
                        <span class="tab-badge" id="tab-barter">게시글</span>
                        <span class="tab-badge" id="tab-reply">답글</span>
                    </div>
                    <script>
                        $(document).ready(function () {
                            $('.tab-badge').on('click', function () {
                                $('.tab-badge').removeClass('active');
                                $(this).addClass('active');
                                
                                switch ($(this).attr('id')) {
                                case 'tab-all' : selectList(); break;
                                case 'tab-barter' : selectList('barter'); break;
                                case 'tab-reply' : selectList('reply'); break;
                                };
                            });
                        });
                    </script>
                    <!-- 채팅방 목록 -->
                    <div class="chat-room-list">
                        <ul class="chat-list">
                            
                        </ul>
                    </div>
                </div>
                <script>
                	
                    $(document).ready(() => {
                    	
                    	
                    	
                    	
                         
                    });
                    
                   /*  window.onload = function() {
                    	
                    };
                    */
                    
                    
                    
                </script>
                <!-- 오른쪽 영역 -->
                <div class="chat-area" style="display:none;">
                    <!-- 채팅 상대 정보 -->
                    <div class="chat-header">
                        <div class="chat-header-left">
                            <img class="profile-img" src="">
                            <div id="profile-name">
                                <p id="nickname">User2</p>
                                <!-- <p id="level">CLIP</p> -->
                            </div>
                        </div>
                        <div class="chat-header-right">
                        	
	                        <div class="search-container">
	                            <input type="text" placeholder="채팅 검색" />
	                        </div>
                        </div>
                    </div>
                    <!-- 채팅 내역 -->
                    <div class="chat-messages">
                    	
                    </div>
                    <!-- 채팅 입력창 -->
                    <div class="chat-input">
                        <input id="chat-input" type="text" placeholder="올바른 채팅 예절을 지켜주세요!" />
                        <button onclick="submitMessage()" id="sendbtn">Send</button>
                    </div>
                </div>
            </section>
			<script>
			   		
			   		
            $(document).ready( function() {
            	selectList();
            	openedChat();
            	
            	if( '${ sessionScope.RoomNo }' != '' ) {
            		const id= '#' + '${ sessionScope.RoomNo }';
            		$(id).trigger('onclick');
            		console.log(id + '로 트리거 동작');
            	}
            	
            	$(document).on('click', '.chat-item', function () {
                	if(socket) {
                		socket.close();
                	};
                	
                    $('.chat-item').removeClass('active');
                    $(this).addClass('active');
					
                    const roomNo = $(this).attr("id");
                    let onclick = 'submitMessage()';
                    $('#sendbtn').attr("onclick", onclick);
                    
                    var socketAddress = "ws://localhost/redclip/chatting/" + roomNo;
                    connect(roomNo);
                    
                    let messageList = '';
                    let chatProfile = '';
                    
                    // 선택한 채팅방 채팅내역 select
                    $.ajax({
                    	
                    	url : 'view/' + roomNo,
                    	type : 'get',
                    	success : result => {
                    		console.log(result);
                    		
                    		// 채팅 상대 (채팅창 헤더)
                    		let profile;
                    		let nickname;
                    		
                    		if (result.barterWriter === '${sessionScope.loginUser.userId}') {
                    			profile = result.replyProfil;
                    			nickname = result.replyNickname;
                    			$('.chat-header-right button').remove();
                    			$('.chat-header-right').prepend('<button class="btn btn-primary">거래 완료 요청</button>');
                    		} else {
                    			profile = result.barterProfile;
                    			nickname = result.barterNickname;
                    		}
                    		
                    		chatProfile += '<img class="profile-img" src="/redclip/' + profile + '">'
                    					+ '<div id="profile-name"><p id="nickname">'; 
                    		chatProfile += (nickname != null)
                    						? nickname + '</p></div>'
                    						: '(탈퇴한 회원)</p></div>';
                            
                    		
                    		
                    		// 채팅 내역
                    		(result.chatMessageList).map(( message ) => {
                    			let type = (message.senderId === '${sessionScope.loginUser.userId}') ? 'send' : 'receive';
                    			messageList += `<div class="\${type}-div chat-div">`
                    			
                    			let dateData = `<span class="\${type}-date">\${message.chatDate}</span>`;
                    			let messageData = `<div class="message \${type}"><p>\${message.chatMessage}</p></div>`;
                    			
                    			messageList += (message.senderId === '${sessionScope.loginUser.userId}') 
                    							? dateData + messageData
                    							: messageData + dateData;
                    			messageList +=  `</div>`;
                    			
                    			
                    		
                    		});
                    		$('.chat-header-left').html(chatProfile);
                    		$('.chat-messages').html(messageList);
                    		scrollToBottom();
                    	}
                    });
                    $('.chat-area').attr("id", roomNo);
                    $('.chat-area').show();

                }); 
            	
            });
            
            	
            const submitMessage = () => {
            	
            	const $roomNo = $('.chat-area').attr("id")
                const message = $('#chat-input').val();
                
                
                let today = new Date();
                
                let hours = today.getHours().toString().padStart(2, '0');
                let minutes = today.getMinutes().toString().padStart(2, '0');
                

                if (message.trim() !== '') {
                    const insValue = `<div class="send-div chat-div">
                    				  <span class="send-date">\${hours}:\${minutes}</span>
                    				  <div class="message send"><p>\${ message }</p></div></div>`;

                    const chatMessage = {
                    	roomNo : $roomNo,
                    	senderId : '${ sessionScope.loginUser.userId }',
                    	message : message
                    };
                    
            	
                    if (socket) {
                    	sendMessage = $roomNo + ', ' + '${ sessionScope.loginUser.userId }' + ', ' + message;
                    	socket.send(sendMessage);
                    } 
                    
                    $('.chat-messages').append(insValue);

                    $('#chat-input').val('');

                    scrollToBottom();
                    $('#chat-input').focus();
                }
                
                selectList();
            }

                const scrollToBottom = () => {
                    const chatContainer = $('.chat-messages');
                    chatContainer.scrollTop(chatContainer[0].scrollHeight);
                }

                () => {
                    scrollToBottom();
                };

                $('#chat-input').on('keypress', (e) => {
                    if (e.which === 13) {
                        submitMessage();
                    }
                });
               
                const selectList = (condition) => {
                	$.ajax({
                		
                		url : 'list',
                		type: 'get',
                		data : {
                			userId : '${ sessionScope.loginUser.userId }'
                		},
                		success : result => {
                			console.log(result);
                			let chatItems = '';
                			
                			switch (condition) {
                				case 'barter' :  result = result.filter((room) => room.barterWriter == '${sessionScope.loginUser.userId}'); break;
                				case 'reply' : result = result.filter ((room) => room.replyWriter == '${sessionScope.loginUser.userId}'); break;
                			}
                			
                			
                			result.map((room) => {
                				
                				let profile;
                				let nickname;
                				let villageName;
                				
                				if (room.barterWriter === "${ sessionScope.loginUser.userId }") {
                					profile = room.replyProfil;
                					nickname = room.replyNickname;
                					villageName = room.replyVillageName;
                				} else {
                					profile = room.barterProfil;
                					nickname = room.barterNickname;
                					villageName = room.barterVillageName;
                				}
                				
                				chatItems += `<li class="chat-item" id="\${room.roomNo}">
                							  <img class="list-img" src="/redclip/\${profile}">
                                    	      <div class="chat-details">
                                              <h5><span class="badge text-bg-secondary">
                                              <a class="chat-link" href="/redclip/barters/\${room.barterNo}">\${room.barterName}</a></span>
                                              </h5><p class="nickname">\${nickname}</p>
                                              <span class="small-detail">\${villageName}`;
                                        
                                chatItems +=  ( room.chatDate != null || room.chatMessage != null)
                                			 ? ` · \${room.chatDate}</span><p class="latest-message">\${room.chatMessage}</p></div></li>`
                                			 : `</span></div></li>`;
                                  
                				
                			});
                			$('.chat-list').html(chatItems);
                		}
                		
                	});
                	
                	
                	/* 
                	<li class="chat-item" id="11">
                    <!-- <img src="profile1.jpg" alt="Profile Picture 1"> -->
                    <div class="list-img">프사</div>
                    <div class="chat-details">
                        <h5>
                            <span class="badge text-bg-secondary"
                                ><a class="chat-link" href="#">교환 게시글 제목</a></span
                            >
                        </h5>
                        <p class="nickname">User 1</p>
                        <span class="small-detail">OO동 · 4시간 전</span>
                        <p class="latest-message" style="color: #303030; font-weight: bold">
                            Hello! How are you?
                        </p>
                    </div>
                </li> */
                };
                
                const openedChat = () => {
                	
                };
                
            </script>

            <section></section>
	</div>
	<c:if test="${ not empty sessionScope.RoomNo}">
   		<script>
   			const id= '#' + '${ sessionScope.RoomNo }';
   			console.log(id);
   			//$(id).addClass('active');
   			$(id).trigger('onclick');
   		</script>
   		<c:remove var="RoomNo" scope="session" />
   </c:if>
</body>
</html>