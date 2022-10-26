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
<link rel="stylesheet" type="text/css" href="../css/Manager/Manager_Layout.css">
<link rel="stylesheet" type="text/css" href="../css/Manager/Manager_Sales.css">

<style type="text/css">
</style>
</head>
<body>
<div id="mySidebar" class="sidebar">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="Manager_Member.jsp">회원관리</a>
		  <a href="Manager_Order.jsp">주문관리</a>
		  <a href="#">매출관리</a>
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
				<div id='info-container'>
					<h4>매출관리페이지</h4>
					<div class="sales-detail">	
					 <div id='chart-box'>
						  <div class="sales-card">
						  <p>관련 texttextexttext</p>
						  </div>
					  </div>					
					  <div class="sales-all-detail">
					    <div class="sales-card">

					      <div class='sales-all-box'>
					      	  <div class='sales-all-box-title'>
					     	  	<h3>전체매출</h3>
					     	  </div>
						      <div class='sales-all-box-text'>
							      <span class='sales-price'>000000</span>
							      <span class='sales-won'>원</span>
						      </div>
					      </div>
					      
					      <div class='sales-all-box'>
					     	  <div class='sales-all-box-title'>
					     	  	<h3>전체수익</h3>
					     	  </div>
						      <div class='sales-all-box-text'>
							      <span class='sales-price'>000000</span>
							      <span class='sales-won'>원</span>
						      </div>
					      </div>
					      
					      <div>
					      	<button id="monthlySearch-dtn">월별조회하기</button>
							<div id="monthlySearch" style="display: none;">
							 <table id="myTable">
								  <tr class="header">
								    <th style="width:10%;">  </th>
								    <th style="width:45%;">매출</th>
								    <th style="width:45%;">수익</th>
								  </tr>
								  <tr>
								  	<td>1월</td>
								    <td>000.000원</td>
								    <td>000.000원</td>
								  </tr>
								  <tr>
								  	<td>2월</td>
								    <td>000.000원</td>
								    <td>000.000원</td>
								  </tr>
								  <tr>
								    <td>3월</td>
								    <td>000.000원</td>
								    <td>000.000원</td>
								  </tr>
								  
								</table> 
							</div>
					      </div>
					      
					    </div>
					  </div>
					
					  <div class="sales-brand-detail">
					    <div class="sales-card">
					      <div class="tab">
								  <button class="tablinks" onclick="openCity(event, 'London')">London</button>
								  <button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>
								  <button class="tablinks" onclick="openCity(event, 'Tokyo')">Tokyo</button>
								</div>
								
								<!-- Tab content -->
								<div id="London" class="tabcontent">
								  <h3>London</h3>
								  <p>London is the capital city of England.</p>
								</div>
								
								<div id="Paris" class="tabcontent">
								  <h3>Paris</h3>
								  <p>Paris is the capital of France.</p>
								</div>
								
								<div id="Tokyo" class="tabcontent">
								  <h3>Tokyo</h3>
								  <p>Tokyo is the capital of Japan.</p>
								</div>
					    </div>
					  </div>
					  
					  <div class="sales-non-detail">
					    <div class="sales-card">
					      <h3>Card 3</h3>
					      <p>Some text</p>
					      <p>Some text</p>
					    </div>
					  </div>	
				</div>
				
			</div>
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
	
	$(function (){
		$("#monthlySearch-dtn").click(function (){
	  	$("#monthlySearch").toggle();
	  });
	})
	
	function openCity(evt, cityName) {
	  // Declare all variables
	  var i, tabcontent, tablinks;
	
	  // Get all elements with class="tabcontent" and hide them
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	
	  // Get all elements with class="tablinks" and remove the class "active"
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	
	  // Show the current tab, and add an "active" class to the button that opened the tab
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}
	</script>
</body>
</html>
