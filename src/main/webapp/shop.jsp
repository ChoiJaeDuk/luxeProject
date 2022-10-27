<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- 외부의 css파일 연결하기 -->
<link rel="stylesheet" type="text/css" href="css/shop.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
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
<script src="js/jquery-3.6.1.min.js"></script>
<style type="text/css">
</style>

<script type="text/javascript">
	
	$(function() {
		selectAllGoods();
		function selectAllGoods() {
			 $.ajax({
					url :"ajax" , //서버요청주소
					type:"post", //요청방식(method방식 : get | post | put | delete )
					dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data: {key:"goodsAjax" , methodName : "selectAllGoods", brand:"" , category:"" , arrange : ""}, //서버에게 보낼 데이터정보(parameter정보)
					success :function(result){
					
						let str="";
						
							$.each(result, function(index, item){
							
								str += `<div class="bestItem item1" float="left">`;
								str += `<div class="item_img_block">`;
								str += `<div class="item_img">`;
								str += `<img alt="상품이미지입니다." src=${path}/${"${item.mainImg}"} id='product' >`;
								str += `</div>`;
								str += `<div id='like'><img src="img/heart.svg" id='like_img' ></div>`;
								str += `</div>`;
								str += `<div id='item_text'>`;
								str += `<div class="item_brand">`;
								str += `<a href="#" id="brand_text">${"${item.brand}"}</a>`;
								str += `</div>`;
								str += `<p id="name"><a href="#">${"${item.goodsName}"}</a></p>`;
								str += `<div class="price">`;
								str += `<p id="num">${"${item.sellPrice}"}</p>`;
								str += `<p id="p">즉시구매가</p>`;
								str += `</div>`;
								str += `</div>`;
								str += `</div>`;

					  });
							$("#product").before(str);
							 
					 	//$(".productBEST_container tr:gt(0)").remove();
							
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
	<div id='page'>

		<header>
		<div id='logo'>
			<img alt="로고" src="img/logo.PNG">
		</div>
		
		<nav id='menus'>
			<div id='top_menu'>
				<a href="mypage.jsp">마이페이지</a> <a href="">관심상품</a> <a href="login.jsp">로그인</a>
			</div>
			<ul id='main_menu'>
				<li><a href="">SHOP</a></li>
				<li><a href="">STYLE</a></li>
				<li><a href="">HOME</a></li>
				<li><form class="search" role="search">
				<input id="searchbar" type="search">
				<a id="searchicon" type="submit"><i class="bi bi-search" ></i></a>
			</form></li>
			</ul>
			
		</nav>
	</header>	
	<div class="clear"></div>
	
		<section id='banner'>
			<div id='brand1'></div>
			<div id='brand2'></div>
			<div id='brand3'></div>
		</section>
	
	<section id='contents'>
		<nav id='sub_menu'>
		<h3>필터</h3>
			<div class="accordion" id="accordionPanelsStayOpenExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
			        <div id="accordion-body-top">
				        <div id="accordion-body-text">
				       		<strong>브랜드</strong>
				        	<p>선택된항목</p>
				        </div>
				        <div id="accordion-body-icon"></div>
			        </div>
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
			      <div class="accordion-body">
			        	<ul>
			        		<li><label><input type="checkbox" name="color" value="샤넬">CHANEL</label></li>
			        		<li><label><input type="checkbox" name="color" value="디올">DIOR</label></li>
			        		<li><label><input type="checkbox" name="color" value="프라다">PRADA</label></li>
			        	</ul>
			      </div>
			    </div>
			  </div>
				<!--아코디언 내용 추가  -->
				<div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
			        <div id="accordion-body-top">
				        <div id="accordion-body-text">
				       		<strong>카테고리</strong>
				        	<p>선택된항목</p>
				        </div>
				        <div id="accordion-body-icon"></div>
			        </div>
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
			      <div class="accordion-body">
			        	<ul>
			        		<li><label><input type="checkbox" name="color" value="blue">숄더백</label></li>
			        		<li><label><input type="checkbox" name="color" value="blue">미니팩</label></li>
			        		<li><label><input type="checkbox" name="color" value="blue">쇼퍼백</label></li>
			        		<li><label><input type="checkbox" name="color" value="blue">클러치</label></li>
			        		<li><label><input type="checkbox" name="color" value="blue">백팩</label></li>
			        	</ul>
			      </div>
			    </div>
			  </div>
			</div>
		</nav>
		
		<section id='main_contents'>
		
			<div id='contents_top'>
				<div id='contents_text' >
					<h3>브랜드이름</h3>
				</div>
				
				<div id="dropdown">
					<!-- Example single danger button -->
					<div class="btn-group">
					  <button type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    Action
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">Action</a></li>
					    <li><a class="dropdown-item" href="#">Another action</a></li>
					    <li><a class="dropdown-item" href="#">Something else here</a></li>
					    <li><hr class="dropdown-divider"></li>
					    <li><a class="dropdown-item" href="#">Separated link</a></li>
					  </ul>
					</div>
				</div>
			</div>
			
			<section id='product'>
<!-- 				<div class="productBEST_container"> -->
				<!-- 
					<div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="상품이미지입니다." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img' ></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">브랜드</a>
							</div>
							<p id="name">상품이름</p>
							<div class="price">
								<p id="num">000,000원</p>
								<p id="p">즉시구매가</p>
							</div>
						</div>
					</div>
					<div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="상품이미지입니다." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img'></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">브랜드</a>
							</div>
							<p id="name">상품이름</p>
							<div class="price">
								<p id="num">000,000원</p>
								<p id="p">즉시구매가</p>
							</div>
						</div>
					</div>
					 -->
<!-- 				</div> -->
				
	
					
				
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
			</section>
		</section>
		<div class="clear"></div>
		<section> </section>
		<footer> </footer>
	</div>
	<!--page -->
	
	   <script>

        var i = 0;
        $('#like_img').on('click',function(){
            if(i==0){
                $(this).attr('src','img/heart-fill.svg');
                i++;
            }else if(i==1){
                $(this).attr('src','img/heart.svg');
                i--;
            }

        });
    </script>
</body>
</html>