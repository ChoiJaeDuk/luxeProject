<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<!-- 외부의 css파일 연결하기 -->
<link rel="stylesheet" type="text/css" href="css/layout.css">
<link rel="stylesheet" type="text/css" href="css/ProductDetails.css">
<style type="text/css">
</style>
</head>
<body>
<div id='wrap'>

	<div id='header'>
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
			      <form action="">
			     	 <input type="text" name="search" placeholder="Search.." id='search_bar'>
			      </form>
			    </div>
			  </div>
			</nav>
			</div><!-- container -->
		</div><!-- header-nav -->		
	</div><!-- header -->
	<div class="clear"></div>
	
	<div id='contents'>
		<div class="container">
		<div class="product-img">
		
			<div class="slideshow-container">
			  <!-- Full-width images with number and caption text -->
			  <div class="mySlide2 fade2" style="display: none">
			    <div class="numbertext">1 / 3</div>
			    <img alt="이미지" src="img/banner01.png" style="width:500px; height: 500px;">
			    <div class="text">Caption Text</div>
			  </div>
			
			  <div class="mySlides2 fade2" style="display: none">
			    <div class="numbertext">2 / 3</div>
			    <img alt="이미지" src="${path}/images/main.jpg" style="width:500px; height: 500px;">
			    <div class="text">Caption Two</div>
			  </div>
			
			  <div class="mySlides2 fade2" style="display: none">
			    <div class="numbertext">3 / 3</div>
			    <img alt="이미지" src="img/logo.PNG" style="width:500px; height: 500px;">
			    <div class="text">Caption Three</div>
			  </div>
			
			  <!-- Next and previous buttons -->
			  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			  <a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<br>
			
			<!-- The dots/circles -->
			<div style="text-align:center">
			  <span class="dot" onclick="currentSlide(1)"></span>
			  <span class="dot" onclick="currentSlide(2)"></span>
			  <span class="dot" onclick="currentSlide(3)"></span>
			</div>
			
		</div>
		
		<div class="product-cont">
			<div class="column-col">
				<div><a href="">브랜드</a></div>
				<p>메인타이틀제목입니다</p><p>서브타이틀타이틀제목입니다</p>
				<div id='detail-price'>
					<span id='title'>최근거래가</span>
					<div id='amount'><span id='num'>000,000</span><span id='won'>원</span> </div>
				</div>
				<button class="btn-order sell"><span>판매</span> <span id='num'>000,000</span><span id='won'>원</span></button>
				<button class="btn-order buy"><span>구매</span> <span id='num'>000,000</span><span id='won'>원</span></button>
				<button class="btn-wish">관심상품</button>
				
				<div id='detail-info'>
					<h3>상품정보</h3>
					<span style="background-color: #cccccc;">상품코드</span><span>1223123123-123123213</span>
				</div>
				
				<h3>구매 전 꼭 확인해주세요!</h3>
				<button class="accordion">배송 기간 안내</button>
				<div class="panel">
				  <p>LUXE은 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다. 배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는 속도에 따라 차이가 있습니다.</p>
				</div>
				
				<button class="accordion">검수 안내</button>
				<div class="panel">
				  <p>검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.</p>
				</div>
				
				<button class="accordion">구매 환불/취소/교환 안내</button>
				<div class="panel">
				  <p>단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 상품을 원하지 않으시는 경우 언제든지 LUXE에서 재판매를 하실 수 있습니다.</p>
				</div>
				
			</div>
		</div>
		</div><!-- container -->
	</div><!-- contents -->
	
	<div class="clear"></div>
	<div id='contents'>
		<div class="container">
			<h2>Style</h2>
			
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
				<button class="btn-style">스타일보러가기</button>
		</div>
	</div>
	
	<div id='footer'>
		<div class="container">
	
		</div>
	</div>
	
</div>

<script>
let slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides2");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {
	  slideIndex = 1}    
  if (n < 1) 
  {slideIndex = slides.length}
  
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  
  console.log("slideIndex = " + slideIndex)
}
</script>


<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
</body>
</html>