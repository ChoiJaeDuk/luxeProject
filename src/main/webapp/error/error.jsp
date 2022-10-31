<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
button {
	background-color: #222222;
}
.con{
font-family: 'Noto Sans KR', sans-serif;
}
#contents{
	overflow: hidden;
	min-height:600px;
	min-width: 800px;

}
.container{
	min-width: 800px;
	width: 1280px; 
	height:inherit; 
	margin: 0px auto; 
	padding:0;
}
</style>
<script src="../js/jquery.form.min.js"></script>
</head>
<body>
	<div id="mySidebar" class="sidebar">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="ManagerMember.jsp">회원관리</a> <a href="ManagerProduct.jsp">상품관리</a>
		<a href="ManagerOrder.jsp">주문현황</a> <a href="ManagerSales.jsp">매출현황</a>
		<a href="ManagerQABoard.jsp">문의관리</a> <a href="ManagerApproval.jsp">상품승인관리</a>
	</div>
	<div id='wrap'>

		<jsp:include page="../layout/header.jsp" />

		<div class="clear"></div>

		<div id='contents'>
			<div class="container">
			<div class='con'>
				<div class="col-lg-8 col-lg-offset-2 text-center" style="margin: 0 auto; position: relative; top: 100px;">
					<div class="logo">
						<h1 style="font-family: 'Noto Sans KR', sans-serif; font-weight: 800;">LUXE</h1><br>
					</div>
					<p class="lead text-muted">${errorMsg}
						<c:if test="${empty errorMsg }">로그인 후 이용해주세요.</c:if>
					</p>

					<div class="clearfix"></div>

					<div class="clearfix"></div>
					<br />
					<c:choose>
						<c:when test="${empty loginUser}">
							<div class="col-lg-6  col-lg-offset-3" style="margin: 0 auto;">
								<div class="btn-group btn-group-justified">
									<a href="${pageContext.request.contextPath}/login/login.jsp"
										class="btn btn-primary"  style="background-color: #222222;border:2px solid #ffffff;">Login</a> <a
										href="${pageContext.request.contextPath}/layout/index.jsp"
										class="btn btn-success"  style="background-color: #222222;border:2px solid #ffffff;">HOME</a> <a
										href="javascript:history.back()" class="btn btn-success"  style="background-color: #222222; border:2px solid #ffffff;" >Back</a>
								</div>

							</div>
						</c:when>
						<c:otherwise>
							<div class="col-lg-6  col-lg-offset-3" style="margin: 0 auto;">
								<div class="btn-group btn-group-justified">
									<a href="javascript:history.back()" class="btn btn-primary"  style="background-color: #222222;border:2px solid #ffffff;">Login</a>
									<a href="${pageContext.request.contextPath}/layout.index.jsp"
										class="btn btn-success"  style="background-color: #222222;border:2px solid #ffffff;">HOME</a> <a
										href="javascript:history.back()" class="btn btn-success"  style="background-color: #222222;border:2px solid #ffffff;">Back</a>
								</div>

							</div>
						</c:otherwise>
					</c:choose>
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