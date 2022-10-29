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
<link rel="stylesheet" type="text/css" href="../layout/css/Reset.css">
<link rel="stylesheet" type="text/css" href="../layout/css/Layout.css">
<link rel="stylesheet" type="text/css" href="../css/manager/ManagerOrder.css">

<style type="text/css">
.sidebar {
	height: 100%;
	width: 0px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #222;
	overflow-x: hidden;
	transition: 0.5s;
	padding: 0;
	display: none;
}

.sidebar a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
	top: 50px;
	position: relative;
}

.sidebar a:hover {
	color: #f1f1f1;
}

.sidebar .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
	.sidebar {
		padding-top: 15px;
	}
	.sidebar a {
		font-size: 18px;
	}	
}


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
<a href="ManagerMember.jsp">회원관리</a> <a href="ManagerProduct.jsp">상품관리</a> <a href="ManagerOrder.jsp">주문현황</a> <a
			href="ManagerSales.jsp">매출현황</a> <a href="ManagerQABoard.jsp">문의관리</a> <a href="ManagerApproval.jsp">상품승인관리</a>
	</div>
	<div id='wrap'>

		<jsp:include page="../layout/header.jsp" />

		<div class="clear"></div>


		<div id='contents'>
			<div class="container">
				<div id='info-container'>
					<h4>주문관리페이지</h4>
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
						  
				 		</table>
						<div id ='page-btn'>
						<a href="#" class="previous">&laquo; 이전</a>
						<a href="#" class="next">다음 &raquo;</a>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<!-- contents -->
		<div class="clear"></div>

		<jsp:include page="../layout/footer.jsp" />

	</div>
	<!-- 스크립트 -->
	<script>
	function openNav() {
	  document.getElementById("mySidebar").style.width = "250px";
	  document.getElementById("wrap").style.marginLeft = "250px";
	  document.getElementById("mySidebar").style.display = "block";
	}
	
	function closeNav() {
	  document.getElementById("mySidebar").style.width = "0px";
	  document.getElementById("wrap").style.marginLeft= "0px";
	  document.getElementById("mySidebar").style.display = "none";
	}
	</script>
</body>
