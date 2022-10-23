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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
				<a href="mypage.jsp">마이페이지</a> <a href="">관심상품</a> <a href="login.jsp">로그인</a>
			</div>
			<ul id='main_menu'>
				<li><a href="">SHOP</a></li>
				<li><a href="">STYLE</a></li>
				<li><a href="">HOME</a></li>
				<li><form class="search" role="search">
				<input id="searchbar" type="search">
				<a id="searchicon" type="submit"><i class="bi bi-search" ></i></a>
			</form></li>
			</ul>
			
		</nav>
	</header>	
	<div class="clear"></div>
	
	<section id='contents'>
	
		<nav id='sub_menu'>
			<h3><b>마이페이지</b></h3>
			<h4>내정보</h4>
			<ul>
				<li><a href="#" id=''>프로필정보</a></li>
				<li><a href="" id=''>알람</a></li>
			</ul>
			
			<h4>쇼핑정보</h4>
			<ul>
				<li><a href="" id=''>구매내역</a></li>
				<li><a href="" id=''>판매내역</a></li>
				<li><a href="" id=''>관심상품</a></li>
			</ul>
		</nav>
		
		<div id='main'>
			<div id='user_profile'>
				<div> <h3>프로필정보</h3></div>
				<div id='profile_info'>
					<div id='profile_group'>
						<h4 id='grop_title'>로그인정보</h4>
						<div id='unit'>
							<h5 id='title'>아이디</h5>
							<input id='desc'type="text" autocomplete="off" placeholder="아이디" readonly="readonly" id='desc'>
						</div>
						<div id='unit'>
							<h5 id='title'>비밀번호</h5>
							<input id='desc'type="password" autocomplete="off"  placeholder="********" readonly="readonly" id='desc'>
							<button>인증하기</button>
						</div>
					</div>
					
					<div id='profile_group'>
					<form action="">
						<h4 id='grop_title'>개인정보</h4>
						<div id='unit'>
							<h5 id='title'>이름</h5>
							<input type="text" autocomplete="off" placeholder="홍길동" id='desc'>
						</div>
						<div id='unit'>
							<h5 id='title'>전화번호</h5>
							<input type="text" autocomplete="off" placeholder="010-0000-000" readonly="readonly" id='desc'>
							<button>인증하기</button>
						</div>
						<div id='unit'>
							<h5 id='title'>주소</h5>
							<input type="text" autocomplete="off" placeholder="경기도 오리역 8번출구" id='desc'>
						</div>
						<button>수정하기</button>
					</form>
					</div>
				</div>
			</div>
		</div>				
	</section>
	<div class="clear"></div>
	
	<footer> </footer>
</div>
</body>
</html>