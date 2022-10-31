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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 외부의 css파일 연결하기 -->
<link rel="stylesheet" type="text/css" href="../css/setting/Reset.css">
<link rel="stylesheet" type="text/css" href="../css/login/login.css">
<link rel="stylesheet" type="text/css" href="../css/setting/Layout.css">

<style type="text/css">
</style>
</head>
<body>
	<div id='wrap'>

		<jsp:include page="../layout/header.jsp" />
		<!-- header -->
		<div class="clear"></div>

		
						<div id='loginForm'>
							<div id='login_title'>
								<div id='logo'>LUXE</div>
							</div>

							<form method="post"
								action="${pageContext.request.contextPath}/front?key=user&methodName=login">
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
								<li class="look_list"><a href="join.jsp" class="look_link">회원가입
								</a></li>
								<li class="look_list"><a href="../findidform.jsp" class="look_link">아이디
										찾기 </a></li>
								<li class="look_list"><a href="../findidformpwd.jsp" class="look_link">비밀번호
										찾기</a></li>
							</ul>
						</div>
			
			
			
		<div class="clear"></div>

		<jsp:include page="../layout/footer.jsp" />

	</div>
	
</body>
</html>