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

<!-- 외부의 css파일 연결하기 -->
<link rel="stylesheet" type="text/css" href="layout/Reset.css">
<link rel="stylesheet" type="text/css" href="layout/Layout.css">
<link rel="stylesheet" type="text/css" href="css/OrderByBuy.css">

<style type="text/css">
</style>
<script src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".price-total-btn").on("click", function() {
			if($(this).text()=="판매신청 계속"){
			 	if($("#input-amount").val()<=${goodsDTO.highestPrice}){
					alert("즉시판매가보다 낮은 가격입니다. 다시 입력해주세요.");
				}else{
					location.href= '${path}/front?key=goods&methodName=sellApplication&goodsNo=${goodsDTO.goodsNo}&inputPrice='+$("#input-amount").val();
				}
			}else{
				location.href= '${path}/front?key=goods&methodName=sellApplication&goodsNo=${goodsDTO.goodsNo}&inputPrice=${goodsDTO.highestPrice}&addr=sell.jsp';
			}
		})
	})
		
		

</script>
</head>
<body>
	<div id='wrap'>
	
		<jsp:include page= "layout/header.jsp"/>
		<div class="clear"></div>
		
		<div id='contents'>
			<div class="container">
				<div id='con'>
					<div id='product_info'> <!-- 컨테이너 -->
						<div id='product-img'><img src="img/heart-fill.svg"/></div>
						<div id='product-detail'>
							<p id='model-num'>모델번호</p>
							<p id='model-title'>모델이름</p>
							<p id='model-subtitle'>모델서브이름</p>
						</div>
						<div id='price-list'>
							<div class='price01' id='pri01'>
								<p id='title'>즉시 구매가</p>
								<span id='price-now'>${goodsDTO.lowestPrice}</span><span id='won'>원</span>
							</div>
							<div class='price01'>
								<p id='title'>즉시 판매가</p>
								<span id='immediate-price-now'>${goodsDTO.highestPrice}</span><span id='won'>원</span>
							</div>
						</div>
					</div><!-- product_info -->
					
					<div id='order-tap'>
						<div class="btn-group">
						  <button onclick="myFunction01()">판매신청</button>
						  <button onclick="myFunction02()">즉시판매</button>
						</div>
						
						<div id="buy-type01">
						
							<div id='price'>
							
								<span id='price-now-title'>판매희망가</span>
								<div id='price-con'>
									<input type="text"  id='input-amount'  placeholder="희망가 입력" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
									<span id ='won02'></span><span id='price-now-title'>원</span>
								</div>
							</div>
							<div id='price-total'>
								<button type="button" class="price-total-btn" >판매신청 계속</button>
							</div>
						
						
						</div>
				
						<div id="buy-type02">
							<div id='price'>
								<span id='price-now-title'>즉시판매가</span>
								<div id='price-con'>
									<span id='price02'></span>
									<span id ='won02'>${goodsDTO.highestPrice}</span><span id='price-now-title'>원</span>
								</div>
							</div>
							<div id='price-total'>
								<button type="button" class="price-total-btn">즉시 판매 계속</button>
							</div>
						</div>
						
					</div>
				</div>
			</div><!-- container -->
		</div><!-- contents -->
		
		<div class="clear"></div>
		
		<jsp:include page="layout/footer.jsp" />
		
	</div>
	
	<script>
		function myFunction01() {
		  var x = document.getElementById("buy-type01");
		  var y = document.getElementById("buy-type02");
		  
		 
			  if (x.style.display === "none") {
				    x.style.display = "block";
				    y.style.display = "none";
				  } else {
				    x.style.display = "none";
				  }
		  
		}
		function myFunction02() {
			var x = document.getElementById("buy-type02");
			var y = document.getElementById("buy-type01");
			
			if (x.style.display === "none") {
			  x.style.display = "block";
			  y.style.display = "none";
			} else {
			  x.style.display = "none";
		  }
		}
	</script>
</body>
</html>