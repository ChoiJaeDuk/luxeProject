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
<link rel="stylesheet" type="text/css" href="css/setting/Reset.css">
<link rel="stylesheet" type="text/css" href="css/setting/Layout.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<style>
 a{text-decoration: none}
</style>
<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function(){
			
	$("#nav-search").on("keyup",function(){
		if($(this).val() == ""){
			$("#suggest").hide();
				return;
		}
		$.ajax({
			url :"ajax" , //서버요청주소
			type:"post", //요청방식(method방식 : get | post | put | delete )
			dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
			data: {key:"goodsAjax" , methodName : "selectGoodsByGoodsName" , keyWord:$(this).val()}, //서버에게 보낼 데이터정보(parameter정보)
			success :function(result){
				let str="";
				if(result.length>0){
					$.each(result, function(index, item){
						str += "<a href ='#'>"+item+"</a><br>";		
						
					})
					
					$("#suggest").html(str);
	 				$("#suggest").show();
	 					
				}else{
					$("#suggest").hide();
				}
			
				
			} , //성공했을때 실행할 함수 
			error : function(err){  
				alert(err+"에러 발생했어요.");
			}  //실팽했을때 실행할 함수 
		});//ajax끝
	})
	
	$(document).on("click", "a", function(){
 			$("#nav-search").val($(this).text());
 			$("#nav-search").focus();
 			$("#suggest").hide();
 		})
	
	
});

</script>

</head>
<body>
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
					<a href="#">HOME</a> 
					<a href="style/StyleBoard.jsp">STYLE</a> 
					<a href="shop/shop.jsp">SHOP</a>
					<div class="split">
						<form name="search" id="search" action="${path}/front">
					    <input type="hidden" name="key" value="goods" >
					    <input type="hidden" name="methodName" value="selectGoodsByGoodsName" >
					    <input type="text" placeholder="Search.." name="search" id="nav-search">
						</form>
						<div id="suggest" style="display:none"></div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>