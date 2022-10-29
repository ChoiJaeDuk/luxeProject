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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
<link rel="stylesheet" type="text/css" href="../css/Reset.css">
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/Layout.css">
<link rel="stylesheet" type="text/css" href="../css/Manager/Manager_Layout.css">
<link rel="stylesheet" type="text/css" href="../css/Manager/Manager_Order.css">

<style type="text/css">
</style>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
	function orderList(){
		$.ajax({
			url :"../ajax" , //서버요청주소
			type:"post", //요청방식(method방식 : get | post | put | delete )
			dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
			data: {key:"orderAjax" , methodName : "selectOrder" },	
			success :function(result){
				let str="";
				$.each(result, function(index, item){
				    str+="<tr>";
				    str+=`<td>${"${(item.orderNo)}"}</td>`;
				    str+=`<td>${"${item.orderPrice.toLocaleString()}"}</td>`;
				    str+=`<td>${"${item.orderDate}"}</a></td>`;
				    str+=`<td>
				    <select name="orderStatus">
				    	<option value=${"${item.orderStatus}"} selected>${"${item.orderStatus}"}</option>
				    	<option value="검수대기">검수대기</option>
						<option value="검수중">검수중</option>
						<option value="배송시작">배송시작</option>
						<option value="배송완료">배송완료</option>
						<option value="주문취소">주문취소</option>
				    ${"${item.orderStatus}"}
				    </select>
				    </td>`;
				   
				    
				    str+=`<td>${"${item.buyerId}"}</td>`;
				    str+=`<td>${"${item.sellerId}"}</td>`;
				    str+="</tr>";
				   
			  });
				
				$("#myTable tr:gt(0)").remove();
				$("#myTable tr:eq(0)").after(str);
				
			} , //성공했을때 실행할 함수 
			error : function(err){  
				alert(err+"에러 발생했어요.");
			}  //실팽했을때 실행할 함수 
		});//ajax끝
		
		
		
		
	}
	
	$(document).on("change","select[name=orderStatus]" , function(){
		let result1;
 		result1 = confirm("배송상태를 변경하시겠습니까?");
 		if(result1 == true){
 			console.log(result1);
			  $.ajax({
				 
		   			url :"../ajax" , //서버요청주소
		   			type:"post", //요청방식(method방식 : get | post | put | delete )
		   			dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
		   			data: {key:"orderAjax" , methodName : "updateOrderByUserID" ,orderNo : $(this).parent().prev().prev().prev().text(), orderStatus : $(this).val() }, //서버에게 보낼 데이터정보(parameter정보)
		   			success :function(result){
		   				if(result==0){
		   					alert("변경되지 않았습니다.");
		   				}else{
		   					alert("변경되었습니다.");
		   					orderList();
		   				}
		   				
		   			} , //성공했을때 실행할 함수 
		   			error : function(err){  
		   				alert(err+"에러 발생했어요.");
		   			}  //실팽했을때 실행할 함수 
		   		});//ajax끝
 		}
 		
	   });
	
	
	
	orderList();
	
	
})

</script>
</head>
<body>
<div id="mySidebar" class="sidebar">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="Manager_Member.jsp">회원관리</a>
		  <a href="Manager_Order.jsp">주문관리</a>
		  <a href="Manager_Sales.jsp">매출관리</a>
		  <a href="#">상품등록</a>
</div>
<div id='main'>
		<div id='header'>
			<div class="container">
				<div id='header-top'>
					<div class="container">
						<div id='header-top-menu'>
							<a href="">마이페이지</a> <a href="">관심상품</a> <a href="">로그인</a><a class="openbtn" onclick="openNav()">관리자모드</a>
						</div>
					</div>
					<!-- container -->
				</div>
				<!--header-top -->

				<div id='header-nav'>
					<div class="container">
						<nav class="navbar navbar-expand-lg navbar-light bg-light">
							<div class="container-fluid">
								<a class="navbar-brand" href="#">Navbar</a>
								<button class="navbar-toggler" type="button"
									data-bs-toggle="collapse" data-bs-target="#navbarColor03"
									aria-controls="navbarColor03" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
								<div class="collapse navbar-collapse" id="navbarColor03">
									<ul class="navbar-nav me-auto">
										<li class="nav-item"><a class="nav-link active" href="#">Home
										</a></li>
										<li class="nav-item"><a class="nav-link" href="#">Shop</a>
										</li>
										<li class="nav-item"><a class="nav-link" href="#">Style</a>
										</li>
									</ul>
									<form class="d-flex">
										<input class="form-control me-sm-2" type="text"
											placeholder="Search">
										<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
									</form>
								</div>
							</div>
						</nav>
					</div>
					<!-- container -->
				</div>
				<!-- header-nav -->

			</div>
			<!--header container -->
		</div>
		<!-- header -->
		<div class="clear"></div>
	
		<div id='contents'>
			<div class="container">
				<div id='info-container'>
					<h4>주문관리페이지</h4>
					<p>관련 texttextexttext</p>
					<div>
						<table id="myTable">
						  <tr class="header">
						    <th style="width:10%;">번호</th>
						    <th style="width:20%;">주문가격</th>
						    <th style="width:20%;">주문날짜</th>
						    <th style="width:15%;">배송상태</th>
						    <th style="width:15%;">구매자ID</th>
						    <th style="width:15%;">판매자ID</th>
						  </tr>
<!-- 						  <tr> -->
<!-- 						    <td>a01</td> -->
<!-- 						    <td>000.000원</td> -->
<!-- 						    <td>0000-00-00</td> -->
<!-- 						    <td>배송상태</td> -->
<!-- 						    <td>Alfreds</td> -->
<!-- 						    <td>Germany</td> -->
<!-- 						  </tr> -->
<!-- 						  <tr> -->
<!-- 						    <td>a01</td> -->
<!-- 						    <td>000.000원</td> -->
<!-- 						    <td>0000-00-00</td> -->
<!-- 						    <td>배송상태</td> -->
<!-- 						    <td>Alfreds</td> -->
<!-- 						    <td>Germany</td> -->
<!-- 						  </tr> -->
<!-- 						  <tr> -->
<!-- 						    <td>a01</td> -->
<!-- 						    <td>000.000원</td> -->
<!-- 						    <td>0000-00-00</td> -->
<!-- 						    <td>배송상태</td> -->
<!-- 						    <td>Alfreds</td> -->
<!-- 						    <td>Germany</td> -->
<!-- 						  </tr> -->
						  
						</table>
						<div id ='page-btn'>
						<a href="#" class="previous">&laquo; Previous</a>
						<a href="#" class="next">Next &raquo;</a>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<!-- contents -->
		<div class="clear"></div>

		<div id='footer'>
			<div class="container"></div>
		</div>

	</div>
	
	<script>
	function openNav() {
	  document.getElementById("mySidebar").style.width = "250px";
	  document.getElementById("main").style.marginLeft = "250px";
	}
	
	function closeNav() {
	  document.getElementById("mySidebar").style.width = "0";
	  document.getElementById("main").style.marginLeft= "0";
	}
	</script>
</body>
</html>
