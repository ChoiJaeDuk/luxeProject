<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<script src="../js/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 외부의 css파일 연결하기 -->
<!-- <link rel="stylesheet" type="text/css" href="css/mypage2.css"> -->
<style type="text/css">
button {
  height: 2.5em;
  cursor: pointer;
}

#popup {
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, .7);
  z-index: 1;
}

#popup.hide {
  display: none;
}

#popup.has-filter {
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
}

#popup .content {
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}
input {
		background-color: white;
		border: 1px solid black;
		
		box-sizing: border-box;
	}
</style>

<script type="text/javascript">
	
	$(function() {
		
		
		 function selectSellingInfoByUserId(){ //판매중 상품 조회
			   $.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"sellAjax" , methodName : "selectSellingInfoByUserId", id : "id"}, //서버에게 보낼 데이터정보(parameter정보)
				success :function(result){
					let str="";
					$.each(result, function(index, item){
					    str+="<tr>";
					    str+="<td>"+ (index+1) +"</td>";
					    str+=`<td>${"${item.goodsDTO.goodsName}"}</td>`;
					    str+=`<td>${"${item.goodsDTO.brand}"}</td>`;
					    str+=`<td>${"${item.sellPrice}"}</td>`;
					    str+=`<td>${"${item.sellDate}"}</td>`;
					    str+=`<td id='highestPrice'>${"${item.goodsDTO.highestPrice}"}`
					    str+=`<td><input type='button' value='가격수정' name=${'${item.sellNo}'}></td>`;
					    str+=`<td><input type='button' value='판매취소' name='sellCancel' id = ${'${item.sellNo}'}></td>`;
					    str+="</tr>";
				  });
				 	$("#profile2 tr:gt(0)").remove();
					$("#profile2 tr:eq(0)").after(str); 
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
		   }// 함수끝
		
			
		
		function selectSellWaitInfoByUserId() {//판매대기중 상품조회
			$.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"sellAjax" , methodName : "selectSellWaitInfoByUserId", id : "id"}, //서버에게 보낼 데이터정보(parameter정보)
				success :function(result){
					let str="";
					$.each(result, function(index, item){
					    str+="<tr>";
					    str+="<td>"+ (index+1) +"</td>";
					    str+=`<td>${"${item.goodsDTO.goodsName}"}</td>`;
					    str+=`<td>${"${item.goodsDTO.brand}"}</td>`;
					    str+=`<td>${"${item.sellPrice}"}</td>`;
					    str+=`<td>${"${item.sellDate}"}</td>`;
					    str+=`<td id='highestPrice'>${"${item.goodsDTO.highestPrice}"}`
					    str+=`<td><input type='button' value='판매취소' name='sellCancel' id =${'${item.sellNo}'}></td>`;
					    str+="</tr>";
				  });
					$("#profile3 tr:gt(0)").remove();
					$("#profile3 tr:eq(0)").after(str);
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
		};
		
		//관심목록 조회
		 function wishList() {
			$.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"wishListAjax" , methodName : "selectWishList", id :"id"}, //서버에게 보낼 데이터정보(parameter정보)
				success :function(result){
					let str="";  //str+=`<td>${"${item.goodsDTO.goodsName}"}</td>`;
					$.each(result, function(index, item){
						str += "<tr>";
						str += `<td><div class=${"bestItem item${index+1}"}>`;
						str += `<div class="item_img_block">`;
						str += `<div class="item_img">`;
						str += `<img alt="상품이미지입니다." src=${pageContext.request.contextPath}/goodsImg/1.png id='product' width = "150" height="150" ></div>`;		
						str += `<div id='like'><img src="img/heart.svg" id='like_img'></div></div>`;
						str += `<div id='item_text'>`;
						str += `<div class="item_brand">`;
						str += `<a href="#" id="brand_text">${"${item.brand}"}</a></div>`;
						str += `<p id="name">${"${item.goodsName}"}</p>`;
						str += `<div class="price">`;
						str += `<p id="num">${"${item.lowestPrice}"}원</p>`;
						str += `<p id="p">즉시구매가  <input type='button' value='삭제' name='deleteWishList' id =${'${item.goodsNo}'}></div></div></div>`;
						str += "</td></tr>";
				  });
					$(".productBEST_container tr:gt(0)").remove();
					$(".productBEST_container tr:eq(0)").after(str);
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수
			})
		}
		
		
		//관심목록 삭제
			$(document).on("click", "[name=deleteWishList]", function() {
				if(confirm("관심목록에서 삭제하시겠습니까?")){
					$.ajax({
						url :"../ajax" , //서버요청주소
						type:"post", //요청방식(method방식 : get | post | put | delete )
						dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data: {key:"wishListAjax" , methodName : "deleteWishList", goodsNo : $(this).attr("id")}, //서버에게 보낼 데이터정보(parameter정보)
						success :function(result){
							alert("관심목록에서 삭제되었습니다.");
			
							wishList();
						} , //성공했을때 실행할 함수 
						error : function(err){  
							alert(err+"에러 발생했어요.");
						}  //실팽했을때 실행할 함수 
					});//ajax끝
				} 
			})
		
		
		//가격수정 팝업창
		$(document).on("click","[value='가격수정']", function(){
			let sellNo = $(this).attr("name");
			const popup = document.querySelector('#popup');
			$("[name='sellNo']").val(sellNo);
			popup.classList.remove('has-filter');
			popup.classList.remove('hide');
			$("[name=sellPrice]").val("");
		});
		
		//가격수정하기	
		
		$(document).on("click", "#priceChange", function() {
			//alert($("#highestPrice").text());
				alert($("[name='sellPrice']").val() < $("#highestPrice").text())
				if($("[name='sellPrice']").val() > $("#highestPrice").text()){
					if(confirm("정말 수정하시겠습니까?")){
						$.ajax({
							url :"../ajax" , //서버요청주소
							type:"post", //요청방식(method방식 : get | post | put | delete )
							dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
							data: {key:"sellAjax" , methodName : "updateSellPrice", userId : "id", sellNo : $("[name='sellNo']").val(), sellPrice : $("[name='sellPrice']").val()}, //서버에게 보낼 데이터정보(parameter정보)
							success :function(result){
								alert("수정 성공");
								selectSellingInfoByUserId();
								closePopup();
							} , //성공했을때 실행할 함수 
							error : function(err){  
								alert(err+"에러 발생했어요.");
							}  //실팽했을때 실행할 함수 
						});//ajax끝
					}
				}else {
					if(confirm("즉시판매를 하시겠습니까?")){
						$.ajax({
							url :"../ajax" , //서버요청주소
							type:"post", //요청방식(method방식 : get | post | put | delete )
							dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
							data: {key:"sellAjax" , methodName : "updateSellPrice", userId : "id", sellNo : $("[name='sellNo']").val(), sellPrice : $("#highestPrice").text()}, //서버에게 보낼 데이터정보(parameter정보)
							success :function(result){
								alert("즉시판매 되었습니다.");
								selectSellingInfoByUserId();
								closePopup();
							} , //성공했을때 실행할 함수 
							error : function(err){  
								alert(err+"에러 발생했어요.");
							}  //실팽했을때 실행할 함수 
						});//ajax끝
					}
				}
			
		});
		
		//판매취소(sell테이블에서 삭제한다.)
		$(document).on("click", "[name='sellCancel']", function() {
		
			 if(confirm("정말 판매를 취소하시겠습니까??")){
				$.ajax({
					url :"../ajax" , //서버요청주소
					type:"post", //요청방식(method방식 : get | post | put | delete )
					dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data: {key:"sellAjax" , methodName : "deleteSell", sellNo : $(this).attr("id")}, //서버에게 보낼 데이터정보(parameter정보)
					success :function(result){
						alert("판매가 취소됐습니다.");
						selectSellingInfoByUserId();
						selectSellWaitInfoByUserId();
					} , //성공했을때 실행할 함수 
					error : function(err){  
						alert(err+"에러 발생했어요.");
					}  //실팽했을때 실행할 함수 
				});//ajax끝
			} 
		}); 
		
		wishList();
		selectSellingInfoByUserId();
		selectSellWaitInfoByUserId();
		
		
		
	});//ready
	
	
	
	
	function closePopup() {
		const popup = document.querySelector('#popup');
	  	popup.classList.add('hide');
	}

	
