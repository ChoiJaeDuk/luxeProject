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
<link rel="stylesheet" type="text/css" href="../css/setting/Reset.css">
<link rel="stylesheet" type="text/css" href="../css/shop/shop.css">
<link rel="stylesheet" type="text/css" href="../css/setting/Layout.css">
<style type="text/css">
</style>
</head>
<body>
	<div id='wrap'>

		<div id='header'>
			<div id='header-top'>
				<div id='header-top-menu'>
					<a href="">마이페이지</a> <a href="">관심상품</a> <a href="">로그인</a> <a
						href="" class='managermode'>관리자모드</a>
				</div>
			</div>
			<!--header-top -->

			<div id='header-bottom'>
				<div class="topnav">
					<div id='logo'>LUXE</div>
					<a href="../index.jsp">HOME</a> <a href="../style/StyleBoard.jsp">STYLE</a> <a href="#">SHOP</a>
					<div class="split">
						<input class="nav-search" type="text" name="search">
					</div>
				</div>
			</div>
		</div>
		<!-- header -->
		<div class="clear"></div>

		<div id="banner">
			<div id='brand1'><img alt="배너이미지입니다." src="../img/banner/banner01.jpg" style="filter: grayscale(100%);"></div>
			<div id='brand2'><img alt="배너이미지입니다." src="../img/banner/banner02.jpg" style="filter: grayscale(100%);"></div>
			<div id='brand3'><img alt="배너이미지입니다." src="../img/banner/banner03.jpg" style="filter: grayscale(100%);"></div>
		</div>
		<div class="clear"></div>


		<div id='contents'>
			<div class="container">
				<div id='con'>
					<nav id='sub_menu'>
						<h3>필터</h3>
						<div class="accordion" id="accordionPanelsStayOpenExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseOne"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseOne">
										<div id="accordion-body-top">
											<div id="accordion-body-text">
												<strong>브랜드</strong>
												<p>선택된항목</p>
											</div>
											<div id="accordion-body-icon"></div>
										</div>
									</button>
								</h2>
								<div id="panelsStayOpen-collapseOne"
									class="accordion-collapse collapse show"
									aria-labelledby="panelsStayOpen-headingOne">
									<div class="accordion-body">
										<ul>
											<li><label><input type="checkbox" name="color"
													value="blue">CHANEL</label></li>
											<li><label><input type="checkbox" name="color"
													value="blue">DIOR</label></li>
											<li><label><input type="checkbox" name="color"
													value="blue">PRADA</label></li>
										</ul>
									</div>
								</div>
							</div>
							<!--아코디언 내용 추가  -->
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseOne"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseOne">
										<div id="accordion-body-top">
											<div id="accordion-body-text">
												<strong>카테고리</strong>
												<p>선택된항목</p>
											</div>
											<div id="accordion-body-icon"></div>
										</div>
									</button>
								</h2>
								<div id="panelsStayOpen-collapseOne"
									class="accordion-collapse collapse show"
									aria-labelledby="panelsStayOpen-headingOne">
									<div class="accordion-body">
										<ul>
											<li><label><input type="checkbox" name="color"
													value="blue">숄더백</label></li>
											<li><label><input type="checkbox" name="color"
													value="blue">미니팩</label></li>
											<li><label><input type="checkbox" name="color"
													value="blue">쇼퍼백</label></li>
											<li><label><input type="checkbox" name="color"
													value="blue">클러치</label></li>
											<li><label><input type="checkbox" name="color"
													value="blue">백팩</label></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</nav>

					<section id='main_contents'>

						<div id='contents_top'>
							<div id='contents_text'>
								<h3>브랜드이름</h3>
							</div>

							<div id="dropdown">
								<!-- Example single danger button -->
								<div class="btn-group">
									<button type="button" data-bs-toggle="dropdown"
										aria-expanded="false">Action</button>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="#">Action</a></li>
										<li><a class="dropdown-item" href="#">Another action</a></li>
										<li><a class="dropdown-item" href="#">Something else
												here</a></li>
										<li><hr class="dropdown-divider"></li>
										<li><a class="dropdown-item" href="#">Separated link</a></li>
									</ul>
								</div>
							</div>
						</div>

						<section id='product'>
							<div class="productBEST_container">
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
							</div>

							<div class="productBEST_container">
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
							</div>
							<div class="productBEST_container">
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
								<div class="bestItem item1">
									<div class="item_img_block">
										<div class="item_img">
											<img alt="상품이미지입니다." src="" id='product'>
										</div>
										<div id='like'>
											<img src="img/heart.svg" id='like_img'>
										</div>
									</div>
									<div id='item_text'>
										<div class="item_brand">
											<a href="#" id="brand_text">브랜드</a>
										</div>
										<p id="name">상품이름</p>
										<div class="price">
											<p id="num">000,000원</p>
											<p id="p">즉시구매가</p>
										</div>
									</div>
								</div>
							</div>



							<nav aria-label="Page navigation example" id="pagenav">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous" style="color: #222"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: #222">1</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: #222">2</a></li>
									<li class="page-item"><a class="page-link" href="#"
										style="color: #222">3</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next" style="color: #222"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</section>
					</section>
				</div>
			</div>
			<!-- container -->
		</div>
		<!-- contents -->
		<div class="clear"></div>

		<div id='footer'>
			<div id='footer-textbox'>
				<h5>고객센터 1588-1588</h5>
				<p>
					운영시간 평일 11:00-18:00(토,일,공휴일휴무)<br> 점심시간 평일 13:00-14:00
				</p>
				<h6>주소 : 경기도 성남시 분당구 오리역 16번출구</h6>
				<p>
					LUXE(주)는 통신판매 중개자로서 통신판매의 당사자가 아니므로 개별 판매자가 등록한 상품정보에 대해서 책임을 지지
					않습니다. <br>단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 당사에 있습니다
				</p>
			</div>


		</div>

	</div>
	<!-- 스크립트 -->
	<script type="text/javascript" src="StyleBoard.js"></script>
</body>
</html>