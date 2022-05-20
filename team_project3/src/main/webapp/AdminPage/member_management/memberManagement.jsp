<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css'>
<!-- <link rel='stylesheet' href='https://raw.githubusercontent.com/forsigner/magic-check/master/css/magic-check.css'> -->
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:300,400'>
<link rel='stylesheet' href='http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
<link rel="stylesheet" href="AdminPage/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
</head>
<body>
<!-- 페이징 처리 -->		
<c:set var="pageNum" value="${pageInfo.getPageNum() }" /> <!-- 현재 페이지 번호 --> 
<c:set var="maxPage" value="${pageInfo.getMaxPage() }" /><!-- 최대 페이지 수 --> 
<c:set var="startPage" value="${pageInfo.getStartPage() }" /><!-- 시작 페이지 번호 --> 
<c:set var="endPage" value="${pageInfo.getEndPage() }" /><!-- 끝 페이지 번호 --> 
<c:set var="listCount" value="${pageInfo.getListCount() }" /><!-- 총 게시물 수 --> 
<c:set var="listLimit" value="${pageInfo.getListLimit() }" /><!-- 표시할 페이지 수 --> 
	<div id="logo">
		<span class="big-logo">Admin</span> <span class="small-logo">&nbsp; A</span>
	</div>
	<div id="left-menu">
		<ul>
			<li class="#"><a href="MemberManagement.co"> <i class="ion-ios-person-outline"></i> <span>멤버관리</span></a></li>
			<li class="#"><a href="ProductConfirm.co"> <i class="icon ion-clipboard"></i> <span>검수현황</span></a></li>
			<li class="has-sub"><a href="#"> <i class="ion-ios-chatboxes-outline"></i> <span>커뮤니티</span>
			</a>
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
				<div class="title">회원현황</div>
				    <section class="row text-center placeholders">
				        <div class="col-6 col-sm-3">
				          <div class="panel panel-info">
				            <div class="panel-heading">VVVIP</div>
				            <div class="panel-body">
				              <h4>123</h4>
				            </div>
				          </div>
				        </div>
				        <div class="col-6 col-sm-3">
				          <div class="panel panel-success">
				            <div class="panel-heading">정상</div>
				            <div class="panel-body">
				              <h4>123</h4>
				            </div>
				          </div>
				        </div>
				        <div class="col-6 col-sm-3">
				          <div class="panel panel-warning">
				            <div class="panel-heading">정지</div>
				            <div class="panel-body">
				              <h4>123</h4>
				            </div>
				          </div>
				        </div>
				        <div class="col-6 col-sm-3">
				          <div class="panel panel-danger">
				            <div class="panel-heading">탈퇴</div>
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
						                    <th scope="col" class="th-title">이메일</th>
						                    <th scope="col" class="th-date">닉네임</th>
						                    <th scope="col" class="th-date">가입날짜</th>
						                    <th scope="col" class="th-date">현재상태</th>
						                </tr>
						                </thead>
						                <tbody>
						                <c:if test="${not empty memberManagementList and pageInfo.getListCount() > 0}">
											<c:forEach var="memberManagement" items="${memberManagementList }" varStatus="status">
								                <tr>
								                	<td><input type="checkbox" value="${memberManagement.getMember_code() }"></td>
								                	<td>${memberManagement.getMember_num() }</td>
								                    <td>
														<a href="MemberDetail.co?member_code=${memberManagement.getMember_code() }&page=${pageNum}">
								                    		${memberManagement.getMember_email() } </a>
								                    </td>
								                    <td>${memberManagement.getMember_nickname() }</td>
													<td>${memberManagement.getMember_service_log_join_date() }</td>
													<td>${memberManagement.getMember_service_log_status() }</td>
								                </tr>
							              </c:forEach>
										</c:if>
							         </tbody>
					            </table>
					            <button type="button" class="btn btn-primary">일괄 정상 변경 (Update)</button>
					            <button type="button" class="btn btn-success">일괄 정지 변경 (Update)</button>
					            <button type="button" class="btn btn-danger">일괄 탈퇴 승인 (Delete)</button>
					        </div>
    					</div>
    					<section id="pageList">
							<c:choose>
								<c:when test="${pageNum > 1}">
									<input type="button" value="이전" onclick="location.href='MemberManagementList.co?page=${pageNum - 1}'">
								</c:when>
								<c:otherwise>
									<input type="button" value="이전">
								</c:otherwise>
							</c:choose>
								
							<c:forEach var="i" begin="${startPage }" end="${endPage }">
								<c:choose>
									<c:when test="${pageNum eq i}">
										${i }
									</c:when>
									<c:otherwise>
										<a href="MemberManagementList.co?page=${i }">${i }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					
							<c:choose>
								<c:when test="${pageNum < maxPage}">
									<input type="button" value="다음" onclick="location.href='MemberManagementList.co?page=${pageNum + 1}'">
								</c:when>
								<c:otherwise>
									<input type="button" value="다음">
								</c:otherwise>
							</c:choose>
						</section>
					</div>
				</div>
			</div>
	<span id="show-lable">Hello</span>
	<!-- partial -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js'></script>
	<script src="AdminPage/js/script.js"></script>
	<script src="AdminPage/js/jquery-3.6.0.js"></script>
</body>
</html>
