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
<link rel="stylesheet" type="text/css" href="../css/manager/ManagerApproval.css">

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

	function approvalList(){
		
		$.ajax({
			url :"../ajax" , //서버요청주소
			type:"post", //요청방식(method방식 : get | post | put | delete )
			dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
			data: {key:"sellAjax" , methodName : "selectSellAll"},	
			success :function(result){
				let str="";
				$.each(result, function(index, item){
					str+=`<tr>`;
					str+=`<td>${"${item.sellNo}"}</th>`;
					str+=`<td>${"${item.userId}"}</th>`;
					str+=`<td>${"${item.brand}"}</th>`;
					str+=`<td>${"${item.goodsName}"}</th>`;
					str+=`<td>${"${item.sellPrice}"}</th>`;
					str+=`<td>${"${item.purdate}"}</th>`;
					str+=`<td>${"${item.serialNumber}"}</th>`;
					str+=`<td>${"${item.sellDate}"}</th>`;
					str+=`<td>
					 <select name="sellStatus">
				    	<option value=${"${item.sellStatus}"} selected>${"${item.sellStatus}"}</option>
				    	<option value="판매중">판매승인</option>
						
// 				    ${"${item.sellStatus}"}
				    </select>
				    </td>`;
					
					str+=`</tr>`;
				})
				
				$("#sellTable tr:gt(0)").remove();
				$("#sellTable tr:eq(0)").after(str);
				
				
			} , //성공했을때 실행할 함수 
			error : function(err){  
				alert(err+"에러 발생했어요.");
			}  //실팽했을때 실행할 함수 
		});//ajax끝
		
		
	}
	
	$(document).on("change", "select[name=sellStatus]", function(){
		let result1;
 		result1 = confirm("판매신청을 승인하시겠습니까 ?");
 		if(result1 == true){
			  $.ajax({
				 
		   			url :"../ajax" , //서버요청주소
		   			type:"post", //요청방식(method방식 : get | post | put | delete )
		   			dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
		   			data: {key:"sellAjax" , methodName : "updateSellStatus" ,sellNo : $(this).parent().prev().prev().prev().prev().prev().prev().prev().prev().text(), sellStatus : $(this).val() }, //서버에게 보낼 데이터정보(parameter정보)
		   			success :function(result){
		   				
		   				if(result==0){
		   					alert("변경되지 않았습니다.");
		   				}else{
		   					alert("변경되었습니다.");
		   					approvalList()
		   				}
		   				
		   			} , //성공했을때 실행할 함수 
		   			error : function(err){  
		   				alert(err+"에러 발생했어요.");
		   			}  //실팽했을때 실행할 함수 
		   		});//ajax끝
 		}
		
		
		
	})
	
	
	approvalList();
})







</script>
</head>
<body>
	<div id="mySidebar" class="sidebar">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="../Manager02/Manager_Member.jsp">회원관리</a> <a href="#">상품관리</a> <a href="../Manager02/Manager_Order.jsp">주문현황</a> <a
			href="../Manager02/Manager_Sales.jsp">매출현황</a> <a href="ManagerQABoard.jsp">문의관리</a> <a href="#">상품승인관리</a>
	</div>
	<div id='wrap'>

		<jsp:include page="../layout/header.jsp" />

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
				<div>
					<h3>상품승인관리</h3>
				</div>
				<div id='sell'>
					<table class="fixed_headers" id = "sellTable">
						<thead>
							<tr>
								<th>신청번호</th>
								<th>회원ID</th>
								<th>브랜드</th>
								<th>상품명</th>
								<th>구매일자</th>
								<th>시리얼넘버</th>
								<th>판매일자</th>
								<th>승인여부</th>
							</tr>
						</thead>
						<tbody>
<!-- 							<tr> -->
<!-- 								<td>[상품판매신청]</td>고정 -->
<!-- 								<td>회원ID1</td> -->
<!-- 								<td>셀린느</td> -->
<!-- 								<td>셀린느가방</td> -->
<!-- 								<td>신청일자</td> -->
<!-- 								<td>									 -->
<!-- 								<select> -->
<!-- 									<option value="0">선택</option> -->
<!-- 									<option value="1">승인</option> -->
<!-- 									<option value="2">대기</option> -->
<!-- 									<option value="3">승인거부</option> -->
<!-- 								</select>									 -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>[상품판매신청]</td>고정 -->
<!-- 								<td>회원ID2</td> -->
<!-- 								<td>구찌</td> -->
<!-- 								<td>구찌가방</td> -->
<!-- 								<td>신청일자</td> -->
<!-- 								<td> -->
<!-- 								<select> -->
<!-- 									<option value="0">선택</option> -->
<!-- 									<option value="1">승인</option> -->
<!-- 									<option value="2">대기</option> -->
<!-- 									<option value="3">승인거부</option> -->
<!-- 								</select>	 -->
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td>[상품판매신청]</td>고정 -->
<!-- 								<td>회원ID3</td> -->
<!-- 								<td>입생로랑</td> -->
<!-- 								<td>입생로랑가방</td> -->
<!-- 								<td>신청일자</td> -->
<!-- 								<td> -->
<!-- 								<select> -->
<!-- 									<option value="0">선택</option> -->
<!-- 									<option value="1">승인</option> -->
<!-- 									<option value="2">대기</option> -->
<!-- 									<option value="3">승인거부</option> -->
<!-- 								</select>	 -->
<!-- 								</td> -->
<!-- 							</tr> -->
							
						</tbody>
					</table>
					</div>
				</div>
			</div>
			<!-- container -->
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
