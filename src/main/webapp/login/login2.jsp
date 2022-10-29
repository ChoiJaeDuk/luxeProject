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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">


    Kakao.init("1577bdc8695b7ffd55948877c59255db"); //API를 사용할 자신의 JavaScript 키값을 이용해 권한 접근
     
    //카카오 로그인 버튼을 생성
     Kakao.Auth.createLoginButton({ //사용할 옵션 
      
      container:'#kakao-login-btn', 
   
      success: function(authObj){ 
    	 console.log(authObj)
    	 Kakao.Auth.setAccessToken(authObj.access_token);
         Kakao.API.request({ //토큰이 존재할 때 카카오 API를 통하여 정보값을 받을 수 있는 함수 
            url:'/v2/user/me', //사용자 정보 가져오기 
            success: function(res) { //res = response // 로그인 한 사람의 개인정보 불러옴
               console.log(res);
                
                var id = res.id; //db의 primary Key값 속성 즉 기본키의 식별성
                var email = res.kakao_account.email;
                var name = res.properties.nickname;
                var html = "<br>" + email + "<br>" + name;

               
               location.href='loginOK.jsp';
            }
         });
      }
   });
    

</script>
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
					<a href="#">HOME</a> <a href="#news">STYLE</a> <a href="#contact">SHOP</a>
					<div class="split">
						<input class="nav-search" type="text" name="search">
					</div>
				</div>
			</div>
		</div>
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
								<li class="look_list"><a href="#" class="look_link">회원가입
								</a></li>
								<li class="look_list"><a href="#" class="look_link">아이디
										찾기 </a></li>
								<li class="look_list"><a href="#" class="look_link">비밀번호
										찾기</a></li>
							</ul>
							<a id="kakao-login-btn">이거</a><p>
						</div>
	
			
			
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
	
</body>
</html>