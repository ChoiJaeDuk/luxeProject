<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lora:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<!--
font-family: 'Noto Sans KR', sans-serif;
font-family: 'Roboto', sans-serif;
font-family: 'Lora', serif;

  -->

<!--아이콘-->  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 템플릿요소 css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>

<!-- 외부의 css파일 연결하기 -->
<link rel="stylesheet" type="text/css" href="css/Reset.css">
<link rel="stylesheet" type="text/css" href="css/Layout.css">
<link rel="stylesheet" type="text/css" href="css/OrderByBuy.css">
<link rel="stylesheet" type="text/css" href="css/Order.css">

<style type="text/css">
</style>
</head>
<body>
	<div id='wrap'>
	
		<div id='header'>
			<div class="container">
				<div id='header-top'>
					<div class="container">
					<div id='header-top-menu'>
						<a href="">마이페이지</a>
						<a href="">관심상품</a>
						<a href="">로그인</a>
					</div>
					</div><!-- container -->			
				</div><!--header-top -->
				
				<div id='header-nav'>
					<div class="container">
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
					  <div class="container-fluid">
					    <a class="navbar-brand" href="#">Navbar</a>
					    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
					      <span class="navbar-toggler-icon"></span>
					    </button>
					    <div class="collapse navbar-collapse" id="navbarColor03">
					      <ul class="navbar-nav me-auto">
					        <li class="nav-item">
					          <a class="nav-link active" href="#">Home
					          </a>
					        </li>
					        <li class="nav-item">
					          <a class="nav-link" href="#">Shop</a>
					        </li>
					        <li class="nav-item">
					          <a class="nav-link" href="#">Style</a>
					        </li>
					      </ul>
					      <form class="d-flex">
					        <input class="form-control me-sm-2" type="text" placeholder="Search">
					        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
					      </form>
					    </div>
					  </div>
					</nav>
					</div><!-- container -->
				</div><!-- header-nav -->	
				
			</div><!--header container -->	
		</div><!-- header -->
		<div class="clear"></div>
		
		<div id='contents'>
			<div class="container">
				<div id='con'>
					<div id='product_info'> <!-- 컨테이너 -->
						<div id='product-img'><img src="img/heart-fill.svg"/></div>
						<div id='product-detail'>
							<p id='model-num'>모델번호</p>
							<p id='model-title'>모델이름</p>
							<p id='model-subtitle'>모델서브이름</p>
						</div>
					</div><!-- product_info -->
					
					<div id='delivery'><!-- 컨테이너 -->
						<div id='delivery_detail'>
							<h3>배송 주소</h3>
							<div id='delivery-info-list'>
							<span id='delivery-title'>주문자</span>
							<span id='delivery-dese'>홍길동</span>
							</div>
							
							<div id='delivery-info-list'>
							<span id='delivery-title'>연락처</span>
							<span id='delivery-dese'>010-0000-0000</span>
							</div>
							
							<div id='delivery-info-list'>
							<span id='delivery-title'>배송 주소</span>
							<span id='delivery-dese'>경기도 오리역</span>
							</div>
							
						</div>
					</div><!-- delivery -->
					
					<div id='instant_group'><!-- 컨테이너 -->
						<h3>최종 주문 정보</h3>
						<div id='instant'>
							<div id='price_total_order'>
								<p>총 결제금액</p>
								<div id='price_total'>
								<span id='price_total_num'>000.000</span><span  id='price_total_won'>원</span>
								</div>
							</div>
							<div id='bind'>
								<dl id='price_addition'>
									<dt><b>구매가</b></dt>
									<dd><span><b>000.000</b></span><span><b>원</b></span></dd>
								</dl>
								<dl id='price_addition'>
									<dt>검수비</dt>
									<dd><span><b>000.000</b></span><span>원</span></dd>
								</dl>
								<dl id='price_addition'>
									<dt>수수료</dt>
									<dd><span>000.000</span><span>원</span></dd>
								</dl>
								<dl id='price_addition'>
									<dt>배송비[무료배송EVENT]</dt>
									<dd><span>0</span><span>원</span></dd>
								</dl>
							</div>
						</div>
					</div><!-- instant_group_con -->
					
					<div id='payment-con'><!-- 컨테이너 -->
						<form action="">
								<div id='payment'>
								<h3 id='payment-title'>결제방법</h3>
								<h4 id='method-title'>계좌 간편결제</h4>
								<div id='payment-box'>
									<input type="text" placeholder='계좌번호를 입력해주세요' />
								</div>
								<h4 id='method-title'>카드 간편결제</h4>
								<div id='payment-box'>
									<button>카드를 등록해주세요</button>
								</div>
									<div id='payment-total'>
										<span>총 결제금액</span>
										<div id='payment-total-price'>
											<span>000.000</span><span>원</span>
										</div>
									</div>
								</div><!-- payment -->
								<button type="submit" id='payment-submit'>결제하기</button>
							</form><!--결제방식 form으로 전송  -->
						</div><!-- payment-con -->
					</div><!-- con -->
				</div><!-- container -->
			</div><!-- contents -->
		
		<div class="clear"></div>
		
		<div id='footer'>
			<div class="container">
		
			</div><!-- container -->
		</div><!-- footer -->
		
	</div>
	
	
</body>
</html>