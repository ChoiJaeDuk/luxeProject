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
						<div id='price-list'>
							<div class='price01' id='pri01'>
								<p id='title'>즉시 구매가</p>
								<span id='price-now'>000,000</span><span id='won'>원</span>
							</div>
							<div class='price01'>
								<p id='title'>즉시 구매가</p>
								<span id='price-now'>000,000</span><span id='won'>원</span>
							</div>
						</div>
					</div><!-- product_info -->
					
					<div id='order-tap'>
						<div class="btn-group">
						  <button onclick="myFunction01()">구매입찰</button>
						  <button onclick="myFunction02()">즉시구매</button>
						</div>
						
						<div id="buy-type01">
							<div id='price'>
								<span id='price-now-title'>구매희망가</span>
								<div id='price-con'>
									<input type="text"  id='input-amount'  placeholder="희망가 입력"  />
									<span id ='won02'>원</span>
								</div>
							</div>
							<div id='price-total'>
								<button type="button" class="price-total-btn">구매 입찰 계속</button>
							</div>
						</div>
						
						<div id="buy-type02">
							<div id='price'>
								<span id='price-now-title'>즉시구매가</span>
								<div id='price-con'>
									<span id='price02'>000,0000</span>
									<span id ='won02'>원</span>
								</div>
							</div>
							<div id='price-total'>
								<button type="button" class="price-total-btn">즉시 구매 계속</button>
							</div>
						</div>
					</div>
				</div>
			</div><!-- container -->
		</div><!-- contents -->
		
		<div class="clear"></div>
		
		<div id='footer'>
			<div class="container">
		
			</div><!-- container -->
		</div><!-- footer -->
		
	</div>
	
	<script>
		function myFunction01() {
		  var x = document.getElementById("buy-type01");
		  var y = document.getElementById("buy-type02");
		  
		 
			  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				  } else {
				    x.style.display = "none";
				  }
		  
		}
		function myFunction02() {
			var x = document.getElementById("buy-type02");
			var y = document.getElementById("buy-type01");
			
			if (x.style.display === "none") {
			  x.style.display = "block";
			  y.style.display = "none";
			} else {
			  x.style.display = "none";
		  }
		}
	</script>
</body>
</html>