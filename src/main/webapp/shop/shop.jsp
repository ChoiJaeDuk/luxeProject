<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
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
<link rel="stylesheet" type="text/css" href="../css/setting/Reset.css">
<link rel="stylesheet" type="text/css" href="../css/shop/shop.css">
<link rel="stylesheet" type="text/css" href="../css/setting/Layout.css">
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<style type="text/css">
	.productImg {

		overflow: hidden;
	}
	
	.item_img_block {
	    width: 230px;
	    /* height: 230px; */
	    margin: 0;
	    padding: 0;
	}
	.btn-group, .btn-group-vertical {
	    float: right;
	}
	#banner{
	    overflow: hidden
	}
</style>
<script type="text/javascript">
	
	$(function(){
		
		var state = "<%=request.getParameter("state")%>";
		var search = "<%=request.getParameter("search")%>";
		if(state == 1){
			var search= "'%" + search + "%'";
		}else{
			var search="";
		}
			selectAllGoods();
			
			var category ="";
			var brand ="";
			var sort="";
			
			var heartState = "../img/heart.svg";
			function selectAllGoods() {
				 $.ajax({
						url :"../ajax" , //서버요청주소
						type:"post", //요청방식(method방식 : get | post | put | delete )
						dataType:"json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data: {key:"goodsAjax" , methodName : "selectAllGoods", brand:brand , category:category , sort:sort , search: search}, //서버에게 보낼 데이터정보(parameter정보)
						success :function(result){
							//wish상태 체크
							
							let str="";
							let count=0;
								$.each(result, function(index, item){		
									if(item.goodsLikeByUser==1){	
										heartState = "../img/heart-fill.svg";
									}else{
										heartState = "../img/heart.svg";
									}
													
									if(count%4==0){
										str += "<tr>";
									}
									str += "<td>"
									str += `<div class="bestItem item1" style="overflow:hidden">`;
									str += `<div class="item_img_block">`;
									str += `<div class="item_img" style="overflow:hidden; border-bottom:1px solid lightgray">`;
									str += `<a href=${path}/front?key=goods&methodName=selectGoodsLine&goodsNo=${"${item.goodsNo}"}&addr=ProductDetails.jsp style="color:black"><img alt="상품이미지입니다." src=${path}/img/${"${item.mainImg}"}  id='product'></a>`;
									str += `</div>`;
									str += `<div id='like'><img src= ${"${heartState}"} id='like_img' name=${"${item.goodsNo}"} ></div>`;
									str += `</div>`;
									str += `<div id='item_text'>`;
									str += `<div class="item_brand">`;
									str += `<a href= "#" id="brand_text">${"${item.brand}"}</a>`;
									str += `</div>`;
									str += `<p id="name"><a href=${path}/front?key=goods&methodName=selectGoodsLine&goodsNo=${"${item.goodsNo}"}&addr=ProductDetails.jsp style="color:black">${"${item.goodsName}"}</a></p>`;
									str += `<div class="price">`;
									str += `<p id="num">${"${item.sellPrice}"}</p>`;
									str += `<p id="p">즉시구매가</p>`;
									str += `</div>`;
									str += `</div>`;
									str += `</div>`;
									str += "</td>"
									count++;
									if(count%4==0){
										str += "</tr>";
									}
								});
								$("#product tr:gt(0)").remove();
								$("#product tr:eq(0)").prepend(str);
						 		$("").css("overflow","hidden");
								
						} , //성공했을때 실행할 함수 
						error : function(err){  
							alert(err+"에러 발생했어요.");
						}  //실팽했을때 실행할 함수 
					});//ajax끝
			}
		
		
		
		
        $("[name='brand']").on("click", function() {
			let i = $("input[name='brand']:checked").length;
			let count = 1;
			brand ="";
			$("input[name='brand']:checked").each(function() {
				if(i>count){
					brand += "'" + $(this).val() + "' OR BRAND LIKE ";
				}else{
					brand += "'" + $(this).val() + "' ";
				}
				count++;
			})
			selectAllGoods();
		})
		
		
		$("[name='category']").on("click", function() {
			let i = $("input[name='category']:checked").length;
			let count = 1;
			category ="";
			$("input[name='category']:checked").each(function() {
				if(i>count){
					category += "'" + $(this).val() + "' OR CATEGORY LIKE ";
				}else{
					category += "'" + $(this).val() + "' ";
				}
				count++;
			})
			selectAllGoods();
		})
		
		$("#sort").on("change", function() {
			sort = $(this).val();
			selectAllGoods();
		});
        
        
 
        $(document).on('click','#like_img',function(){
        	
            if($(this).attr("src")=="../img/heart.svg"){
                $.ajax({
					url:"../ajax",
					type:"post",
					dataType:"text",
					data:{key:"wishListAjax" , methodName : "insertWishList", goodsNo: $(this).attr("name")},
					success : function(result) {
						console.log(result);
					},
					error : function(err) {
						alert(err+"에러  발생");
					}
				
				})//ajax끝
            }else if($(this).attr("src")=="../img/heart-fill.svg"){
            	$.ajax({
					url:"../ajax",
					type:"post",
					dataType:"text",
					data:{key:"wishListAjax" , methodName : "deleteWishList", goodsNo: $(this).attr("name")},
					success : function(result) {
						console.log(result);
					},
					error : function(err) {
						alert(err+"에러  발생");
					}
				})
            }
     
            selectAllGoods();
             

        }); 
        
        $("#nav-search").on("keyup",function(){
    		if($(this).val() == ""){
    			$("#suggest").hide();
    				return;
    		}
    		$.ajax({
    			url :"../ajax" , //서버요청주소
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
    	
     	$("[name='search']").on("keypress", function (key) {
            if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
            	
            	search = "'%"+$("[name='search']").val()+"%'";
            	category ="";
    			brand ="";
    			sort="";
            	selectAllGoods();
            }
     
        });
	});
	
</script>
</head>
<body>

<%-- <input type="text" id="test" name=<%=request.getParameter("state") %>> --%>

<div id='wrap'>

	<jsp:include page= "../layout/header.jsp"/>
		<div class="clear"></div>

		<div id="banner" style="background-color: #222222;">
			<div class="banner_img" style="margin: 0 auto; border: none;">
				<img alt="배너이미지입니다." src="../img/banner/banner02.png">	
			</div>
		</div>
		<div class="clear"></div>


		<div id='contents'>
			<div class="container">
				<div id='con'>
					<nav id='sub_menu'>
						<div class="accordion" id="accordionPanelsStayOpenExample">
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseOne"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseOne" style="background-color: #222222;
	color: #ffffff;">
										<div id="accordion-body-top">
											<div id="accordion-body-text">
												<strong>브랜드</strong>
												<p>선택된항목</p>
											
											</div>
											<div id="accordion-body-icon"></div>
										</div>
									</button>
								</h2>
								<div id="panelsStayOpen-collapseOne"
									class="accordion-collapse collapse show"
									aria-labelledby="panelsStayOpen-headingOne">
									<div class="accordion-body">
										<ul>
											<li><label><input type="checkbox" name="brand" value="샤넬">CHANEL</label></li>
				        					<li><label><input type="checkbox" name="brand" value="디올">DIOR</label></li>
				        					<li><label><input type="checkbox" name="brand" value="프라다">PRADA</label></li>
										</ul>
									</div>
								</div>
							</div>
							<!--아코디언 내용 추가  -->
							<div class="accordion-item">
								<h2 class="accordion-header" id="panelsStayOpen-headingOne">
									<button class="accordion-button" type="button"
										data-bs-toggle="collapse"
										data-bs-target="#panelsStayOpen-collapseOne"
										aria-expanded="true"
										aria-controls="panelsStayOpen-collapseOne" style="background-color: #222222;
	color: #ffffff;">
										<div id="accordion-body-top">
											<div id="accordion-body-text">
												<strong>카테고리</strong>
												<p>선택된항목</p>
											</div>
											<div id="accordion-body-icon" ></div>
										</div>
									</button>
								</h2>
								<div id="panelsStayOpen-collapseOne"
									class="accordion-collapse collapse show"
									aria-labelledby="panelsStayOpen-headingOne">
									<div class="accordion-body">
										<ul>
							        		<li><label><input type="checkbox" name="category" value="숄더백">숄더백</label></li>
							        		<li><label><input type="checkbox" name="category" value="미니백">미니백</label></li>
							        		<li><label><input type="checkbox" name="category" value="쇼퍼백">쇼퍼백</label></li>
							        		<li><label><input type="checkbox" name="category" value="클러치">클러치</label></li>
							        		<li><label><input type="checkbox" name="category" value="백팩">백팩</label></li>
							        	</ul>
									</div>
								</div>
							</div>
						</div>
					</nav>

					<section id='main_contents'>

						<div id='contents_top'>
							

							<div id="dropdown">
								<!-- Example single danger button -->
								<div class="btn-group">
									<select name="sort" id="sort">
									 <option value="">정렬</option>
									  	<option value="ORDER BY G.GOODS_DATE DESC">최신순</option>
									  	<option value="ORDER BY S.SELL_PRICE ASC NULLS LAST">가격낮은순</option>
									  	<option value="ORDER BY S.SELL_PRICE DESC NULLS LAST">가격높은순</option>
									 	<option value="ORDER BY COUNT(W.WISH_LIST_NO) DESC">인기순</option>
									  </select>
								</div>
							</div>
						</div>

						<section id='product'>
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
					</section>
				</div>
			</div>
			<!-- container -->
		</div>
		<!-- contents -->
		<div class="clear"></div>

		<jsp:include page="../layout/footer.jsp" />

	</div>
	
	<!-- 스크립트 -->
	<script type="text/javascript" src="StyleBoard.js"></script>
</body>
</html>