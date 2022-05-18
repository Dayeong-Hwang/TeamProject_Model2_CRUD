<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검수현황</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css'>
<link rel='stylesheet' href='https://raw.githubusercontent.com/forsigner/magic-check/master/css/magic-check.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:300,400'>
<link rel='stylesheet' href='http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
<link rel="stylesheet" href="adminPageControl/style.css">
<link rel="stylesheet" href="adminPageControl/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'><link rel="stylesheet" href="./style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
</head>
<body>
	<!-- partial:index.partial.html -->
	<div id="logo">
		<span class="big-logo">Admin</span> <span class="small-logo">&nbsp; A</span>
	</div>
	<div id="left-menu">
		<ul>
			<li class="#"><a href="MemberManagement.co"> <i class="ion-ios-person-outline"></i> <span>멤버관리</span></a></li>
			<li class="#"><a href="ProductConfirm.co"> <i class="icon ion-clipboard"></i> <span>검수현황</span></a></li>
			<li class="has-sub"><a href="#"> <i class="ion-ios-chatboxes-outline"></i> <span>커뮤니티</span></a>
				<ul>
					<li><a href="NoticeList.co">공지사항</a></li>
					<li><a href="EventList.co">이벤트</a></li>
					<li><a href="QusetionList.co">Q&#38;A</a></li>
					<li><a href="CommunityWriteForm.co">글쓰기</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div id="main-content">
		<div id="header">
			<div class="header-left float-left">
				<i id="toggle-left-menu" class="ion-android-menu"></i>
			</div>
			<div class="header-right float-right">
				<i class="icon ion-log-out"></i>
			</div>
		</div>
		<div id="page-container">
			<div class="card">
				<div class="title">검수현황</div>
				    <section class="row text-center placeholders">
				        <div class="col-6 col-sm-3">
				          <div class="panel panel-info">
				            <div class="panel-heading">검수완료</div>
				            <div class="panel-body">
				              <h4>123</h4>
				            </div>
				          </div>
				        </div>
				        <div class="col-6 col-sm-3">
				          <div class="panel panel-success">
				            <div class="panel-heading">검수중</div>
				            <div class="panel-body">
				              <h4>123</h4>
				            </div>
				          </div>
				        </div>
				        <div class="col-6 col-sm-3">
				          <div class="panel panel-warning">
				            <div class="panel-heading">검수실패</div>
				            <div class="panel-body">
				              <h4>123</h4>
				            </div>
				          </div>
				        </div>
				        <div class="col-6 col-sm-3">
				          <div class="panel panel-danger">
				            <div class="panel-heading">판매완료</div>
				            <div class="panel-body">
				              <h4>123</h4>
				            </div>
				          </div>
				        </div>
				      </section>
				</div>
				
				
				
				<div class="card">
					<div class="title">목록</div>
					
					<div id="board-search">
					        <div class="container">
					            <div class="search-window">
					                <form action="" class="formCss">
										<select name="product" id="product">
										    <option value="">분류</option>
										    <option value="">상품명</option>
										    <option value="">상품</option>
										    <option value="">그다음</option>
										</select>
					                        <label for="search" class="blind">공지사항 내용 검색</label>
					                        <input id="search" type="search" name="" value="">
					                        <button type="submit" class="btn btn-dark">검색</button>
					                </form>
					            </div>
					        </div>
					    </div>
						 <div id="board-list">
					        <div class="container">
					        
					        
					            <table class="board-table">
					                <thead>
						                <tr>
						                    <th scope="col" class="th-num"></th>
						                    <th scope="col" class="th-num">번호</th>
						                    <th scope="col" class="th-title">판매품제목 </th>
						                    <th scope="col" class="th-date">판매품등록날짜</th>
						                    <th scope="col" class="th-date">승인날짜</th>
						                    <th scope="col" class="th-date">현재상태</th>
						                </tr>
						                </thead>
						                <tbody>
						                <tr>
						                    <td> <input type="checkbox"> </td>
						                    <td>3</td>
						                    <th>
						                      <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
						                      <p>테스트</p>
						                    </th>
						                    <td>2017.07.13</td>
						                    <td>2017.07.13</td>
						                    <td>검수중</td>
						                </tr>
						
						                <tr>
						                	<td> <input type="checkbox"> </td>
						                    <td>2</td>
						                    <th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
						                    <td>2017.06.15</td>
						                    <td>2017.07.13</td>
						                    <td>검수완료</td>
						                </tr>
					                </tbody>
					            </table>
					            <button type="button" class="btn btn-primary">검수완료</button>
					            <button type="button" class="btn btn-success">검수취소</button>
					            <button type="button" class="btn btn-danger">여긴뭐하지</button>
					        </div>
    					</div>
					</div>
				</div>
			</div>
	<span id="show-lable">Hello</span>
	<!-- partial -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js'></script>
	<script src="adminPageControl/script.js"></script>
</body>
</html>
