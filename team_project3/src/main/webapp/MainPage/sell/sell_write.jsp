<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%
 			//<<<<<<<<<<<p.413~~~~~~~~~~~443>>>>>>>사진 담당
// MemberBean bean =new MemberBean();
// String member_code =request.getParameter("id");
String member_nickname =(String)session.getAttribute("sNickname");
String sell_member_code =(String)session.getAttribute("sCode");

//BoardListAction 클래스에서 request 객체에 저장한 객체 꺼내기(getAttribute())
//=> "pageInfo" 와 "articleList" 라는 속성명을 사용하여 꺼내기
//=> 단, 리턴타입이 Object 타입이므로 각 데이터타입으로 강제 형변환 필요

%>   

<!DOCTYPE html>
<html lang="en">
<head>
<title>Product Detail</title>
<script src="../js/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
function optionChange() {            //대분류 소분류 <select/>
	var ko=['반팔','긴팔','롱슬리브'];
	var ja=['반바지','긴바지','와이드','슬랙스'];
	var sh=['스니커즈','워커','슬립온','슬리퍼'];
	var ka=['쥬얼리','모자','피규어'];
	var sizeCl=['S','M','L','XL','XXL'];
	var sizeSh=['230','235','240','245','250','260','265','270','275','280','285','290','295','300'];
	var v=$('#s0').val();
	var o;
	var s;
	if(v=='상의'){
		o=ko; s=sizeCl;
	}else if(v=='하의'){
		o=ja; s=sizeCl;
	}else if(v=='신발'){
		o=sh; s=sizeSh;
	} else if(v=='잡화'){
		o=ka; s=sizeCl;
	}
	else{
		o=ka;
	}
	// s0, s1 , s2
	$('#s1').empty();
	$('#s1').append('<option>선택해주세요.</option>');
	for(var i=0;i<o.length;i++){
		$('#s1').append('<option>'+o[i]+'</option>');	
	}
	$('#s2').empty();
	$('#s2').append('<option>선택해주세요.</option>');
	for(var i=0;i<s.length;i++){
		$('#s2').append('<option>'+s[i]+'</option>');
	}
	
	
}

// function checkPrice(sell_price){
// 	var regex = /^[0-9]{4}$/;
// 	if(!regex.exec(sell_price)) {
// 		alert("전화번호 뒷자리 4자리 숫자 필수!");
// 		history.back();
// 	} 


function readURL(obj) {   //사진 3장 뿌리기 
	
    let reader = new FileReader();
    if(!obj.files.length) {
        return;
    }
    for(let i=0;i<obj.files.length;i++){
    reader.readAsDataURL(obj.files[i]);
    reader.onload = function (e) {
        let img = $('<img  width=418,height=517 />');
        $(img).attr('src', e.target.result);
        $('#previewDiv').append(img);
    }
	}
    
}


</script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="MainPage/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="MainPage/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="MainPage/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="MainPage/css/util.css">
	<link rel="stylesheet" type="text/css" href="MainPage/css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	
	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
<!-- 			<div class="top-bar"> -->
<!-- 				<div class="content-topbar flex-sb-m h-full container"> -->
<!-- 					<div class="left-top-bar"> -->
<!-- 						Free shipping for standard order over $100 -->
<!-- 					</div> -->

<!-- 					<div class="right-top-bar flex-w h-full"> -->
<!-- 						<a href="#" class="flex-c-m trans-04 p-lr-25"> -->
<!-- 							Help & FAQs -->
<!-- 						</a> -->

<!-- 						<a href="#" class="flex-c-m trans-04 p-lr-25"> -->
<!-- 							My Account -->
<!-- 						</a> -->

<!-- 						<a href="#" class="flex-c-m trans-04 p-lr-25"> -->
<!-- 							EN -->
<!-- 						</a> -->

<!-- 						<a href="#" class="flex-c-m trans-04 p-lr-25"> -->
<!-- 							USD -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="MainPage.pr" class="logo">
						<img src="MainPage/images/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li>
								<a href="MainPage.pr">Home</a>