</script>
</head>
<body>
<div id='wrap'>

	<div id='header'>
		<div id='header-top'>
			<div class="container">
			<div id='header-top-menu'>
				<a href="">마이페이지</a>
				<a href="">관심상품</a>
				<a href="">로그인</a>
			</div>
			</div><!-- container -->
		</div><!--header-top -->
		
		<div id='header-nav'>
			<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="#">Navbar</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarColor03">
			      <ul class="navbar-nav me-auto">
			        <li class="nav-item">
			          <a class="nav-link" href="#">Home
			          </a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="#">Shop</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="#">Style</a>
			        </li>
			      </ul>
			      <form class="d-flex">
			        <input class="form-control me-sm-2" type="text" placeholder="Search">
			        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			      </form>
			    </div>
			  </div>
			</nav>
			</div><!-- container -->
		</div><!-- header-nav -->		
	</div><!-- header -->
	<div class="clear"></div>
	
	<div id='contents'>
		<div class="container">
		<div class="tab">
		  <button class="tablinks" onclick="openCity(event, 'profile-info')" id="defaultOpen">프로필정보</button>
		  <button class="tablinks" onclick="openCity(event, 'profile-alarm')">알람</button>
		  <button class="tablinks" onclick="openCity(event, 'shopping-buy')">구매내역</button>
		  <button class="tablinks" onclick="openCity(event, 'shopping-sell')">판매내역</button>
		  <button class="tablinks" onclick="openCity(event, 'shopping-wishList')">관심상품</button>
		  
		</div>

		<div id="profile-info" class="tabcontent">
		  <h3>프로필정보</h3>
		  <div id='profile_info'>
					<div id='profile_group'>
						<h4 id='grop_title'>로그인정보</h4>
							<div class="form-group">
							  <fieldset disabled=""> 
							    <label class="form-label" for="disabledInput">아이디</label>
							    <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="">
							  </fieldset>
							</div>
						<div class="form-group">
						  <fieldset>
						    <label class="form-label mt-4" for="readOnlyInput">비밀번호</label>
						    <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." readonly="">
						  </fieldset>
						</div>
					</div>
					
					<div id='profile_group'>
					<form action="">
						<h4 id='grop_title'>개인정보</h4>
						<div class="form-group">
						  <fieldset>
						    <label class="form-label mt-4" for="readOnlyInput">이름</label>
						    <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." readonly="">
						  </fieldset>
						</div>
						<div class="form-group">
						  <fieldset>
						    <label class="form-label mt-4" for="readOnlyInput">전화번호</label>
						    <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." readonly="">
						  </fieldset>
						</div>
						<div class="form-group">
						  <fieldset>
						    <label class="form-label mt-4" for="readOnlyInput">주소</label>
						    <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." readonly="">
						  </fieldset>
						</div>
						<button>수정하기</button>
					</form>
					</div>
				</div>
		</div>
		
		<div id="profile-alarm" class="tabcontent">
		  <h3>알람</h3>
		  <p>Paris is the capital of France.</p> 
		</div>
		
		<div id="shopping-buy" class="tabcontent">
		  <h3>구매</h3>
		  <ul class="nav nav-tabs" role="tablist">
			  <li class="nav-item" role="presentation">
			    <a class="nav-link" data-bs-toggle="tab" href="#home" aria-selected="false" role="tab" tabindex="-1">구매내역</a>
			  </li>
			  <li class="nav-item" role="presentation">
			    <a class="nav-link active" data-bs-toggle="tab" href="#profile" aria-selected="true" role="tab">입찰중</a>
			  </li>
			 
	
			</ul>
			<div id="myTabContent" class="tab-content">
			  <div class="tab-pane fade" id="home" role="tabpanel">
			  <h3>구매내역</h3>
				<table>
				<tr>
					<th>상품명</th>
					<th>브랜드명</th>
					<th>진행상태</th>
					<th>거래가</th>
					<th>거래일자</th>
				</tr>
				</table>
			  </div>
			  <div class="tab-pane fade active show" id="profile" role="tabpanel">
			  	<h3>입찰중</h3>
			  	<table>
				<tr>
					<th>상품명</th>
					<th>브랜드명</th>
					<th>입찰가</th>
					<th>거래일자</th>
				</tr>
				</table>
			  </div>
   	      	</div>
		 </div>
		
		<div id="shopping-sell" class="tabcontent">
		  <h3>판매</h3>
		 <ul class="nav nav-tabs" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link" data-bs-toggle="tab" href="#home2" aria-selected="false" role="tab" tabindex="-1" >판매내역</a>
  </li>
  <li class="nav-item active" role="presentation">
    <a class="nav-link active show" data-bs-toggle="tab" href="#profile2" aria-selected="true" role="tab" id="sellingList">판매중</a>
 
  </li>
   <li class="nav-item" role="presentation">
    <a class="nav-link" data-bs-toggle="tab" href="#profile3" aria-selected="false" role="tab"id="sellWaitList">판매신청</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade" id="home2" role="tabpanel">
  	
 	<table>
 		<tr>
 			<th>No</th>
 			<th>상품이름</th>
 			<th>브랜드</th>
 			<th>판매가격</th>
 			<th>등록일</th>
 			<th>즉시판매가</th>
 		</tr>
 	</table>
	</div>
