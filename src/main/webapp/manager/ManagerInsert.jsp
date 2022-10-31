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
<link rel="stylesheet" type="text/css" href="../css/manager/ManagerInsert.css">
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.form.min.js"></script>
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
<script type="text/javascript">
	$(function() {
		
	})
</script>
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
				<div id='con'>
					<div id='update-contents'>
						<form id='update-form' name="writeForm" method="post" action="${path}/front?key=goods&methodName=insertGoods" enctype="multipart/form-data">
	
								<div id='update-con'>

									<span>브랜드</span>
									<div class='td brand'>
										<select id='changeBrandSelect' name="brand">
											<option value="0">Brand</option>
											<option value="샤넬">Chanel</option>
											<option value="디올">Dior</option>
											<option value="프라다">Prada</option>
										</select>
									</div>

									<span>카테고리</span>
									<div class='td category'>
										<select id='changeCategorySelect' name="category">
											<option value="0">Category</option>
											<option value="숄더백">Shoulder</option>
											<option value="미니백">Mini</option>
											<option value="쇼퍼백">Shopper</option>
											<option value="클러치">Clutch</option>
											<option value="백팩">Backpack</option>
										</select>
									</div>
									<br> <span>상품명[원어]</span><input type="text"
										class="form-control" placeholder="상품명[원어]"
										id=changeProductName name="goodsName"> <span>상품명[한글]</span><input
										type="text" class="form-control" placeholder="상품명[한글]"
										id=changeProductName2 name="goodsNameKor"> <span>모델번호</span><input
										type="text" class="form-control" placeholder="모델번호"
										id=changeModelNo name="goodsModelNo">
								

								<span>상품출시일</span><input type="text" class="form-control"
									placeholder="상품출시일" id=changeModelDate name="goodsReleaseDate"> <span>상품발매가</span><input
									type="text" class="form-control" placeholder="상품발매가"
									id=changeModelReleasePrice name="goodsReleasePrice" >

								<div id='insertImg'>
									<span>메인이미지업로드</span> <input class="form-control" type="file"
										id="uploadFiles" onchange="uploadFileAdded()" name="img1">
									<div id='insertImg'>
										<span>[서브]이미지업로드</span> <input class="form-control"
											type="file" id="uploadFiles" onchange="uploadFileAdded()" name="img2">
										<div id='insertImg'>
											<span>[서브]이미지업로드</span> <input class="form-control"
												type="file" id="uploadFiles" onchange="uploadFileAdded()" name="img3">
										</div>
									</div>
								</div>

								<div id='update-submt'>
									<input type="submit" value="등록" id='update-submitBtn'>
									<button type="button" id='update-closeBtn' onclick="location.href='ManagerProduct.jsp'">취소</button>
								</div>
							</div>
				

						</form>
						
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