<!-- 								<ul class="sub-menu"> -->
<!-- 									<li><a href="index.html">Homepage 1</a></li> -->
<!-- 									<li><a href="home-02.html">Homepage 2</a></li> -->
<!-- 									<li><a href="home-03.html">Homepage 3</a></li> -->
<!-- 								</ul> -->
							</li>

							<li>
								<a href="Product.pr">Shop</a>
							</li>

<!-- 							<li class="label1" data-label1="hot"> -->
<!-- 								<a href="shoping-cart.html">Features</a> -->
<!-- 							</li> -->

							<li>
								<a href="SellForm.pr">Sell</a>
							</li>

							<li>
								<a href="CommunityNotice.ma">Community</a>
							</li>
			
							<li>
								<a href="Contact.pr">Contact</a>
							</li>
						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="MainPage/images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Free shipping for standard order over $100
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Help & FAQs
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							My Account
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							EN
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							USD
						</a>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="index.html">Home</a>
					<ul class="sub-menu-m">
						<li><a href="index.html">Homepage 1</a></li>
						<li><a href="home-02.html">Homepage 2</a></li>
						<li><a href="home-03.html">Homepage 3</a></li>
					</ul>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="ProductForm.pr">Shop</a>
				</li>

				<li>
					<a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
				</li>

				<li>
					<a href="blog.html">Blog</a>
				</li>

				<li>
					<a href="about.html">About</a>
				</li>

				<li>
					<a href="contact.html">Contact</a>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="MainPage/images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="MainPage/images/item-cart-01.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat
							</a>

							<span class="header-cart-item-info">
								1 x $19.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="MainPage/images/item-cart-02.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star
							</a>

							<span class="header-cart-item-info">
								1 x $39.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="MainPage/images/item-cart-03.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather
							</a>

							<span class="header-cart-item-info">
								1 x $17.00
							</span>
						</div>
					</li>
				</ul>
				
				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
						Total: $75.00
					</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart
						</a>

						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
				Men
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Lightweight Jacket
			</span>
		</div>
	</div>
		


	<!-- Product Detail -->
<form action="SellWritePro.pr?sell_member_code=<%=sell_member_code %>" name="sellForm" method="post" enctype="multipart/form-data">	
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<h3 >&nbsp;&nbsp;&nbsp;&nbsp; <%=member_nickname %>님의 판매글 작성</h3>
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="slick3 gallery-lb">
								<!--사진 -->
								<div class="item-slick3" data-thumb=""> 
									<div class="wrap-pic-w pos-relative">
										 <!--  파일추가  -->
								<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
								<div id="container">
								    <div class="slide_wrap">
								      <div class="slide_box">
								        <div class="slide_list clearfix">
<%-- 								          <%for(int i=0;i<3;i++){ %> --%>
								          <div class="slide_content slide01">
								             <div id="previewDiv" ></div>
								          </div>
								          <div class="slide_content slide02">
								           	 
								          </div>
								          <div class="slide_content slide03">
								          
								          </div>
<%-- 								          <%} %> --%>
								        </div>
								        <!-- // .slide_list -->
								      </div>
								      <!-- // .slide_box -->
								      <div class="slide_btn_box">
								        <button type="button" class="slide_btn_prev">Prev</button>
								        <button type="button" class="slide_btn_next">Next</button>
								      </div>
								      <!-- // .slide_btn_box -->
								      <ul class="slide_pagination"></ul>
								      <!-- // .slide_pagination -->
								    </div>
								    <!-- // .slide_wrap -->
								  </div>
								  <!-- // .container -->		   
