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
<link rel="stylesheet" type="text/css" href="../css/manager/ManagerQABoard.css">

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
				<div id='con'>
				<div>
					<h3>상품문의게시판</h3>
				</div>
				<div id='sell'>
					<table class="fixed_headers">
						<thead>
							<tr>
								<th>  </th>
								<th>회원ID</th>
								<th>브랜드</th>
								<th>상품명</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID1</td>
								<td>셀린느</td>
								<td>셀린느가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID2</td>
								<td>구찌</td>
								<td>구찌가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID3</td>
								<td>입생로랑</td>
								<td>입생로랑가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
							<tr>
								<td>[상품등록문의]</td><!-- 고정 -->
								<td>회원ID4</td>
								<td>샤넬</td>
								<td>샤넬가방</td>
							</tr>
						
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
			document.getElementById("wrap").style.marginLeft = "0px";
			document.getElementById("mySidebar").style.display = "none";
		}
	</script>
</body>