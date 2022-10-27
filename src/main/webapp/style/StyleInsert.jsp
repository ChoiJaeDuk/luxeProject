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
<link rel="stylesheet" type="text/css" href="../css/setting/Layout.css">
<link rel="stylesheet" type="text/css"
	href="../css/style/StyleBoard.css">
<link rel="stylesheet" type="text/css"
	href="../css/style/StyleInsert.css">
<style type="text/css">
</style>

<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
 	 	//인수받기(test)
	 	let chanel=["징거버거","타워버거","불고기버거"]
	 	let dior=["라이스버거","데리버거","새우버거","한우버거","치즈버거"]
	 	let prada=["1997버거","맥모닝","빅맥","베이컨버거","치킨버거"]

	 	function subMenu(th) {

			let arr = new Function("return "+th.value)();
			let product = document.f.menu;
			
			//옵션제거
			while(product.length>1){
				product.options[1]=null;
			}
			
			
			//옵션추가
			for(let i=0 ; i<arr.length ;i++){
				product.options[product.length]=
					new Option(arr[i],arr[i])
			}
		} 
	</script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#changeProduct").change(function () {
				$("#changeInput").val($(this).val());
			});
		});
	</script>
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

		<div id="banner">
			<div class="banner_img">
				<img alt="배너이미지입니다." src="">
			</div>
		</div>
		<div class="clear"></div>


		<div id='contents'>
			<div class="container">
				<div id='con'>
					<div class="title">
						<div id="main_title">STYLE</div>
					</div>

					<div class='tap-box'></div>

					<!-- 시작 -->

					<div id="insert-form">
						<div id="insert-form" class="hide">
							<div class="insert-con">
								<div id='insert-contents'>						
									<form name="f">
										<select name="brandSelect" onchange="subMenu(this)">
											<option value="0">BRAND-SELECT</option>
											<option value="chanel">CHANEL</option>
											<option value="dior">DIOR</option>
											<option value="prada">PRADA</option>
										</select> 
										<select name="menu"  id='changeProduct'>
											<option value="0">PRODUCT-SELECT</option>
										</select> 
									</form>
																		
									<form name="writeForm" method="post" action="">
									<div id='readonly'>
										<div id='productImg'>
											<img src="../img/product01.webp" alt="상품이미지" />
										</div>
										<div id='insert-title-text'>
											<span>이름</span><input type="text" class="form-control"  placeholder="이름" readonly="readonly">
											<span>상품이름</span><input type="text" class="form-control" placeholder="상품이름" id='changeInput' readonly="readonly">
											<span>상품코드</span><input type="text" class="form-control" placeholder="상품코드" readonly="readonly">
										</div>
									</div>
										
										<div id='insert-text'>
											<div class="form-group">
												<span>내용</span>
												<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
											</div>
										</div>

										<div id='insertImg'>
										<input class="form-control" type="file" id="formFile">
										</div>


										<div id='insert-submt'>
											<input type="submit" value="등록">
											<button onclick="closeInsert()">닫기</button>
										</div>

									</form>
									
									
								</div>
							</div>
						</div>
					</div>
					<!-- insert-form -->

				</div>
				<!-- con -->
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



	
	<script type="text/javascript">
		function showPopup(hasFilter) {
			const popup = document.querySelector('#popup');

			if (hasFilter) {
				popup.classList.add('has-filter');
			} else {
				popup.classList.remove('has-filter');
			}

			popup.classList.remove('hide');
		}

		function closePopup() {
			const popup = document.querySelector('#popup');
			popup.classList.add('hide');
		}
	</script>
	
</body>
</html>