<!-- 	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	-->
 <style>
	 	html, body { box-sizing: border-box; padding: 0; margin: 0; text-align: center; }
	    *, *:before, *:after { box-sizing: inherit; }
	    .clearfix:after { content: ''; display: block; clear: both; float: none; }
	    .title { margin-bottom: 0; text-align: center; font-size: 30px; color: #333; }
	    .link, .link:visited { display: inline-block; margin: 20px 0; color: #555; text-decoration: none; font-weight: bold; }
	    .link:hover, .link:focus { color: #9fd6c2; }
	    /* container - body */
/* 	    #container { width: 1000px; margin: auto; } */
	    .slide_wrap { position: relative; width: 400px; margin: auto; padding-bottom: 30px; }
	    .slide_box { width: 100%; margin: auto; overflow-x: hidden; }
	    .slide_content { display: table; float: left; width: 400px; height: 400px; }
	    .slide_content > p { display: table-cell; vertical-align: middle; text-align: center; font-size: 100px; font-weight: bold; color: #555; }
	    .slide_content.slide01 { background: #ddbdff; }
	    .slide_content.slide02 { background: #9fd6c2; }
	    .slide_content.slide03 { background: #abe2f7; }
	    .slide_content.slide04 { background: #f08c78; }
	    .slide_content.slide05 { background: #fbdb65; }
	    .slide_btn_box > button { position: absolute; top: 50%; margin-top: -45px; width: 60px; height: 60px; font-size: 16px; color: #999; background: none; border: 1px solid #ddd; cursor: pointer; }
	    .slide_btn_box > .slide_btn_prev { left: -100px; }
	    .slide_btn_box > .slide_btn_next { right: -100px; }
	    .slide_pagination { position: absolute; left: 50%; bottom: 0; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }
	    .slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }
	    .slide_pagination .dot.dot_active { background: #333; }
	    .slide_pagination .dot a { display: block; width: 100%; height: 100%; }
 </style>
<!--  -->
<script type="text/javascript">
(function () {
    const slideList = document.querySelector('.slide_list');  // Slide parent dom
    const slideContents = document.querySelectorAll('.slide_content');  // each slide dom
    const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
    const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
    const pagination = document.querySelector('.slide_pagination');
    const slideLen = slideContents.length;  // slide length
    const slideWidth = 400; // slide width
    const slideSpeed = 300; // slide speed
    const startNum = 0; // initial slide index (0 ~ 4)
    
    slideList.style.width = slideWidth * (slideLen + 2) + "px";
    
    // Copy first and last slide
    let firstChild = slideList.firstElementChild;
    let lastChild = slideList.lastElementChild;
    let clonedFirst = firstChild.cloneNode(true);
    let clonedLast = lastChild.cloneNode(true);

    // Add copied Slides
    slideList.appendChild(clonedFirst);
    slideList.insertBefore(clonedLast, slideList.firstElementChild);

    // Add pagination dynamically
    let pageChild = '';
    for (var i = 0; i < slideLen; i++) {
      pageChild += '<li class="dot';
      pageChild += (i === startNum) ? ' dot_active' : '';
      pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
    }
    pagination.innerHTML = pageChild;
    const pageDots = document.querySelectorAll('.dot'); // each dot from pagination

    slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";

    let curIndex = startNum; // current slide index (except copied slide)
    let curSlide = slideContents[curIndex]; // current slide dom
    curSlide.classList.add('slide_active');

    /** Next Button Event */
    slideBtnNext.addEventListener('click', function() {
      if (curIndex <= slideLen - 1) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
      }
      if (curIndex === slideLen - 1) {
        setTimeout(function() {
          slideList.style.transition = "0ms";
          slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = -1;
      }
      curSlide.classList.remove('slide_active');
      pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
      curSlide = slideContents[++curIndex];
      curSlide.classList.add('slide_active');
      pageDots[curIndex].classList.add('dot_active');
    });

    /** Prev Button Event */
    slideBtnPrev.addEventListener('click', function() {
      if (curIndex >= 0) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
      }
      if (curIndex === 0) {
        setTimeout(function() {
          slideList.style.transition = "0ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = slideLen;
      }
      curSlide.classList.remove('slide_active');
      pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
      curSlide = slideContents[--curIndex];
      curSlide.classList.add('slide_active');
      pageDots[curIndex].classList.add('dot_active');
    });

    /** Pagination Button Event */
    let curDot;
    Array.prototype.forEach.call(pageDots, function (dot, i) {
      dot.addEventListener('click', function (e) {
        e.preventDefault();
        curDot = document.querySelector('.dot_active');
        curDot.classList.remove('dot_active');
        
        curDot = this;
        this.classList.add('dot_active');

        curSlide.classList.remove('slide_active');
        curIndex = Number(this.getAttribute('data-index'));
        curSlide = slideContents[curIndex];
        curSlide.classList.add('slide_active');
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
      });
    });
  })();
</script>
<!--!!!!!!!!!!!!!!!!!! -->

 <script> 
//  $(function(){
// 	$('#button-add-file').click(addFileForm);
// 	$(document).on('click', '.button-delete-file', function(event) {
//  		$(this).parent().remove();
//  	});
//  });
//  var count = 0;
//  function addFileForm() {
//  	var html = "<div id='item_"+count+"'>";
//  	html += "<input type='file'  />";
//  	html += "<button class='button-delete-file'>삭제</button></div>";
//  	count++;
//  	$("#my-form").append(html);
	
//  		return html;
 	
//  }
 </script> 
<!-- <button id='button-add-file'>파일 추가</button> -->
<!-- <div id='my-form'></div> -->

										
										 <input type="file" id="imgInput" name="sell_img_name1" onchange="readURL(this)">
										 <input type="file" id="imgInput" name="sell_img_name2" onchange="readURL(this)">
										 <input type="file" id="imgInput" name="sell_img_name3" onchange="readURL(this)">
											</div>
										</div>
										
										<div class="flex-w flex-m m-r-20 m-tb-5">
<%--                        					 Point:<input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="Point" id="MemberPoint" value="<%=memberbean.getMember_info_detail_point() %>"> --%>
                       					 <span id="realPoint"></span>
                       					 </div>
								</div>
						</div>
				</div>				
											
								</div>
					
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
			                <input type="text" name="sell_title" id=""  required="required" placeholder="제목입력칸(413행)">
						</h4>
						<div class="mtext-106 cl2">
<!-- 							<input type="text" name="sell_price" id="sell_price" placeholder="희망하는 금액을 입력하세요." onkeyup="javascript:inputNumberFormat(this)"> -->
							<input type="text" name="sell_price" id="sell_price" placeholder="희망하는 금액을 입력하세요." onkeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
							<div id="realPoint"></div>
						</div>
		<script type="text/javascript">
		
// 		function checkNum() {
// 			let str = document.getElementById("sell_price").value;	
// 			let check = /^[0-9]+$/; 
// 			if (!check.test(str)) {    alert("숫자만 입력 가능합니다.");
// 			str.remove();
// 			}
// 		}
			
			
			
// 		var testString = document.getElementById("sell_price").value;	
// 		var regex = /[^0-9]/g;				
// 		var sell_price = testString.replace(regex, "");
// 		 document.getElementById("sell_price").value=sell_price;		//-->(,)떼주는 기능이지만 onkeyup이외 onclick 이벤트가 필요
		
		
		
// 		function inputNumberFormat(obj) {								//단위 1000원단위로  (,)붙여주는 기능 
// 			obj.value = comma(uncomma(obj.value));
// 		}	

// 		function comma(str) {
// 			str = String(str);
// 			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
// 		}

// 		function uncomma(str) {
// 			str = String(str);

// 			return str.replace(/[^-0-9]/g,'');
			
// 		}
		
		</script>
						<div class="mtext-106 cl2">
									<input type="text" name="sell_brand" id=""  required="required" placeholder="브랜드를 입력해주세요."><br>
					    </div>
						
						<!--  -->
						<div class="p-t-33">
							<div class="flex-w flex-r-m p-b-10">
<!-- 								<div>정확한 정보는 판매확률을 높여줍니다!</div> -->
								
								<div class="size-203 flex-c-m respon6">
								Category
								</div>
								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" id="s0" name="sell_category"onchange="optionChange();">
											<option selected="selected">선택해주세요.</option>
											<option value="상의">상의</option>
											<option value="하의">하의</option>
											<option value="신발">신발</option>
											<option value="잡화">잡화</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">
								Category Detail
								</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" id="s1" name="sell_category_detail">
											<option>선택해주세요.</option>
											
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>
							
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">
									Size
								</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" id="s2" name="sell_size">
											<option>선택해주세요.</option>
											
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>
							
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">
									Color
								</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="sell_color1">
											<option>선택해주세요.</option>
											<option>Black</option>
											<option>White</option>
											<option>Blue</option>
											<option>Grey</option>
											<option>Yellow</option>
											<option>Red</option>
											<option>SkyBlue</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="sell_color2">
											<option>선택해주세요.</option>
											<option>Black</option>
											<option>White</option>
											<option>Blue</option>
											<option>Grey</option>
											<option>Yellow</option>
											<option>Red</option>
											<option>SkyBlue</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>
							
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">
									Content
								</div>
								   <div>
									  <textarea cols="45" rows="10"  name="sell_content"   placeholder="제품을 설명 (50자이하)"></textarea>
								   </div>	
								
							</div>
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<input type="button" value="취소" onclick="history.back()" >&nbsp;&nbsp;
									
									<input type="submit" value="판매등록"  >

								</div>
							</div>	
						</div>

						<!--  -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">Description</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">Additional information</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#reviews" role="tab">Reviews (1)</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">
									Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.
								</p>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Weight
											</span>

											<span class="stext-102 cl6 size-206">
												0.79 kg
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Dimensions
											</span>

											<span class="stext-102 cl6 size-206">
												110 x 33 x 100 cm
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Materials
											</span>

											<span class="stext-102 cl6 size-206">
												60% cotton
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Color
											</span>

											<span class="stext-102 cl6 size-206">
												Black, Blue, Grey, Green, Red, White
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Size
											</span>

											<span class="stext-102 cl6 size-206">
												XL, L, M, S
											</span>
										</li>
									</ul>
								</div>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<div class="flex-w flex-t p-b-68">
											<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img src="MainPage/images/avatar-01.jpg" alt="AVATAR">
											</div>

											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">
														Ariana Grande
													</span>

													<span class="fs-18 cl11">
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star-half"></i>
													</span>
												</div>

												<p class="stext-102 cl6">
													Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
												</p>
											</div>
										</div>
										
										<!-- Add review -->
										<form class="w-full">
											<h5 class="mtext-108 cl2 p-b-7">
												Add a review
											</h5>

											<p class="stext-102 cl6">
												Your email address will not be published. Required fields are marked *
											</p>

											<div class="flex-w flex-m p-t-50 p-b-23">
												<span class="stext-102 cl3 m-r-16">
													Your Rating
												</span>

												<span class="wrap-rating fs-18 cl11 pointer">
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<i class="item-rating pointer zmdi zmdi-star-outline"></i>
													<input class="dis-none" type="number" name="rating">
												</span>
											</div>

											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">Your review</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="name">Name</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="name" type="text" name="name">
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="email">Email</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="email" type="text" name="email">
												</div>
											</div>

											<button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
												Submit
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25">
				SKU: JAK-01
			</span>

			<span class="stext-107 cl6 p-lr-25">
				Categories: Jacket, Men
			</span>
		</div>
	</section>
</form>

	
	<!-- Footer영역과 상단 이동 버튼-->
	<jsp:include page="/MainPage/menu/footer.jsp"/>
	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="MainPage/images/icons/icon-close.png" alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3" data-thumb="images/product-detail-01.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="MainPage/images/product-detail-01.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="MainPage/images/product-detail-01.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="MainPage/images/product-detail-02.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="MainPage/images/product-detail-02.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3" data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="MainPage/images/product-detail-03.jpg" alt="IMG-PRODUCT">

											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-03.jpg">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">
								Lightweight Jacket
							</h4>

							<span class="mtext-106 cl2">
								$58.79
							</span>

							<p class="stext-102 cl3 p-t-23">
								Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.
							</p>
							
							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										Size
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Size S</option>
												<option>Size M</option>
												<option>Size L</option>
												<option>Size XL</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										Color
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Red</option>
												<option>Blue</option>
												<option>White</option>
												<option>Grey</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1">

											<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart
										</button>
									</div>
								</div>	
							</div>

							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
										<i class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
									<i class="fa fa-facebook"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
									<i class="fa fa-twitter"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
									<i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!--===============================================================================================-->	
	<script src="MainPage/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/bootstrap/js/popper.js"></script>
	<script src="MainPage/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/daterangepicker/moment.min.js"></script>
	<script src="MainPage/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/slick/slick.min.js"></script>
	<script src="MainPage/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="MainPage/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="MainPage/js/main.js"></script>

</body>
</html>