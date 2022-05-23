<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%
	//세션 객체에 저장된 세션 닉네임("sNickname") 가져와서 변수에 저장
	String sNickname = (String)session.getAttribute("sNickname");
 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 커뮤니티 QnA 답글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css'>
<link rel='stylesheet' href='https://raw.githubusercontent.com/forsigner/magic-check/master/css/magic-check.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:300,400'>
<link rel='stylesheet' href='http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
<link rel="stylesheet" href="AdminPage/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<script src="AdminPage/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
		$(document).ready( function() {
			$("#qnaTypeId").change(function(){
				let title = $('input[name=qna_title]').val();
				$("#qnaTitleId").val("["+$(this).val()+"] " + title );
			});
		});
</script>
</head>
<body>
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
				<a href="javascript:void(0)" onclick="confirmLogout()"><i class="icon ion-log-out" ></i></a>
			</div>
		</div>
		<div id="page-container">
			<div class="card">
				<div class="title">QnA 글 답변</div>
				
					<form action="QnaReplyPro.co" name="boardForm" method="post">
						<input type="hidden" name="qna_num" value="${param.qna_num}">
						<input type="hidden" name="page" value="${param.page}">
						<!-- 답글에 대한 원본글 관련 정보를 담는 board_re_ref, board_re_lev, board_re_seq 도 전달 -->
						<input type="hidden" name="qna_re_ref" value="${qnaArticle.getQna_re_ref() }">
						<input type="hidden" name="qna_re_lev" value="${qnaArticle.getQna_re_lev() }">
						<input type="hidden" name="qna_re_seq" value="${qnaArticle.getQna_re_seq() }">
						<table >
							<tr>
								<th><label for="qna_type">문의유형</label></th>
								<td>
									<select id="qnaTypeId" name="qna_type">
									  <option value="상품문의">상품문의</option>
									  <option value="배송문의">배송문의</option>
									  <option value="교환및반품문의">교환및반품문의</option>
									  <option value="주문변경및취소문의">주문변경및취소문의</option>
									  <option value="입금및결제문의">입금및결제문의</option>
									  <option value="기타문의">기타문의</option>
									</select>
								</td>
							</tr>
							<tr>
								<th><label for="qna_title">제목</label></th>
								<td><input type="text" name="qna_title" id="qnaTitleId"  required="required" value="Re:${qnaArticle.getQna_title() }">
								</td>
							</tr>
							<tr>
								<th><label for="qna_nickname">작성자</label></th>
								<td><input type="text" name="qna_nickname" value="<%=sNickname %>" readonly="readonly"></td>
							</tr>
							<tr>
								<th><label for="qna_date">작성일</label></th>
								<td><input type="text" name="qna_date" readonly="readonly" value="${qnaArticle.getQna_write_date() }">
								</td>
							</tr>
							<tr>
								<th><label for="qna_content">내용</label></th>
								<td>
									<textarea id="board_content" name="qna_content"  rows="20" cols="100">${qnaArticle.getQna_content() } 
									</textarea>
								</td>
							</tr>
						</table>
						<br>
						<section id="commandCell">	
							<input type="submit" value="답글등록">&nbsp;&nbsp;
							<input type="reset" value="다시쓰기">&nbsp;&nbsp;
							<input type="button" value="취소" onclick="history.back()">
						</section>
					</form>
				 </div>
			</div>
		</div>
	<span id="show-lable">Hello</span>
	<!-- partial -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js'></script>
	<script src="AdminPage/js/script.js"></script>
</body>
</html>