</div>
		 
<div id="myTabContent" class="tab-content">
  	<div class="tab-pane fade active show" id="profile2" role="tabpanel">
 	<table>
 		<tr>
 			<th>No</th>	
 			<th>상품이름</th>
 			<th>브랜드</th>
 			<th>판매가격</th>
 			<th>등록일</th>
 			<th>즉시판매가</th>
 		</tr>
 	</table>
	</div>
</div>

<div id="myTabContent" class="tab-content">
<div class="tab-pane fade" id="profile3" role="tabpanel">
 	<table>
 		<tr>
 			<th>No</th>
 			<th>상품이름</th>
 			<th>브랜드</th>
 			<th>판매가격</th>
 			<th>등록일</th>
 			<th>즉시판매가</th>
 		</tr>
 	</table>
	</div>
</div>
<!-- 팝업창 띄우기  -->
<div id="popup" class="hide">
  <div class="content">
    <p>

<form name="priceChange" method="post">
	
	<div>
		판매 번호: <input type="text" name="sellNo" size="30" readonly="readonly"><p>
		수정 가격: <input type="text" name="sellPrice" size="30"><p>
		
	</div>
	<input type="button" value="수정" id="priceChange">
</form>
    <button onclick="closePopup()">닫기</button>
  </div>
</div>

</div>
<!--  -->
		<div id="shopping-wishList" class="tabcontent">
		  <h3>관심상품</h3>
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
		</div>
			
		</div><!-- container -->
	</div><!-- contents -->
	
	
	<div id='footer'>
		<div class="container">
	
		</div>
	</div>
	
</div>
<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
	
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
</body>
</html>