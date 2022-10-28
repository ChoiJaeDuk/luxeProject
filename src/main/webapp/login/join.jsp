<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"/>
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
<link rel="stylesheet" type="text/css" href="../css/setting/Layout.css">
<link rel="stylesheet" type="text/css" href="../css/login/join.css">
<style type="text/css">
</style>
</head>
<body>
	<div id='wrap'>

		<div class="clear"></div>


		<div id='contents'>
			<div class="container">
				<div id='con'>
						
							<form id='insert-form' name="writeForm" method="post" action="">
								
									<div id='insert-title-text'>
									<h3>회원가입</h3>
										<span>아이디</span><input type="text" class="form-control" placeholder="아이디">
										<span>아이디</span><input type="text" class="form-control" placeholder="아이디">
										<span>아이디</span><input type="text" class="form-control" placeholder="아이디">
										<span>아이디</span><input type="text" class="form-control" placeholder="아이디">
									</div>


									<div id='insert-text'>
										<div class="form-group">
											<span>내용</span>
											<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
										</div>
									</div>

									<div id='insertImg'>
										<span>스타일업로드</span> <input class="form-control" type="file"
											id="formFile">
									</div>


									<div id='insert-submt'>
										<input type="submit" value="등록" id='submitBtn'>
										<button onclick="closeInsertform()" id='closeBtn'>취소</button>
									</div>
								
							</form>
						
					
				</div>
			</div>
			<!-- container -->
		</div>
		<!-- contents -->
		<div class="clear"></div>

		<jsp:include page="../footer.jsp"/>

	</div>
	<!-- 스크립트 -->
	<script type="text/javascript" src="StyleBoard.js"></script>
</body>
</html>