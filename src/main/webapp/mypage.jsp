<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 외부의 css파일 연결하기 -->

<link rel="stylesheet" type="text/css" href="layout/css/Reset.css">
<link rel="stylesheet" type="text/css" href="layout/css/Layout.css">
 <link rel="stylesheet" type="text/css" href="css/mypage.css"> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">
img {
	width: 100x;
	height: 100px;
	object-fit: cover;
}

table {
	width: 100%;
	height: 100%;
	border-collapse: collapse;
}

th, td {
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

#popupCheck {
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

#popupCheck.hide {
	display: none;
}

#popupCheck.has-filter {
	backdrop-filter: blur(4px);
	-webkit-backdrop-filter: blur(4px);
}

#popupCheck .content {
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, .3);
}

.alarm-counter {

 right: 1px;
 min-width: 8px;
 height: 20px;
 line-height: 20px;
 margin-top: -11px;
 padding: 0 6px;
 font-weight: normal;
 font-size: small;
 color: white;
 text-align: center;
 text-shadow: 0 1px rgba(0, 0, 0, 0.2);
 background: red;
 border-radius: 11px;
 background-image: -webkit-linear-gradient(top, #e8616c, #dd202f);
 background-image: -moz-linear-gradient(top, #e8616c, #dd202f);
 background-image: -o-linear-gradient(top, #e8616c, #dd202f);
 background-image: linear-gradient(to bottom, #e8616c, #dd202f);
 -webkit-box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
 box-shadow: inset 0 0 1px 1px rgba(255, 255, 255, 0.1), 0 1px rgba(0, 0, 0, 0.12);
}
</style>

<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	//모든 공백 체크 정규식
	let empJ = /\s/g;
	// 비밀번호 정규식
	let pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이메일 검사 정규식
	let mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	let phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	//우편번호 찾기 버튼 클릭시 발생 이벤트
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				let fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				let extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);
				/*      let a = console.log(data.zonecode);
				   let b = console.log(fullRoadAddr);
				   
				   if(a == null || b = null){
				      alert("주소를 확인하세요.");
				      return false;
				   }   */

				$("[name=mem_oaddress]").val(data.zonecode);
				$("[name=userAddr]").val(fullRoadAddr);

				document.getElementById('mem_oaddress').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('userAddr').value = fullRoadAddr;

				//document.getElementById('userAddr').value = data.jibunAddress; 
			}
		}).open();
	}
	$(function() {

		//구매내역 조회
		$("#buyList")
				.on(
						"click",
						function() {
							$
									.ajax({
										url : "ajax", //서버요청주소
										type : "post", //요청방식(method방식 : get | post | put | delete )
										dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
										data : {
											key : "orderAjax",
											methodName : "selectOrderByUserIdForBuy"
										}, //서버에게 보낼 데이터정보(parameter정보)
										success : function(result) {
											let str = "";
											$
													.each(
															result,
															function(index,
																	item) {
																str += "<tr>";
																str += `<td>${"${(index+1)}"}</td>`;
																str += `<td><img alt="상품이미지" src=${pageContext.request.contextPath}${"${item.goodsMainImg}"}></td>`;
																str += `<td><a href='#'>${"${item.goodsName}"}</a></td>`;
																str += `<td>${"${item.brand}"}</td>`;
																str += `<td>${"${item.orderStatus}"}</td>`;
																str += `<td>${"${item.orderPrice.toLocaleString()}"}</td>`;
																str += `<td>${"${item.orderDate}"}</td>`;

																str += "</tr>";
															});

											$("#buyTable tr:gt(0)").remove();
											$("#buyTable tr:eq(0)").after(str);

										}, //성공했을때 실행할 함수 
										error : function(err) {
											alert(err + "에러 발생했어요.");
										} //실팽했을때 실행할 함수 
									});//ajax끝
						})

		//판매내역 조회
		$("#sellList")
				.on(
						"click",
						function() {

							$
									.ajax({
										url : "ajax", //서버요청주소
										type : "post", //요청방식(method방식 : get | post | put | delete )
										dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
										data : {
											key : "orderAjax",
											methodName : "selectOrderByUserIdForSell"
										},
										success : function(result) {
											let str = "";
											$
													.each(
															result,
															function(index,
																	item) {
																str += "<tr>";
																str += `<td>${"${(index+1)}"}</td>`;
																str += `<td><img alt="상품이미지" src=${pageContext.request.contextPath}${"${item.goodsMainImg}"}></td>`;
																str += `<td><a href='#'>${"${item.goodsName}"}</a></td>`;
																str += `<td>${"${item.brand}"}</td>`;
																str += `<td>${"${item.orderStatus}"}</td>`;
																str += `<td>${"${item.orderPrice.toLocaleString()}"}</td>`;
																str += `<td>${"${item.orderDate}"}</td>`;
																str += "</tr>";

															});

											$("#sellTable tr:gt(0)").remove();
											$("#sellTable tr:eq(0)").after(str);

										}, //성공했을때 실행할 함수 
										error : function(err) {
											alert(err + "에러 발생했어요.");
										} //실팽했을때 실행할 함수 
									});//ajax끝
						})

		//알람조회
		function alarmOpen() {
			$
					.ajax({
						url : "ajax", //서버요청주소
						type : "post", //요청방식(method방식 : get | post | put | delete )
						dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data : {
							key : "alarmAjax",
							methodName : "selectAlarm"
						},
						success : function(result) {
							let str = "";
							$
									.each(
											result,
											function(index, item) {

												str += "<tr>";
												str += `<td>${"${(index+1)}"}</td>`;
												str += `<td><a href='#'>${"${item.goodsName}"}</a></td>`;
												str += `<td>${"${item.alarmSubject}"}</td>`;
												str += `<td>${"${item.alarmContent}"}</td>`;
												str += `<td>${"${item.issueDate}"}</td>`;
												str += `<td><input type="button" name="alarmDelete" value ="삭제" id=${"${item.alarmNo}"}></td>`;

												str += "</tr>";
											});

							$("#alarmList tr:gt(0)").remove();
							$("#alarmList tr:eq(0)").after(str);
							newAlarm()

						}, //성공했을때 실행할 함수 
						error : function(err) {
							alert(err + "에러 발생했어요.");
						} //실팽했을때 실행할 함수 
					});//ajax끝
		}

		$("#alarmOpen").on("click", function() {

			alarmOpen();

		})

		//알람삭제
		$(document).on("click", "[name=alarmDelete]", function() {
			let result = confirm("알람을 삭제하시겠습니까?");
			if (result == true) {
				$.ajax({

					url : "ajax", //서버요청주소
					type : "post", //요청방식(method방식 : get | post | put | delete )
					dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data : {
						key : "alarmAjax",
						methodName : "deleteAlarm",
						alarmNo : $(this).attr('id')
					}, //서버에게 보낼 데이터정보(parameter정보)
					success : function(result) {
						if (result == 0) {
							alert("삭제되지 않았습니다.");
						} else {
							alert("삭제되었습니다.");
							alarmOpen();
						}

					}, //성공했을때 실행할 함수 
					error : function(err) {
						alert(err + "에러 발생했어요.");
					} //실팽했을때 실행할 함수 
				});//ajax끝
			}

		})

		//입찰 중인 내역 조회
		function selectAllBid() {
			$
					.ajax({
						url : "ajax", //서버요청주소
						type : "post", //요청방식(method방식 : get | post | put | delete )
						dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data : {
							key : "bidAjax",
							methodName : "selectAllBidByUserId",
							bidStatus : "입찰중"
						}, //서버에게 보낼 데이터정보(parameter정보)
						success : function(result) {
							let str = "";
							$
									.each(
											result,
											function(index, bid) {
												str += "<tr>";
												str += "<td>" + (index + 1)
														+ "</td>";
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
		}
		;

		// 구매탭 선택시 기본으로 입찰중인 내역 출력
		$("#purchaseButton").on("click", function() {
			$("#profile").css("visibility", "visible");
			$("#onGoingBid").trigger("click");
		});

		/**입찰 중 내역 조회*/
		$("#onGoingBid").on("click", function() {
			selectAllBid();
		});

		//선택 내역 삭제
		$(document).on("click", "#profile input[value='입찰삭제']", function() {
			if (confirm("삭제하시겠습니까?")) {
				let bidNo = $(this).attr("name");
				$.ajax({
					url : "ajax", //서버요청주소
					type : "post", //요청방식(method방식 : get | post | put | delete )
					dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data : {
						key : "bidAjax",
						methodName : "deleteBid",
						bidNo : bidNo
					}, //서버에게 보낼 데이터정보(parameter정보)
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
		$(document).on("click", "#profile input[value='입찰가수정']", function() {

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
			if (bidPrice == "")
				state = false;

			if (state) {
				$.ajax({
					url : "ajax", //서버요청주소
					type : "post", //요청방식(method방식 : get | post | put | delete )
					dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data : {
						key : "bidAjax",
						methodName : "updateBidPrice",
						bidNo : bidNo,
						goodsNo : goodsNo,
						bidPrice : bidPrice
					}, //서버에게 보낼 데이터정보(parameter정보)
					success : function(result) {
						//$(this).parent().parent().find('td').eq(1).text()
						if (result != 0) {
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

		function selectSellingInfoByUserId() { //판매중 상품 조회
			$
					.ajax({
						url : "ajax", //서버요청주소
						type : "post", //요청방식(method방식 : get | post | put | delete )
						dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data : {
							key : "sellAjax",
							methodName : "selectSellingInfoByUserId",
							id : "id"
						}, //서버에게 보낼 데이터정보(parameter정보)
						success : function(result) {
							let str = "";
							$
									.each(
											result,
											function(index, item) {
												str += "<tr>";
												str += "<td>" + (index + 1)
														+ "</td>";
												str += `<td>${"${item.goodsDTO.goodsName}"}</td>`;
												str += `<td>${"${item.goodsDTO.brand}"}</td>`;
												str += `<td>${"${item.sellPrice}"}</td>`;
												str += `<td>${"${item.sellDate}"}</td>`;
												str += `<td id='highestPrice'>${"${item.goodsDTO.highestPrice}"}`
												str += `<td><input type='button' value='판매가수정' name=${'${item.sellNo}'}></td>`;
												str += `<td><input type='button' value='판매삭제' name='sellCancel' id = ${'${item.sellNo}'}></td>`;
												str += "</tr>";
											});
							$("#sellingTable tr:gt(0)").remove();
							$("#sellingTable tr:eq(0)").after(str);

						}, //성공했을때 실행할 함수 
						error : function(err) {
							alert(err + "에러 발생했어요.");
						} //실팽했을때 실행할 함수 
					});//ajax끝
		}// 함수끝

		function selectSellWaitInfoByUserId() {//판매대기중 상품조회
			$
					.ajax({
						url : "ajax", //서버요청주소
						type : "post", //요청방식(method방식 : get | post | put | delete )
						dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data : {
							key : "sellAjax",
							methodName : "selectSellWaitInfoByUserId",
							id : "id"
						}, //서버에게 보낼 데이터정보(parameter정보)
						success : function(result) {
							let str = "";
							$
									.each(
											result,
											function(index, item) {
												str += "<tr>";
												str += "<td>" + (index + 1)
														+ "</td>";
												str += `<td>${"${item.goodsDTO.goodsName}"}</td>`;
												str += `<td>${"${item.goodsDTO.brand}"}</td>`;
												str += `<td>${"${item.sellPrice}"}</td>`;
												str += `<td>${"${item.sellDate}"}</td>`;
												str += `<td id='highestPrice'>${"${item.goodsDTO.highestPrice}"}`
												str += `<td><input type='button' value='삭제' name='sellCancel' id =${'${item.sellNo}'}></td>`;
												str += "</tr>";
											});
							$("#waitTable tr:gt(0)").remove();
							$("#waitTable tr:eq(0)").after(str);

						}, //성공했을때 실행할 함수 
						error : function(err) {
							alert(err + "에러 발생했어요.");
						} //실팽했을때 실행할 함수 
					});//ajax끝
		}
		;

		//관심목록 조회
		function wishList() {
			$
					.ajax({
						url : "ajax", //서버요청주소
						type : "post", //요청방식(method방식 : get | post | put | delete )
						dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data : {
							key : "wishListAjax",
							methodName : "selectWishList"
						}, //서버에게 보낼 데이터정보(parameter정보)
						success : function(result) {
							let str = ""; //str+=`<td>${"${item.goodsDTO.goodsName}"}</td>`;
							let strcont = "";
							$
									.each(
											result,
											function(index, item) { $(this).html('인증번호 받기');
											 
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
							

						}, //성공했을때 실행할 함수 
						error : function(err) {
							alert(err + "에러 발생했어요.");
						} //실팽했을때 실행할 함수
					})
		}

		//관심목록 삭제
		$(document).on("click", "[name=deleteWishList]", function() {
			if (confirm("관심목록에서 삭제하시겠습니까?")) {
				$.ajax({
					url : "ajax", //서버요청주소
					type : "post", //요청방식(method방식 : get | post | put | delete )
					dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data : {
						key : "wishListAjax",
						methodName : "deleteWishList",
						goodsNo : $(this).attr("id")
					}, //서버에게 보낼 데이터정보(parameter정보)
					success : function(result) {
						alert("관심목록에서 삭제되었습니다.");

						wishList();
					}, //성공했을때 실행할 함수 
					error : function(err) {
						alert(err + "에러 발생했어요.");
					} //실팽했을때 실행할 함수 
				});//ajax끝
			}
		})

		//가격수정 팝업창
		$(document).on("click", "[value='판매가수정']", function() {
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
			if ($("[name='sellPrice']").val() > $("#highestPrice").text()) {
				if (confirm("정말 수정하시겠습니까?")) {
					$.ajax({
						url : "ajax", //서버요청주소
						type : "post", //요청방식(method방식 : get | post | put | delete )
						dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data : {
							key : "sellAjax",
							methodName : "updateSellPrice",
							userId : "id",
							sellNo : $("[name='sellNo']").val(),
							sellPrice : $("[name='sellPrice']").val()
						}, //서버에게 보낼 데이터정보(parameter정보)
						success : function(result) {
							alert("수정 성공");
							selectSellingInfoByUserId();
							closePopup2();
						}, //성공했을때 실행할 함수 
						error : function(err) {
							alert(err + "에러 발생했어요.");
						} //실팽했을때 실행할 함수 
					});//ajax끝
				}
			} else {
				if (confirm("즉시판매를 하시겠습니까?")) {
					$.ajax({
						url : "ajax", //서버요청주소
						type : "post", //요청방식(method방식 : get | post | put | delete )
						dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
						data : {
							key : "sellAjax",
							methodName : "updateSellPrice",
							sellNo : $("[name='sellNo']").val(),
							sellPrice : $("#highestPrice").text()
						}, //서버에게 보낼 데이터정보(parameter정보)
						success : function(result) {
							alert("즉시판매 되었습니다.");
							selectSellingInfoByUserId();
							closePopup2();
						}, //성공했을때 실행할 함수 
						error : function(err) {
							alert(err + "에러 발생했어요.");
						} //실팽했을때 실행할 함수 
					});//ajax끝
				}
			}

		});

		//판매취소(sell테이블에서 삭제한다.)
		$(document).on("click", "[name='sellCancel']", function() {

			if (confirm("정말 판매를 취소하시겠습니까??")) {
				$.ajax({
					url : "ajax", //서버요청주소
					type : "post", //요청방식(method방식 : get | post | put | delete )
					dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data : {
						key : "sellAjax",
						methodName : "deleteSell",
						sellNo : $(this).attr("id")
					}, //서버에게 보낼 데이터정보(parameter정보)
					success : function(result) {
						alert("판매가 취소됐습니다.");
						selectSellingInfoByUserId();
						selectSellWaitInfoByUserId();
					}, //성공했을때 실행할 함수 
					error : function(err) {
						alert(err + "에러 발생했어요.");
					} //실팽했을때 실행할 함수 
				});//ajax끝
			}
		});

		wishList();
		selectSellingInfoByUserId();
		selectSellWaitInfoByUserId();
		function selectUser() {
			$.ajax({
				url : "ajax", //서버요청주소
				type : "post", //요청방식(method방식 : get | post | put | delete )
				dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data : {
					key : "userAjax",
					methodName : "selectUser",
				},
				success : function(result) {

					let id = result.userId;
					let pwd = result.userPwd;
					let name = result.userName;
					let phone = result.userPhone;
					let addr = result.userAddr;
					let email = result.userEmail;

					$("#userId").val(id);
					$("#userPwd").val(pwd);
					$("#userName").val(name);
					$("#userPhone").val(phone);
					$("#userAddr").val(addr);
					$("#userEmail").val(email);

				}, //성공했을때 실행할 함수 
				error : function(err) {
					alert(err + "에러 발생");
				} //실패했을때 실행할 함수 
			})// 아작스 
		}// 유저  끝

		$("#userUpdate").click(function() {

			if ($(this).val() == "수정하기") {

				$("#userPwd").removeAttr("readonly");
				$("#userPwd").focus();
				$("#userPhone").removeAttr("readonly");
				$("#userAddr").removeAttr("readonly");
				$("#userEmail").removeAttr("readonly");

				$("#userUpdate").val("수정완료")

			}

			else if ($(this).val() == "수정완료") {

				var form = $("#userDto").serialize();
				alert(form);
				$.ajax({
					url : "ajax", //서버요청주소
					type : "post", //요청방식(method방식 : get | post | put | delete )
					dataType : "text", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
					data : form,
					success : function(result) {
						if (result == 1) {
							alert("수정이 완료 되었습니다.")
							selectUser();
							$("#userUpdate").val("수정하기");

						} else {
							alert("내용을 다시 확인해주세요.")
						}

					}, //성공했을때 실행할 함수 
					error : function(err) {
						alert(err + "에러 발생");
					} //실패했을때 실행할 함수 
				})// 아작스 
			}

		});

		$("#pwdCheck").on("click", function() {

			$.ajax({
				url : "ajax", //서버요청주소
				type : "post", //요청방식(method방식 : get | post | put | delete )
				dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data : {
					key : "userAjax",
					methodName : "selectUser"
				},
				success : function(result) {
					console.log(result);
					let pwd = $("[name=inputPwd]").val();

					if (result.userPwd == pwd) {
						closePopup3();
					} else {
						alert("비밀번호를 다시 입력해주세요.");
						$("[name=inputPwd]").val("");

					}

				}, //성공했을때 실행할 함수 
				error : function(err) {
					alert(err + "에러 발생했어요.");
				} //실팽했을때 실행할 함수 
			});//ajax끝
		})

		selectUser();
		
		function newAlarm(){
			$.ajax({
				url : "ajax", //서버요청주소
				type : "post", //요청방식(method방식 : get | post | put | delete )
				dataType : "json", //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data : {
					key : "alarmAjax",
					methodName : "countNewAlarm"
				},
				success : function(result) {
					console.log(result);
					

					if(result>0){
						$(".alarm-counter").text("new");	
					}else{
						
						$(".alarm-counter").text("0");
						$(".alarm-counter").hide();
					}

				}, //성공했을때 실행할 함수 
				error : function(err) {
					alert(err + "에러 발생했어요.");
				} //실팽했을때 실행할 함수 
			});//ajax끝
			
			
			
			
			
		}
		
		newAlarm();

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

	function closePopup3() {
		const popup = document.querySelector('#popupCheck');
		popup.classList.add('hide');
	}
</script>
</head>
<body>
	<div id='wrap'>

		<jsp:include page="layout/header.jsp" />
		<!-- header -->
		<div class="clear"></div>

		<div id='contents'>
			<div class="container">
				<div class="tab">
					<button class="tablinks" onclick="openCity(event, 'profile-info')"
						id="defaultOpen">프로필정보</button>
					<button class="tablinks" onclick="openCity(event, 'profile-alarm')"
						id="alarmOpen">알람 <i class="bi bi-hearts" style="color: red;"></i><span class="alarm-counter"></span></button><!--지현알람영역 [bi-hearts :아이콘만] --><!--지현알람영역 [alarm-counter:숫자] -->
					<button class="tablinks" onclick="openCity(event, 'shopping-buy')">구매내역</button>
					<button class="tablinks" onclick="openCity(event, 'shopping-sell')">판매내역</button>
					<button class="tablinks"
						onclick="openCity(event, 'shopping-wishList')">관심상품</button>

				</div>

				<div id="profile-info" class="tabcontent">
					<form name="userDto" method="post" id="userDto">
						<input type="hidden" name="key" value="userAjax"> <input
							type="hidden" name="methodName" value="updateUserInfo">
						<h3>프로필정보</h3>
						<div id='profile_info'>
							<div id='profile_group'>
								<h4 id='grop_title'>로그인정보</h4>
								<div class="form-group">
									<fieldset disabled="">
										<label class="form-label" for="disabledInput">아이디</label> <input
											class="form-control" id="userId" type="text"
											placeholder="Disabled input here..." disabled=""
											readonly="readonly">
									</fieldset>
								</div>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">이름</label>
										<input class="form-control" id="userName" type="text"
											placeholder="Readonly input here..." readonly="readonly" />
									</fieldset>
								</div>
							</div>

							<div id='profile_group'>


								<h4 id='grop_title'>개인정보</h4>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">비밀번호</label>
										<input class="form-control" style="top: 5px;"
											placeholder="Readonly input here..." name="userPwd"
											id="userPwd" type="text" readonly="readonly" />
									</fieldset>
								</div>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">전화번호</label>

										<input class="form-control" style="top: 5px;"
											placeholder="Readonly input here..." name="userPhone"
											id="userPhone" type="text" readonly="readonly" />
									</fieldset>
									<!-- 									<div class="form-group"> -->
									<!-- 										<fieldset> -->
									<!-- 											<label class="form-label mt-4" for="readOnlyInput">주소</label> -->
									<!-- 												<input class="form-control" style="top: 5px;" -->
									<!-- 												placeholder="Readonly input here..." name="userAddr" id="userAddr" -->
									<!-- 												type="text" readonly="readonly" /> -->
									<!-- 										</fieldset> -->
									<!-- 									</div> -->
									<fieldset>
										<div class="form-group">
											<label class="form-label mt-4" for="readOnlyInput">주소</label>
											<p>
												<input class="form-control"
													style="width: 40%; display: inline;" placeholder="우편번호" na
													me="mem_oaddress" id="mem_oaddress" type="text"
													readonly="readonly">
												<button type="button" class="btn btn-default"
													onclick="execPostCode();">
													<i class="fa fa-search"></i> 우편번호 찾기
												</button>
										</div>
									</fieldset>
									<fieldset>
										<div class="form-group">
											<input class="form-control" style="top: 5px;"
												placeholder="도로명 주소" name="userAddr" id="userAddr"
												type="text" readonly="readonly" />
										</div>
									</fieldset>
								</div>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">이메일</label>
										<input class="form-control" style="top: 5px;"
											placeholder="Readonly input here..." name="userEmail"
											id="userEmail" type="text" readonly="readonly" />
									</fieldset>
								</div>



								<input type="button" value="수정하기" id="userUpdate">

							</div>
						</div>
					</form>
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
						<li class="nav-item" role="presentation"><a class="nav-link"
							data-bs-toggle="tab" href="#home" aria-selected="false"
							role="tab" tabindex="-1" id="buyList">구매내역</a></li>
						<li class="nav-item" role="presentation"><a
							class="nav-link active" data-bs-toggle="tab" href="#profile"
							aria-selected="true" role="tab" id="onGoingBid">입찰중</a></li>
					

					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="home" role="tabpanel">

							<table id="buyTable">
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
						<div class="tab-pane fade active show" id="profile"
							role="tabpanel">

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
						<li class="nav-item" role="presentation"><a class="nav-link"
							data-bs-toggle="tab" href="#home2" aria-selected="false"
							role="tab" tabindex="0" id="sellList">판매내역</a></li>
						<li class="nav-item" role="presentation"><a
							class="nav-link active" data-bs-toggle="tab" href="#profile2"
							aria-selected="false" role="tab" id="sellingList">판매중</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link"
							data-bs-toggle="tab" href="#profile3" aria-selected="false"
							role="tab" id="sellWaitList">판매신청</a></li>
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
						<div class="tab-pane fade active show" id="profile2"
							role="tabpanel">
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

			</div>
			<!-- container -->
		</div>
		<!-- contents -->


		<jsp:include page="layout/footer.jsp" />

	</div>

	<div id="popupCheck" class="has-filter">
		<div class="content">
			<p>
			<form name="pwdCheck" method="post" style="text-align: center">
				<div style="text-align: center">
					비밀번호: <input type="password" name="inputPwd" size="30">
					<p>

						<input type="button" value="확인" id="pwdCheck"
							style="text-align: center"> <input type="button"
							value="닫기" onclick="history.back();">
					<p>
				</div>

			</form>

		</div>
	</div>

	<div id="popupBid" class="hide">
		<div class="content">
			<p>
			<form name="writeForm" method="post">
				입찰 번호<input type="text" name="bidNo" size="30" readonly="readonly">
				<p>
					수정 가격<input type="text" name="bidPrice" size="30" maxlength="9">
				<p>
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
					판매 번호: <input type="text" name="sellNo" size="30"
						readonly="readonly">
					<p>
						수정 가격: <input type="text" name="sellPrice" size="30">
					<p>
				</div>
				<input type="button" value="수정" id="priceChange">
			</form>
			<button onclick="closePopup2()">닫기</button>
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
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>
</body>
</html>