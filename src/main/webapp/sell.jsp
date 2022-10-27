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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 외부의 css파일 연결하기 -->
<link rel="stylesheet" type="text/css" href="css/Reset.css">
<link rel="stylesheet" type="text/css" href="css/Layout.css">
<link rel="stylesheet" type="text/css" href="css/OrderByBuy.css">
<link rel="stylesheet" type="text/css" href="css/Order2.css">

<style type="text/css">
</style>
<script src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		function sellUserInfo() {
			$.ajax({
				url :"ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"userAjax" , methodName : "sellUserInfo", userId:"id"}, //서버에게 보낼 데이터정보(parameter정보)
				success :function(result){
					$("#seller-name").text(result.userName);
					$("#seller-phone").text(result.userPhone);
					$("#seller-email").text(result.userEmail);
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
		}
		sellUserInfo();
		
		$("#sell").on("click", function() {
			
		})
	})
	
	
</script>
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
							<p id='model-title'>${goodsDTO.goodsName}</p>
							<p id='model-subtitle'>${goodsDTO.goodsNameKor}</p>
						</div>
					</div><!-- product_info -->
					
					<div id='delivery'><!-- 컨테이너 -->
						<div id='delivery_detail'>
							<h3>배송 주소</h3>
							<div id='delivery-info-list'>
							<span id='delivery-title'>판매자: </span>
							<span id='seller-name'></span>
							</div>
							
							<div id='delivery-info-list'>
							<span id='delivery-title'>연락처: </span>
							<span id='seller-phone'></span>
							</div>
							
							<div id='delivery-info-list'>
							<span id='delivery-title'>이메일: </span>
							<span id='seller-email'></span>
							</div>
							
						</div>
					</div><!-- delivery -->
					
					<div id='instant_group'><!-- 컨테이너 -->
						<h3>최종 판매 정보</h3>
						<div id='instant'>
							
							<div id='bind'>
								<dl id='price_addition'>
									<dt><b>판매가</b></dt>
									<dd><span><b>${inputPrice}</b></span><span><b>원</b></span></dd>
								</dl>
								<dl id='price_addition'>
									<dt>검수비</dt>
									<dd><span><b>000.000</b></span><span>원</span></dd>
								</dl>
								<dl id='price_addition'>
									<dt>수수료</dt>
									<dd><span>000.000</span><span>원</span></dd>
								</dl>
								
							</div>
						</div>
					</div><!-- instant_group_con -->
					
					<div id='payment-con'><!-- 컨테이너 -->
						
								<h6 id='method-title'>구입일 등록</h6>
								<div id='payment-box'>
									<input type="date" placeholder='구입일을 입력해주세요' />
								</div>
								
								<div id='payment'>
								<h6 id='method-title'>계좌번호 등록</h6>
								<div id='payment-box'>
									<input type="text" placeholder='계좌번호를 입력해주세요' />
								</div>
								
								<h6 id='method-title'>시리얼 넘버 등록</h6>
								<div id='payment-box'>
									<input type="text" placeholder='시리얼넘버를 입력해주세요' />
								</div>
								
								</div><!-- payment-box -->
									<button type="button" id='sell'>판매하기</button>
								</div><!-- payment -->
								
	
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
	
	<script>
		var target = document.querySelectorAll('.btn_open');
		var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
		var targetID;
	
		// 팝업 열기
		for(var i = 0; i < target.length; i++){
		  target[i].addEventListener('click', function(){
		    targetID = this.getAttribute('href');
		    document.querySelector(targetID).style.display = 'block';
		  });
		}
	
		// 팝업 닫기
		for(var j = 0; j < target.length; j++){
		  btnPopClose[j].addEventListener('click', function(){
		    this.parentNode.parentNode.style.display = 'none';
		  });
		}
	</script>
	
</body>
</html>