<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 외부의 css파일 연결하기 -->
<link rel="stylesheet" type="text/css" href="css/login.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
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

<style type="text/css">
</style>
</head>
<body>
	<div id='page'>
		<header>
			<div id='logo'>
				<img alt="로고" src="img/logo.PNG">
			</div>

			<nav id='menus'>
				<div id='top_menu'>
					<a href="mypage.jsp">마이페이지</a> <a href="">관심상품</a> <a
						href="login.jsp">로그인</a>
				</div>
				<ul id='main_menu'>
					<li><a href="">SHOP</a></li>
					<li><a href="">STYLE</a></li>
					<li><a href="">HOME</a></li>
					<li><form class="search" role="search">
							<input id="searchbar" type="search"> <a id="searchicon"
								type="submit"><i class="bi bi-search"></i></a>
						</form></li>
				</ul>

			</nav>
		</header>
		<div class="clear"></div>

		<section id='contents'>
			<div id='loginForm'>
				<div id='login_title'>
					<div id='input_logo'>
						<img alt="로고" src="img/logo.PNG">
					</div>
				</div>

				<form method="post" action="${pageContext.request.contextPath}/front?key=user&methodName=login">
					<div id="input_box">
						<h3 id='input_title'>ID</h3>
						<div class='form-group'>
							<input type="text" class="form-control" autocomplete="off"
								name="userId">
						</div>
					</div>

					<div id="input_box">
						<h3 id='input_title'>PASSWORD</h3>
						<div class='form-group'>
							<input type="password" class="form-control" autocomplete="off"
								name="userPwd">
						</div>
					</div>

					<div id="login_btn_box">
						<button type="submit" id="login_btn">로그인</button>
					</div>
				</form>
				<ul class="look_box">
					<li class="look_list"><a href="#" class="look_link">회원가입 </a></li>
					<li class="look_list"><a href="" class="look_link">아이디 찾기
					</a></li>
					<li class="look_list"><a href="selectuserPwd.jsp" class="look_link">비밀번호
							찾기</a></li>
				</ul>
				<div class="social_login">
					<button type="button" id='kakao_login'>카카오로 로그인</button>
				</div>
			</div>
		</section>

		<footer> </footer>
	</div>
</body>
</html>