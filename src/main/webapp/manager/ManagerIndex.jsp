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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">

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
$(function() {
	var category ="";
	var brand ="";
	var sort="ORDER BY COUNT(W.WISH_LIST_NO) DESC";
	var search="";
	selectAllGoods();
	function selectAllGoods() {

		 $.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"goodsAjax" , methodName : "selectAllGoods", brand:brand , category:category , sort:sort, search: search}, //서버에게 보낼 데이터정보(parameter정보)
				success :function(result){
					//wish상태 체크
					
					let str="";
					let count=0;
						$.each(result, function(index, item){		
									
							if(count%5==0){
								str += "<tr>";
							}
							//////////////////////////////
							str += "<td>"
							str += `<div class="bestItem item1">`;
							str += `<div class="item_img_block">`;
							str += `<div class="item_img">`;
							str += `<img alt="상품이미지입니다." src=${path}/${"${item.mainImg}"}  id='product'>`;
							str += `</div>`;
							str += `</div>`;
							str += `<div id='item_text'>`;
							str += `<div class="item_brand">`;
							str += `<a href= "#" id="brand_text">${"${item.brand}"}</a>`;
							str += `</div>`;
							str += `<p id="name"><a href=${path}/front?key=goods&methodName=selectGoodsLine&goodsNo=${"${item.goodsNo}"}&addr=ProductDetails.jsp>${"${item.goodsName}"}</a></p>`;
							str += `<div class="price">`;
							str += `<p id="num">${"${item.sellPrice}"}</p>`;
							str += `<p id="p">즉시구매가</p>`;
							str += `</div>`;
							str += `</div>`;
							str += `</div>`;
							str += "</td>"
							count++;
							if(count%5==0){
								str += "</tr>";
							}
							if(index==9){
								return false;
							}
							//////////////////////////////////////////////////
						});
						$("#product tr:gt(0)").remove();
						$("#product tr:eq(0)").prepend(str);
				 		
						
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
	}
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

		<div id="banner" style="background-color: #222222;">
			<div class="banner_img" style="margin: 0 auto; border: none;">
				<img alt="배너이미지입니다." src="../img/banner/banner01.png">	
			</div>
		</div>
		<div class="clear"></div>


		<div id='contents'>
			<div class="container">
				<div id='con'>
					<section>
						<div class="title">
							<div id="main_title">BEST</div>
							<div id="sub_title">인기상품</div>
						</div>
					</section>
					<section id="product">
						<div class="productBEST_container">
							<table>
 								<tr>
 									<td></td>
 								</tr>
 							</table>
						</div>
						<nav aria-label="Page navigation example" id="pagenav">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous" style="color: #222"> <span
										aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link" href="#"
									style="color: #222">1</a></li>
								<li class="page-item"><a class="page-link" href="#"
									style="color: #222">2</a></li>
								<li class="page-item"><a class="page-link" href="#"
									style="color: #222">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next" style="color: #222"> <span
										aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</section>
					<div class="clear"></div>

					
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
</html>