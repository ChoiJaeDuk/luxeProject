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
var malls = false;

function update_selected() {
  $("#mallSelect").val(0);
  $("#mallSelect").find("option[value!=0]").detach();

  $("#mallSelect").append(malls.filter(".mall" + $(this).val()));
}

$(function() {
  malls = $("#mallSelect").find("option[value!=0]");
  malls.detach();

  $("#productSelect").change(update_selected);
  $("#productSelect").trigger("change");
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
									<form name="writeForm" method="post" action="">
										<div id='insert-title'>
											<img src="../img/icon/userphoto_icon.png"
												style="width: 60px; opacity: 0.8; float: left;" />
											<div id='insert-title-text'>
												<input type="text" placeholder="이름" readonly="readonly">
											</div>
											<button onclick="closeInsert()">닫기</button>
										</div>
										<div id='insert-img'>
											<img src="../img/product01.webp" alt="스타일이미지" />
										</div>
										<div id='insert-text'>
											<div class="form-group">
												<label for="exampleTextarea" class="form-label mt-4">Example
													textarea</label>
												<textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
											</div>
										</div>
										<div id='insert-tag'>
											<div class="form-group">
												<select class="form-select" id="brandSelect">
													   <option value="0" selected="selected">BRAND</option>
													   <option value="chanel">CHANEL</option>
													   <option value="dior">DIOR</option>
													   <option value="prada">PRADA</option>
												</select>
										
												<select class="form-select" id="productSelect">
													   <option value="0">제품명선택</option>
													   <option value="샤넬01" class="chanel">샤넬01</option>
													   <option value="샤넬02" class="chanel">샤넬02</option>
													   <option value="샤넬03" class="chanel">샤넬03</option>
													   <option value="디올01" class="dior">디올01</option>
													   <option value="디올02" class="dior">디올02</option>
													   <option value="디올03" class="dior">디올03</option>
													   <option value="프라다01" class="prada">프라다01</option>
													   <option value="프라다02" class="prada">프라다02</option>
													   <option value="프라다03" class="prada">프라다03</option>
												</select>
												
												
											</div>

										</div>
										<div id='insert-submt'>
											<div id='insert-submt'>
												<input type="submit" value="등록">
											</div>
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


	<div id="popup" class="hide">
		<div class="popup-form">
			<div id='popup-contents'>
				<div id='popup-title'>
					<img src="../img/icon/userphoto_icon.png"
						style="width: 60px; opacity: 0.8; float: left;" />
					<div id='popup-title-text'>
						<h4>작성자이름</h4>
						<p>날짜</p>
					</div>
					<div id='drop-btn'>
						<div class="select-tap">
							<div class="text">선택</div>
							<ul class="option-list">
								<li class="option">선택</li>
								<li class="option">삭제</li>
								<li class="option">수정</li>
							</ul>
						</div>
					</div>
				</div>
				<div id='popup-img'>
					<img src="../img/product01.webp" alt="스타일이미지" />
				</div>
				<div id='popup-like'>
					<div id='popup-like-con'>
						<img src='../img/icon/favorite01.png'
							style="width: 20px; height: 20px;"> <span>좋아요</span> <span
							style="font-family: 'Roboto', sans-serif;">0</span> <span>개</span>
					</div>
				</div>
				<div id='popup-text'>
					<p style="width: 100%; overflow: hidden;">내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다내용입니다s</p>
				</div>
				<div id='popup-tag'>
					<span>#모델번호</span> <span>#상품명</span> <span>#브랜드</span>
				</div>
				<div id='popup-close'>
					<button onclick="closePopup()">닫기</button>
				</div>
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
		
	
		/* 중분류소분류 */
		var brands = false;
		
		function update_selected() {
		  $("#productSelect").val(0);
		  $("#productSelect").find("option[value!=0]").detach();
		
		  $("#productSelect").append(brands.filter($(this).val()));
		}
		
		$(function() {
			brands = $("#productSelect").find("option[value!=0]");
			brands.detach();
		
		  $("#brandSelect").change(update_selected);
		  $("#brandSelect").trigger("change");
		});
	</script>
</body>
</html>