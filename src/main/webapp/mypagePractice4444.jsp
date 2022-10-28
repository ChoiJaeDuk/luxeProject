<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 외부의 css파일 연결하기 -->
<!-- <link rel="stylesheet" type="text/css" href="css/mypage2.css"> -->
<style type="text/css">
	img {
	  width: 100x;
	  height: 100px;
	  object-fit: cover;
	}
	
	table {width:100% ; height:100% ;
    	 border-collapse: collapse ;}
    	 
    th, td{
    	text-align: center;
    }
    #popupBid {
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
	
	#popupBid.hide {
	  display: none;
	}
	
	#popupBid.has-filter {
	  backdrop-filter: blur(4px);
	  -webkit-backdrop-filter: blur(4px);
	}
	
	#popupBid .content {
	  padding: 20px;
	  background: #fff;
	  border-radius: 5px;
	  box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
	}
    #popupSell {
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
	
	#popupSell.hide {
	  display: none;
	}
	
	#popupSell.has-filter {
	  backdrop-filter: blur(4px);
	  -webkit-backdrop-filter: blur(4px);
	}
	
	#popupSell .content {
	  padding: 20px;
	  background: #fff;
	  border-radius: 5px;
	  box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
	}	
	
    
</style>

<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
	
		//구매내역 조회
		$("#buyList").on("click", function(){
			$.ajax({
				url :"ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"orderAjax" , methodName : "selectOrderByUserIdForBuy"}, //서버에게 보낼 데이터정보(parameter정보)
				success :function(result){
					let str="";
					$.each(result, function(index, item){
					    str+="<tr>";
					    str+=`<td>${"${(index+1)}"}</td>`;
					    str+=`<td><img alt="상품이미지" src=${pageContext.request.contextPath}${"${item.goodsMainImg}"}></td>`;
					    str+=`<td><a href='#'>${"${item.goodsName}"}</a></td>`;
					    str+=`<td>${"${item.brand}"}</td>`;
					    str+=`<td>${"${item.orderStatus}"}</td>`;
					    str+=`<td>${"${item.orderPrice.toLocaleString()}"}</td>`;
					    str+=`<td>${"${item.orderDate}"}</td>`;
					   
					    str+="</tr>";
				  });
					
					$("#buyTable tr:gt(0)").remove();
					$("#buyTable tr:eq(0)").after(str);
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
		})
		
		//판매내역 조회
		$("#sellList").on("click", function(){
			
			$.ajax({
				url :"ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"orderAjax" , methodName : "selectOrderByUserIdForSell" },	
				success :function(result){
					let str="";
					$.each(result, function(index, item){
					    str+="<tr>";
					    str+=`<td>${"${(index+1)}"}</td>`;
					    str+=`<td><img alt="상품이미지" src=${pageContext.request.contextPath}${"${item.goodsMainImg}"}></td>`;
					    str+=`<td><a href='#'>${"${item.goodsName}"}</a></td>`;
					    str+=`<td>${"${item.brand}"}</td>`;
					    str+=`<td>${"${item.orderStatus}"}</td>`;
					    str+=`<td>${"${item.orderPrice.toLocaleString()}"}</td>`;
					    str+=`<td>${"${item.orderDate}"}</td>`;
					    str+="</tr>";
					   
				  });
					
					$("#sellTable tr:gt(0)").remove();
					$("#sellTable tr:eq(0)").after(str);
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
		})
		
		//알람조회
		function alarmOpen(){
			$.ajax({
				url :"ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"alarmAjax" , methodName : "selectAlarm" },	
				success :function(result){
					let str="";
					$.each(result, function(index, item){
						
					    str+="<tr>";
					    str+=`<td>${"${(index+1)}"}</td>`;
					    str+=`<td><a href='#'>${"${item.goodsName}"}</a></td>`;
					    str+=`<td>${"${item.alarmSubject}"}</td>`;
					    str+=`<td>${"${item.alarmContent}"}</td>`;
					    str+=`<td>${"${item.issueDate}"}</td>`;
					    str+=`<td><input type="button" name="alarmDelete" value ="삭제" id=${"${item.alarmNo}"}></td>`;
					   
					    str+="</tr>";
				  });
					
					$("#alarmList tr:gt(0)").remove();
					$("#alarmList tr:eq(0)").after(str);
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
		}
		

		$("#alarmOpen").on("click", function(){
	
			alarmOpen();
			
		})
		
		//알람삭제
		$(document).on("click", "[name=alarmDelete]", function(){
			let result = confirm("알람을 삭제하시겠습니까?");
			if(result == true){
				 $.ajax({
					 
			   			url :"ajax" , //서버요청주소
			   			type:"post", //요청방식(method방식 : get | post | put | delete )
			   			dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
			   			data: {key:"alarmAjax" , methodName : "deleteAlarm", alarmNo : $(this).attr('id') }, //서버에게 보낼 데이터정보(parameter정보)
			   			success :function(result){
			   				if(result==0){
			   					alert("삭제되지 않았습니다.");
			   				}else{
			   					alert("삭제되었습니다.");
			   					alarmOpen();
			   				}
			   				
			   				
			   			} , //성공했을때 실행할 함수 
			   			error : function(err){  
			   				alert(err+"에러 발생했어요.");
			   			}  //실팽했을때 실행할 함수 
			   		});//ajax끝
			}
			
		})
		
		//입찰 중인 내역 조회
		function selectAllBid(){
			$.ajax({
				url : "ajax", //서버요청주소
				type : "post", //요청방식(method방식 : get | post | put | delete )
				dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data : {key : "bidAjax", methodName : "selectAllBidByUserId", bidStatus : "입찰중"}, //서버에게 보낼 데이터정보(parameter정보)
				success : function(result) {
					let str = "";
					$.each(result, function(index, bid) {
						str += "<tr>";
						str += "<td>" + (index + 1) + "</td>";
						str += `<td>${"${bid.goodsName}"}</td>`;
						str += `<td>${"${bid.brand}"}</td>`;
						str += `<td>${"${bid.bidPrice}"}</td>`;
						str += `<td>${"${bid.bidRegDate}"}</td>`;
						str += `<td><input type="button" value="입찰가수정" onclick="showPopup();" name=${"${bid.bidNo}"}></td>`;
						str += `<td><input type="button" value="입찰삭제" name=${"${bid.bidNo}"}></td>`;
						str += `<td><input type="hidden" name="goodsNo" value=${"${bid.goodsNo}"}></td>`;
						str += "</tr>";
					});
					
					$("#profile > table tr:gt(0)").remove();
					$("#profile > table tr:eq(0)").after(str);

				}, //성공했을때 실행할 함수 
				error : function(err) {
					alert(err + "에러 발생");
				} //실패했을때 실행할 함수 
			}) // ajax end
		};
		
		// 구매탭 선택시 기본으로 입찰중인 내역 출력
		$("#purchaseButton").on("click", function(){
			$("#profile").css("visibility", "visible");
			$("#onGoingBid").trigger("click");
		});

		
		/**입찰 중 내역 조회*/
		$("#onGoingBid").on("click", function() {
			selectAllBid();
		});
		
		
		//선택 내역 삭제
		$(document).on("click", "#profile input[value='입찰삭제']", function () {
			if(confirm("삭제하시겠습니까?")){
				let bidNo = $(this).attr("name");
				$.ajax({
					url : "ajax", //서버요청주소
					type : "post", //요청방식(method방식 : get | post | put | delete )
					dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data : {key : "bidAjax", methodName : "deleteBid", bidNo:bidNo}, //서버에게 보낼 데이터정보(parameter정보)
					success : function(result) {
						//$(this).parent().parent().find('td').eq(1).text()
						alert("삭제에 성공했습니다.");
						selectAllBid();
					}, //성공했을때 실행할 함수 
					error : function(err) {
						alert(err + "에러 발생");
					} //실패했을때 실행할 함수 
				});
			}
		});
		
		// 선택 입찰 내역 수정
		$(document).on("click", "#profile input[value='입찰가수정']", function () {
			
			let bidNo = $(this).attr("name");
			let goodsNo = $("input[name=goodsNo]").val();
			showPopup(false);
			$("input[name=bidNo]").val(bidNo);
			$("input[name=bidNo]").attr("readonly", "readonly");
			//popUp(bidNo, goodsNo);
				
		});

			$("form[name=writeForm] input[value=수정]").on("click", function() {
				let state = true;
				let bidNo = $("form[name=writeForm] input[name=bidNo]").val();
				let goodsNo = $("input[name=goodsNo]").val();
				let bidPrice = $("input[name=bidPrice]").val();
				console.log(typeof bidPrice);
				if(bidPrice=="")
					state=false;
					
				
				if(state){
					$.ajax({
						url : "ajax", //서버요청주소
						type : "post", //요청방식(method방식 : get | post | put | delete )
						dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data : {key : "bidAjax", methodName : "updateBidPrice", bidNo:bidNo, goodsNo: goodsNo, bidPrice:bidPrice}, //서버에게 보낼 데이터정보(parameter정보)
						success : function(result) {
							//$(this).parent().parent().find('td').eq(1).text()
							if(result!=0){
								alert("수정에 성공했습니다.");
								closePopup1();
								selectAllBid();
								$("input[name=bidPrice]").val("");
							} else 
								alert("수정에 실패했습니다.");
						}, //성공했을때 실행할 함수 
						error : function(err) {
							alert(err + "에러 발생");
						} //실패했을때 실행할 함수 
					});	
				} else {
					alert("변경 가격을 입력해주세요.");
					return false;
				}
				
			});
			
			selectAllBid();
			
			function selectSellingInfoByUserId(){ //판매중 상품 조회
				   $.ajax({
					url :"ajax" , //서버요청주소
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
						    str+=`<td><input type='button' value='판매가수정' name=${'${item.sellNo}'}></td>`;
						    str+=`<td><input type='button' value='판매삭제' name='sellCancel' id = ${'${item.sellNo}'}></td>`;
						    str+="</tr>";
					  });
					 	$("#sellingTable tr:gt(0)").remove();
						$("#sellingTable tr:eq(0)").after(str); 
						
					} , //성공했을때 실행할 함수 
					error : function(err){  
						alert(err+"에러 발생했어요.");
					}  //실팽했을때 실행할 함수 
				});//ajax끝
			   }// 함수끝
			
				
			
			function selectSellWaitInfoByUserId() {//판매대기중 상품조회
				$.ajax({
					url :"ajax" , //서버요청주소
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
						    str+=`<td><input type='button' value='삭제' name='sellCancel' id =${'${item.sellNo}'}></td>`;
						    str+="</tr>";
					  });
						$("#waitTable tr:gt(0)").remove();
						$("#waitTable tr:eq(0)").after(str);
						
					} , //성공했을때 실행할 함수 
					error : function(err){  
						alert(err+"에러 발생했어요.");
					}  //실팽했을때 실행할 함수 
				});//ajax끝
			};
			
			//관심목록 조회
			 function wishList() {
				$.ajax({
					url :"ajax" , //서버요청주소
					type:"post", //요청방식(method방식 : get | post | put | delete )
					dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data: {key:"wishListAjax" , methodName : "selectWishList"}, //서버에게 보낼 데이터정보(parameter정보)
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
						$("#wishTable tr:gt(0)").remove();
						$("#wishTable tr:eq(0)").after(str);
						
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
							url :"ajax" , //서버요청주소
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
			$(document).on("click","[value='판매가수정']", function(){
				let sellNo = $(this).attr("name");
				const popup = document.querySelector('#popupSell');
				$("[name='sellNo']").val(sellNo);
				popup.classList.remove('has-filter');
				popup.classList.remove('hide');
				$("[name=sellPrice]").val("");
			});
			
			//가격수정하기	
			
			$(document).on("click", "#priceChange", function() {
				//alert($("#highestPrice").text());
					//alert($("[name='sellPrice']").val() < $("#highestPrice").text())
					if($("[name='sellPrice']").val() > $("#highestPrice").text()){
						if(confirm("정말 수정하시겠습니까?")){
							$.ajax({
								url :"ajax" , //서버요청주소
								type:"post", //요청방식(method방식 : get | post | put | delete )
								dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
								data: {key:"sellAjax" , methodName : "updateSellPrice", userId : "id", sellNo : $("[name='sellNo']").val(), sellPrice : $("[name='sellPrice']").val()}, //서버에게 보낼 데이터정보(parameter정보)
								success :function(result){
									alert("수정 성공");
									selectSellingInfoByUserId();
									closePopup2();
								} , //성공했을때 실행할 함수 
								error : function(err){  
									alert(err+"에러 발생했어요.");
								}  //실팽했을때 실행할 함수 
							});//ajax끝
						}
					}else {
						if(confirm("즉시판매를 하시겠습니까?")){
							$.ajax({
								url :"ajax" , //서버요청주소
								type:"post", //요청방식(method방식 : get | post | put | delete )
								dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
								data: {key:"sellAjax" , methodName : "updateSellPrice", sellNo : $("[name='sellNo']").val(), sellPrice : $("#highestPrice").text()}, //서버에게 보낼 데이터정보(parameter정보)
								success :function(result){
									alert("즉시판매 되었습니다.");
									selectSellingInfoByUserId();
									closePopup2();
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
						url :"ajax" , //서버요청주소
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
			
		
	});// ready
	
	function showPopup(hasFilter) {
		const popup = document.querySelector("#popupBid");
		if (hasFilter) {
			popup.classList.add('has-filter');
		} else {
			popup.classList.remove('has-filter');
		}
			  
			popup.classList.remove('hide');
	}
	
	function closePopup1() {
		
		const popup = document.querySelector("#popupBid");
		popup.classList.add('hide');
	}	

	function closePopup2() {
		
		const popup = document.querySelector("#popupSell");
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
			          <a class="nav-link active" href="#">Home
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
		  <button class="tablinks" onclick="openCity(event, 'profile-alarm')" id="alarmOpen">알람</button>
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
		  <table id="alarmList">

		  	<tr>
		  		<th>번호</th>
		  		<th>상품명</th>
		  		<th>제목</th>
		  		<th>내용</th>
		  		<th>날짜</th>
		  		<th>삭제</th>
		  	</tr>
		  </table>
		</div>
		
		<div id="shopping-buy" class="tabcontent">
		  <h3>구매</h3>
		  <ul class="nav nav-tabs" role="tablist">
			  <li class="nav-item" role="presentation">
			    <a class="nav-link" data-bs-toggle="tab" href="#home" aria-selected="false" role="tab" tabindex="-1" id="buyList">구매내역</a>
			  </li>
			  <li class="nav-item" role="presentation">
			    <a class="nav-link active" data-bs-toggle="tab" href="#profile" aria-selected="true" role="tab" id="onGoingBid">입찰중</a>
			  </li>
		<%
			session.setAttribute("userId", "ID");
		
		%>	 
	
			</ul>
			<div id="myTabContent" class="tab-content">
			  <div class="tab-pane fade" id="home" role="tabpanel">
			
				<table id= "buyTable">
				<tr>
					<th>번호</th>
					<th>사진</th>
					<th>상품명</th>
					<th>브랜드명</th>
					<th>진행상태</th>
					<th>거래가</th>
					<th>거래일자</th>
				</tr>
				</table>
			  </div>
			  <div class="tab-pane fade active show" id="profile" role="tabpanel">
			 
			  	<table>
				<tr>
					<th>번호</th>
					<th>상품명</th>
					<th>브랜드명</th>
					<th>입찰가</th>
					<th>거래일자</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
					
				</table>
			  </div>
			 
   	      	</div>
		 </div>
		
		<div id="shopping-sell" class="tabcontent">
		  <h3>판매</h3>
		 <ul class="nav nav-tabs" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link" data-bs-toggle="tab" href="#home2" aria-selected="false" role="tab" tabindex="0" id="sellList">판매내역</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link active" data-bs-toggle="tab" href="#profile2" aria-selected="false" role="tab" id="sellingList">판매중</a>
  </li>
   <li class="nav-item" role="presentation">
    <a class="nav-link" data-bs-toggle="tab" href="#profile3" aria-selected="false" role="tab" id="sellWaitList">판매신청</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content">
  	<div class="tab-pane fade" id="home2" role="tabpanel">
 	<table id="sellTable">
 		<tr>
 			<th>번호</th>
			<th>사진</th>
			<th>상품명</th>
			<th>브랜드명</th>
			<th>진행상태</th>
			<th>거래가</th>
			<th>거래일자</th>
 		</tr>
 	</table>
	</div>
</div>
		 
<div id="myTabContent" class="tab-content">
  	<div class="tab-pane fade active show" id="profile2" role="tabpanel">
 	<table id="sellingTable">
 		<tr>
 			<th>번호</th>	
 			<th>상품명</th>
 			<th>브랜드명</th>
 			<th>판매가격가</th>
 			<th>등록일자</th>
 			<th>즉시판매가</th>
 			<th>수정</th>
			<th>삭제</th>
 		</tr>
 	</table>
	</div>
</div>

<div id="myTabContent" class="tab-content">
  	<div class="tab-pane fade" id="profile3" role="tabpanel">
 	<table id="waitTable">
 		<tr>
 			<th>번호</th>
 			<th>상품이름</th>
 			<th>브랜드</th>
 			<th>판매가격</th>
 			<th>등록일</th>
 			<th>즉시판매가</th>
 			<th>삭제</th>
 		</tr>
 	</table>
	</div>
</div>
</div>	 
		<div id="shopping-wishList" class="tabcontent">
		  <h3>관심상품</h3>
		  <section id='product'>
				<div class="productBEST_container">
					<table id="wishTable">
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

<div id="popupBid" class="hide">
  <div class="content">
    <p>
    <form name="writeForm" method="post">
			입찰 번호<input type="text" name="bidNo" size="30" readonly="readonly"><p>
			수정 가격<input type="text" name="bidPrice" size="30" maxlength="9"><p>
			<input type="button" value="수정">
	</form>
	<button onclick="closePopup1()">닫기</button>
  </div>
</div>

<div id="popupSell" class="hide">
  <div class="content">
    <p>
<form name="priceChange" method="post">
	<div>
		판매 번호: <input type="text" name="sellNo" size="30" readonly="readonly"><p>
		수정 가격: <input type="text" name="sellPrice" size="30"><p>		
	</div>
	<input type="button" value="수정" id="priceChange">
</form>
    <button onclick="closePopup2()">닫기</button>
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