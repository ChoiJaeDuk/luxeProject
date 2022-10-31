<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet" type="text/css" href="css/setting/Reset.css">
<link rel="stylesheet" type="text/css" href="css/setting/Layout.css">
<link rel="stylesheet" type="text/css" href="css/OrderByBuy.css">
<link rel="stylesheet" type="text/css" href="css/Order.css">

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
			data: {key:"userAjax" , methodName : "sellUserInfo"}, //서버에게 보낼 데이터정보(parameter정보)
			success :function(result){
				$("#buyer-name").text(result.userName);
				$("#buyer-phone").text(result.userPhone);
				$("#buyer-addr").text(result.userAddr);
			} , //성공했을때 실행할 함수 
			error : function(err){  
				alert(err+"에러 발생했어요.");
			}  //실팽했을때 실행할 함수 
		});//ajax끝
	}
	sellUserInfo();
	
	
	$("#payment-submit").click(function() {
		if(confirm("정말 주문하시겠습니까?")){
			location.href= "${path}/front?key=bid&methodName=insertBid&goodsNo=${goodsDTO.goodsNo}&bidPrice=${goodsDTO.lowestPrice}";            
		}
	});
});
</script>
</head>
<body>
	<div id='wrap'>
	
		<jsp:include page="layout/header.jsp" />
		<div class="clear"></div>
		
		<div id='contents' style="background-color: #22222220;">
			<div class="container">
				<div id='con'>
				<div id = 'infoForm'>
					<div id='product_info'> <!-- 컨테이너 -->
						<div id='product-img'><img src="${path}/img/${goodsDTO.goodsMainImg}"/></div>
						<div id='product-detail'>
							<p id='model-title'>${goodsDTO.goodsName}</p>
							<p id='model-subtitle'>${goodsDTO.goodsNameKor}</p>
						</div>
					</div><!-- product_info -->
					
					<div id='delivery'><!-- 컨테이너 -->
						<div id='delivery_detail'>
							<h3>배송 주소</h3>
							<div id='delivery-info-list'>
							<span id='delivery-title'>주문자</span>
							<span id='buyer-name'>홍길동</span>
							</div>
							
							<div id='delivery-info-list'>
							<span id='delivery-title'>연락처</span>
							<span id='buyer-phone'>010-0000-0000</span>
							</div>
							
							<div id='delivery-info-list'>
							<span id='delivery-title'>배송 주소</span>
							<span id='buyer-addr'>경기도 오리역</span>
							</div>
							
						</div>
					</div><!-- delivery -->
					
					<div id='instant_group'><!-- 컨테이너 -->
						<h3>최종 주문 정보</h3>
						<div id='instant'>
							<div id='price_total_order'>
								<p>총 결제금액</p>
								<div id='price_total'>
								<span id='price_total_num'><fmt:formatNumber value="${goodsDTO.lowestPrice+goodsDTO.lowestPrice*0.03}" pattern="#,###"/></span><span  id='price_total_won'>원</span>
								</div>
							</div>
							<div id='bind'>
								<dl id='price_addition'>
									<dt><b>구매가</b></dt>
									<dd><span><b><fmt:formatNumber value="${goodsDTO.lowestPrice}" pattern="#,###"/></b></span><span><b>원</b></span></dd>
								</dl>

								<dl id='price_addition'>
									<dt>수수료</dt>
									<dd><span><fmt:formatNumber value="${goodsDTO.lowestPrice*0.03}" pattern="#,###"/></span><span>원</span></dd>
								</dl>
								<dl id='price_addition'>
									<dt>배송비[무료배송EVENT]</dt>
									<dd><span>0</span><span>원</span></dd>
								</dl>
							</div>
						</div>
					</div><!-- instant_group_con -->
					
					<div id='payment-con'><!-- 컨테이너 -->
						<form action="${path}/front?key=bid&methodName=insertBid&goodsNo=${goodsDTO.goodsNo}&bidPrice=${goodsDTO.lowestPrice}">
								<div id='payment'>
								<h3 id='payment-title'>결제방법</h3>
								<h4 id='method-title'>계좌 간편결제</h4>
								<div id='payment-box'>
									<input type="text" placeholder='계좌번호를 입력해주세요' />
								</div>
									<div id='payment-total'>
										<span>총 결제금액</span>
										<div id='payment-total-price'>
											<span>000.000</span><span>원</span>
										</div>
									</div>
								</div><!-- payment -->
								<button type="button" id='payment-submit'>결제하기</button>
							</form><!--결제방식 form으로 전송  -->
						</div><!-- payment-con -->
						
						</div>
					</div><!-- con -->
				</div><!-- container -->
			</div><!-- contents -->
		
		<div class="clear"></div>
		
		<jsp:include page="layout/footer.jsp" />
		
	</div>
	
	
</body>
</html>