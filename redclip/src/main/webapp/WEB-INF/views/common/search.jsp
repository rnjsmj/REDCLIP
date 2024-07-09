<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>검색창</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .search-container {
            position: relative;
            width: 400px;
            margin: 0 auto;
            margin-top: 80px;
            margin-bottom: 80px;
            display: flex;
        }
        .search-input {
            flex: 1;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px 0 0 5px;
            outline: none; /* Remove default focus border */
        }
        .search-input:focus {
            border-color: rgb(238, 60, 60); /* Change border color on focus */
        }
        .search-button {
            padding: 8px 16px;
            border: 1px solid #ccc;
            border-left: 0;
            background-color: rgb(238, 60, 60);
            color: white;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
        }
        .search-results {
            position: absolute;
            top: 40px;
            width: 100%;
            background: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: none;
            z-index: 1000;
        }
        .search-results.active {
            display: block;
        }
        .search-results .tab {
            display: flex;
            border-bottom: 1px solid #ccc;
        }
        .search-results .tab button {
            flex: 1;
            padding: 10px;
            border: none;
            background: none;
            cursor: pointer;
        }
        .search-results .tab button.active {
            border-bottom: 2px solid #858585;
            font-weight: bold;
        }
        .search-results .content {
            padding: 10px;
        }
        .search-results .content .recent-searches,
        .search-results .content .popular-searches {
            display: none;
        }
        .search-results .content .recent-searches.active,
        .search-results .content .popular-searches.active {
            display: block;
        }
        .search-results .content ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .search-results .content li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 5px 0;
        }
        .search-results .content li span {
            flex: 1;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .search-results .content li .delete-btn {
            cursor: pointer;
            color: #aaa;
            text-align: right;
            margin-right: 5px;
        }
        .search-results .actions {
            display: flex;
            justify-content: space-between;
            padding: 10px;
        }
        .search-results .actions button {
            border: none;
            background: none;
            cursor: pointer;
            color: #aaa;
        }
        .search-results .actions .clear-recent {
            visibility: visible;
        }
        .search-results .actions .clear-recent.hidden {
            visibility: hidden;
        }
        #no-recent-searches {
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <div class="search-container">
        <input type="text" class="search-input" placeholder="키워드를 입력해주세요." />
        <button class="search-button">검색</button>
        <div class="search-results">
            <div class="tab">
                <button class="active" data-tab="recent">최근검색어</button>
                <button data-tab="popular">인기검색어</button>
            </div>
            <div class="content">
                <div class="recent-searches active">
                    <ul id="recent-searches-list">
                        <li id="no-recent-searches">최근 검색어가 없습니다.</li>
                    </ul>
                </div>
                <div class="popular-searches">
                    <ul id="popular-searches-list">
                        <!-- 인기 검색어 리스트 -->
                   </ul>
               </div>
           </div>
           <div class="actions">
               <button id="clear-recent-searches" class="clear-recent">최근 검색어 전체 삭제</button>
               <button id="close-search-results">닫기</button>
           </div>
       </div>
   </div>
<script>
    const recentSearches = [];

    $(document).ready(function () {
        $('.search-input').on('focus', function () {
            $('.search-results').addClass('active');
        });

        $('.tab button').on('click', function () {
            $('.tab button').removeClass('active');
            $(this).addClass('active');
            const tab = $(this).data('tab');
            if (tab === 'recent') {
                $('.recent-searches').addClass('active');
                $('.popular-searches').removeClass('active');
                $('#clear-recent-searches').removeClass('hidden');
            } else {
                $('.recent-searches').removeClass('active');
                $('.popular-searches').addClass('active');
                $('#clear-recent-searches').addClass('hidden');
                fetchPopularSearches();
            }
        });

        function addSearchTerm() {
            const searchTerm = $('.search-input').val();
            if (searchTerm) {
                recentSearches.push(searchTerm);
                updateRecentSearches();
                $('.search-input').val('');
            }
        }

        $('.search-input').on('keypress', function (e) {
            if (e.key === 'Enter') {
                addSearchTerm();
            }
        });

        $('.search-button').on('click', function () {
            addSearchTerm();
        });

        $(document).on('click', '.delete-btn', function () {
            const index = $(this).data('index');
            recentSearches.splice(index, 1);
            updateRecentSearches();
        });

        $('#clear-recent-searches').on('click', function () {
            recentSearches.length = 0;
            updateRecentSearches();
        });

        $('#close-search-results').on('click', function () {
            $('.search-results').removeClass('active');
        });

        function updateRecentSearches() {
            const recentSearchesList = $('#recent-searches-list');
            recentSearchesList.empty();
            if (recentSearches.length === 0) {
                recentSearchesList.append('<li id="no-recent-searches">최근 검색어가 없습니다.</li>');
            } else {
                recentSearches.forEach((search, index) => {
                    recentSearchesList.append(
                        `<li><span>${search}</span><span class="delete-btn" data-index="${index}">삭제</span></li>`
                    );
                });
            }
        }

        function fetchPopularSearches() {
            $.ajax({
                url: '/api/popular_searches',
                method: 'GET',
                success: function (data) {
                    const popularSearchesList = $('#popular-searches-list');
                    popularSearchesList.empty();
                    data.forEach(function (search) {
                        popularSearchesList.append(`<li>${search.search_term}</li>`);
                    });
                },
            });
        }

        // 페이지 로드 시 초기 인기 검색어를 가져옴
        fetchPopularSearches();

        // 주기적으로 15분마다 인기 검색어를 갱신
        setInterval(fetchPopularSearches, 15 * 60 * 1000);
    });
</script>
</body>
</html>
