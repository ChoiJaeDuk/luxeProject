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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
<link rel="stylesheet" type="text/css" href="../css/Reset.css">
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/Layout.css">
<link rel="stylesheet" type="text/css" href="../css/Manager/Manager_Index.css">

<style type="text/css">
</style>
</head>
<body>
<div id="mySidebar" class="sidebar">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="Manager_Member.jsp">회원관리</a>
		  <a href="Manager_Order.jsp">주문관리</a>
		  <a href="Manager_Sales.jsp">매출관리</a>
		  <a href="#">상품등록</a>
</div>
<div id='main'>
		<div id='header'>
			<div class="container">
				<div id='header-top'>
					<div class="container">
						<div id='header-top-menu'>
							<a href="">마이페이지</a> <a href="">관심상품</a> <a href="">로그인</a><a class="openbtn" onclick="openNav()">관리자모드</a>
						</div>
					</div>
					<!-- container -->
				</div>
				<!--header-top -->

				<div id='header-nav'>
					<div class="container">
						<nav class="navbar navbar-expand-lg navbar-light bg-light">
							<div class="container-fluid">
								<a class="navbar-brand" href="#">Navbar</a>
								<button class="navbar-toggler" type="button"
									data-bs-toggle="collapse" data-bs-target="#navbarColor03"
									aria-controls="navbarColor03" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse" id="navbarColor03">
									<ul class="navbar-nav me-auto">
										<li class="nav-item"><a class="nav-link active" href="#">Home
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#">Shop</a>
										</li>
										<li class="nav-item"><a class="nav-link" href="#">Style</a>
										</li>
									</ul>
									<form class="d-flex">
										<input class="form-control me-sm-2" type="text"
											placeholder="Search">
										<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
									</form>
								</div>
							</div>
						</nav>
					</div>
					<!-- container -->
				</div>
				<!-- header-nav -->

			</div>
			<!--header container -->
		</div>
		<!-- header -->
		<div class="clear"></div>

		<div id='contents'>
			<div class="container">
				<div id='con'>
					<section id="banner">
						<div class="banner_img">
							<img alt="배너이미지입니다." src="">
						</div>
					</section>
					<div class="clear"></div>

					<div class="title">
						<div id="main_title">NEW</div>
						<div id="sub_title">신상품</div>
					</div>

					<section>
						<div class="productNEW_container">
							<div class="newItem item1">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="newItem item2">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="newItem item3">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="newItem item4">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="newItem item5">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="newItem item6">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="newItem item7">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="newItem item8">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="newItem item9">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="newItem item10">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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
					</section>

					<section id="banner">
						<div class="banner_img01">
							<img alt="광고이미지입니다." src="img/banner01.png">
						</div>
					</section>
					<div class="clear"></div>

					<section>
						<div class="title">
							<div id="main_title">BEST</div>
							<div id="sub_title">인기상품</div>
						</div>
					</section>
					<section>
						<div class="productBEST_container">
							<div class="bestItem item1">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="bestItem item2">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="bestItem item3">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="bestItem item4">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="bestItem item5">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="bestItem item6">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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


							<div class="bestItem item7">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="bestItem item8">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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


							<div class="bestItem item9">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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

							<div class="bestItem item10">
								<div class="item_img">
									<img alt="상품이미지입니다." src="">
								</div>
								<div>
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
					<div class="clear"></div>

					<section id="banner">
						<div class="banner_img01">
							<img alt="광고이미지입니다." src="img/banner02.png">
						</div>
					</section>
					<div class="clear"></div>

					<section>
						<div class="title">
							<div id="main_title">STYLE</div>
							<div id="sub_title">오늘의코디</div>
						</div>
					</section>
					<section>
						<div class="styleBoard_container">

							<div class="styleBoard item1">
								<img alt="스타일이미지입니다." src="">
							</div>
							<div class="styleBoard item2">
								<img alt="스타일이미지입니다." src="">
							</div>
							<div class="styleBoard item3">
								<img alt="스타일이미지입니다." src="">
							</div>
							<div class="styleBoard item4">
								<img alt="스타일이미지입니다." src="">
							</div>
							<div class="styleBoard item5">
								<img alt="스타일이미지입니다." src="">
							</div>
							<div class="styleBoard item6">
								<img alt="스타일이미지입니다." src="">
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
					<div class="clear"></div>

				
				</div>
			</div>
			<!-- container -->
		</div>
		<!-- contents -->
		<div class="clear"></div>

		<div id='footer'>
			<div class="container"></div>
		</div>

	</div>
	
	<script>
	function openNav() {
	  document.getElementById("mySidebar").style.width = "250px";
	  document.getElementById("main").style.marginLeft = "250px";
	}
	
	function closeNav() {
	  document.getElementById("mySidebar").style.width = "0";
	  document.getElementById("main").style.marginLeft= "0";
	}
	</script>
</body>
</html>
