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

<!--������-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- �ܺ��� css���� �����ϱ� -->

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
	//��� ���� üũ ���Խ�
	let empJ = /\s/g;
	// ��й�ȣ ���Խ�
	let pwJ = /^[A-Za-z0-9]{4,12}$/;
	// �̸��� �˻� ���Խ�
	let mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// �޴��� ��ȣ ���Խ�
	let phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	//�����ȣ ã�� ��ư Ŭ���� �߻� �̺�Ʈ
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

				// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
				// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
				let fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
				let extraRoadAddr = ''; // ���θ� ������ �ּ� ����

				// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
				// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
				if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
				console.log(data.zonecode);
				console.log(fullRoadAddr);
				/*      let a = console.log(data.zonecode);
				   let b = console.log(fullRoadAddr);
				   
				   if(a == null || b = null){
				      alert("�ּҸ� Ȯ���ϼ���.");
				      return false;
				   }   */

				$("[name=mem_oaddress]").val(data.zonecode);
				$("[name=userAddr]").val(fullRoadAddr);

				document.getElementById('mem_oaddress').value = data.zonecode; //5�ڸ� �������ȣ ���
				document.getElementById('userAddr').value = fullRoadAddr;

				//document.getElementById('userAddr').value = data.jibunAddress; 
			}
		}).open();
	}
	$(function() {

		//���ų��� ��ȸ
		$("#buyList")
				.on(
						"click",
						function() {
							$
									.ajax({
										url : "ajax", //������û�ּ�
										type : "post", //��û���(method��� : get | post | put | delete )
										dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
										data : {
											key : "orderAjax",
											methodName : "selectOrderByUserIdForBuy"
										}, //�������� ���� ����������(parameter����)
										success : function(result) {
											let str = "";
											$
													.each(
															result,
															function(index,
																	item) {
																str += "<tr>";
																str += `<td>${"${(index+1)}"}</td>`;
																str += `<td><img alt="��ǰ�̹���" src=${pageContext.request.contextPath}${"${item.goodsMainImg}"}></td>`;
																str += `<td><a href='#'>${"${item.goodsName}"}</a></td>`;
																str += `<td>${"${item.brand}"}</td>`;
																str += `<td>${"${item.orderStatus}"}</td>`;
																str += `<td>${"${item.orderPrice.toLocaleString()}"}</td>`;
																str += `<td>${"${item.orderDate}"}</td>`;

																str += "</tr>";
															});

											$("#buyTable tr:gt(0)").remove();
											$("#buyTable tr:eq(0)").after(str);

										}, //���������� ������ �Լ� 
										error : function(err) {
											alert(err + "���� �߻��߾��.");
										} //���������� ������ �Լ� 
									});//ajax��
						})

		//�Ǹų��� ��ȸ
		$("#sellList")
				.on(
						"click",
						function() {

							$
									.ajax({
										url : "ajax", //������û�ּ�
										type : "post", //��û���(method��� : get | post | put | delete )
										dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
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
																str += `<td><img alt="��ǰ�̹���" src=${pageContext.request.contextPath}${"${item.goodsMainImg}"}></td>`;
																str += `<td><a href='#'>${"${item.goodsName}"}</a></td>`;
																str += `<td>${"${item.brand}"}</td>`;
																str += `<td>${"${item.orderStatus}"}</td>`;
																str += `<td>${"${item.orderPrice.toLocaleString()}"}</td>`;
																str += `<td>${"${item.orderDate}"}</td>`;
																str += "</tr>";

															});

											$("#sellTable tr:gt(0)").remove();
											$("#sellTable tr:eq(0)").after(str);

										}, //���������� ������ �Լ� 
										error : function(err) {
											alert(err + "���� �߻��߾��.");
										} //���������� ������ �Լ� 
									});//ajax��
						})

		//�˶���ȸ
		function alarmOpen() {
			$
					.ajax({
						url : "ajax", //������û�ּ�
						type : "post", //��û���(method��� : get | post | put | delete )
						dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
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
												str += `<td><input type="button" name="alarmDelete" value ="����" id=${"${item.alarmNo}"}></td>`;

												str += "</tr>";
											});

							$("#alarmList tr:gt(0)").remove();
							$("#alarmList tr:eq(0)").after(str);
							newAlarm()

						}, //���������� ������ �Լ� 
						error : function(err) {
							alert(err + "���� �߻��߾��.");
						} //���������� ������ �Լ� 
					});//ajax��
		}

		$("#alarmOpen").on("click", function() {

			alarmOpen();

		})

		//�˶�����
		$(document).on("click", "[name=alarmDelete]", function() {
			let result = confirm("�˶��� �����Ͻðڽ��ϱ�?");
			if (result == true) {
				$.ajax({

					url : "ajax", //������û�ּ�
					type : "post", //��û���(method��� : get | post | put | delete )
					dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data : {
						key : "alarmAjax",
						methodName : "deleteAlarm",
						alarmNo : $(this).attr('id')
					}, //�������� ���� ����������(parameter����)
					success : function(result) {
						if (result == 0) {
							alert("�������� �ʾҽ��ϴ�.");
						} else {
							alert("�����Ǿ����ϴ�.");
							alarmOpen();
						}

					}, //���������� ������ �Լ� 
					error : function(err) {
						alert(err + "���� �߻��߾��.");
					} //���������� ������ �Լ� 
				});//ajax��
			}

		})

		//���� ���� ���� ��ȸ
		function selectAllBid() {
			$
					.ajax({
						url : "ajax", //������û�ּ�
						type : "post", //��û���(method��� : get | post | put | delete )
						dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
						data : {
							key : "bidAjax",
							methodName : "selectAllBidByUserId",
							bidStatus : "������"
						}, //�������� ���� ����������(parameter����)
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
												str += `<td><input type="button" value="����������" onclick="showPopup();" name=${"${bid.bidNo}"}></td>`;
												str += `<td><input type="button" value="��������" name=${"${bid.bidNo}"}></td>`;
												str += `<td><input type="hidden" name="goodsNo" value=${"${bid.goodsNo}"}></td>`;
												str += "</tr>";
											});

							$("#profile > table tr:gt(0)").remove();
							$("#profile > table tr:eq(0)").after(str);

						}, //���������� ������ �Լ� 
						error : function(err) {
							alert(err + "���� �߻�");
						} //���������� ������ �Լ� 
					}) // ajax end
		}
		;

		// ������ ���ý� �⺻���� �������� ���� ���
		$("#purchaseButton").on("click", function() {
			$("#profile").css("visibility", "visible");
			$("#onGoingBid").trigger("click");
		});

		/**���� �� ���� ��ȸ*/
		$("#onGoingBid").on("click", function() {
			selectAllBid();
		});

		//���� ���� ����
		$(document).on("click", "#profile input[value='��������']", function() {
			if (confirm("�����Ͻðڽ��ϱ�?")) {
				let bidNo = $(this).attr("name");
				$.ajax({
					url : "ajax", //������û�ּ�
					type : "post", //��û���(method��� : get | post | put | delete )
					dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data : {
						key : "bidAjax",
						methodName : "deleteBid",
						bidNo : bidNo
					}, //�������� ���� ����������(parameter����)
					success : function(result) {
						//$(this).parent().parent().find('td').eq(1).text()
						alert("������ �����߽��ϴ�.");
						selectAllBid();
					}, //���������� ������ �Լ� 
					error : function(err) {
						alert(err + "���� �߻�");
					} //���������� ������ �Լ� 
				});
			}
		});

		// ���� ���� ���� ����
		$(document).on("click", "#profile input[value='����������']", function() {

			let bidNo = $(this).attr("name");
			let goodsNo = $("input[name=goodsNo]").val();
			showPopup(false);
			$("input[name=bidNo]").val(bidNo);
			$("input[name=bidNo]").attr("readonly", "readonly");
			//popUp(bidNo, goodsNo);

		});

		$("form[name=writeForm] input[value=����]").on("click", function() {
			let state = true;
			let bidNo = $("form[name=writeForm] input[name=bidNo]").val();
			let goodsNo = $("input[name=goodsNo]").val();
			let bidPrice = $("input[name=bidPrice]").val();
			console.log(typeof bidPrice);
			if (bidPrice == "")
				state = false;

			if (state) {
				$.ajax({
					url : "ajax", //������û�ּ�
					type : "post", //��û���(method��� : get | post | put | delete )
					dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data : {
						key : "bidAjax",
						methodName : "updateBidPrice",
						bidNo : bidNo,
						goodsNo : goodsNo,
						bidPrice : bidPrice
					}, //�������� ���� ����������(parameter����)
					success : function(result) {
						//$(this).parent().parent().find('td').eq(1).text()
						if (result != 0) {
							alert("������ �����߽��ϴ�.");
							closePopup1();
							selectAllBid();
							$("input[name=bidPrice]").val("");
						} else
							alert("������ �����߽��ϴ�.");
					}, //���������� ������ �Լ� 
					error : function(err) {
						alert(err + "���� �߻�");
					} //���������� ������ �Լ� 
				});
			} else {
				alert("���� ������ �Է����ּ���.");
				return false;
			}

		});

		selectAllBid();

		function selectSellingInfoByUserId() { //�Ǹ��� ��ǰ ��ȸ
			$
					.ajax({
						url : "ajax", //������û�ּ�
						type : "post", //��û���(method��� : get | post | put | delete )
						dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
						data : {
							key : "sellAjax",
							methodName : "selectSellingInfoByUserId",
							id : "id"
						}, //�������� ���� ����������(parameter����)
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
												str += `<td><input type='button' value='�ǸŰ�����' name=${'${item.sellNo}'}></td>`;
												str += `<td><input type='button' value='�ǸŻ���' name='sellCancel' id = ${'${item.sellNo}'}></td>`;
												str += "</tr>";
											});
							$("#sellingTable tr:gt(0)").remove();
							$("#sellingTable tr:eq(0)").after(str);

						}, //���������� ������ �Լ� 
						error : function(err) {
							alert(err + "���� �߻��߾��.");
						} //���������� ������ �Լ� 
					});//ajax��
		}// �Լ���

		function selectSellWaitInfoByUserId() {//�ǸŴ���� ��ǰ��ȸ
			$
					.ajax({
						url : "ajax", //������û�ּ�
						type : "post", //��û���(method��� : get | post | put | delete )
						dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
						data : {
							key : "sellAjax",
							methodName : "selectSellWaitInfoByUserId",
							id : "id"
						}, //�������� ���� ����������(parameter����)
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
												str += `<td><input type='button' value='����' name='sellCancel' id =${'${item.sellNo}'}></td>`;
												str += "</tr>";
											});
							$("#waitTable tr:gt(0)").remove();
							$("#waitTable tr:eq(0)").after(str);

						}, //���������� ������ �Լ� 
						error : function(err) {
							alert(err + "���� �߻��߾��.");
						} //���������� ������ �Լ� 
					});//ajax��
		}
		;

		//���ɸ�� ��ȸ
		function wishList() {
			$
					.ajax({
						url : "ajax", //������û�ּ�
						type : "post", //��û���(method��� : get | post | put | delete )
						dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
						data : {
							key : "wishListAjax",
							methodName : "selectWishList"
						}, //�������� ���� ����������(parameter����)
						success : function(result) {
							let str = ""; //str+=`<td>${"${item.goodsDTO.goodsName}"}</td>`;
							let strcont = "";
							$
									.each(
											result,
											function(index, item) { $(this).html('������ȣ �ޱ�');
											 
												str += "<tr>";
												str += `<td><div class=${"bestItem item${index+1}"}>`;
												str += `<div class="item_img_block">`;
												str += `<div class="item_img">`;
												str += `<img alt="��ǰ�̹����Դϴ�." src=${pageContext.request.contextPath}/goodsImg/1.png id='product' width = "150" height="150" ></div>`;
												str += `<div id='like'><img src="img/heart.svg" id='like_img'></div></div>`;
												str += `<div id='item_text'>`;
												str += `<div class="item_brand">`;
												str += `<a href="#" id="brand_text">${"${item.brand}"}</a></div>`;
												str += `<p id="name">${"${item.goodsName}"}</p>`;
												str += `<div class="price">`;
												str += `<p id="num">${"${item.lowestPrice}"}��</p>`;
												str += `<p id="p">��ñ��Ű�  <input type='button' value='����' name='deleteWishList' id =${'${item.goodsNo}'}></div></div></div>`;
												str += "</td></tr>";
											});
							$("#wishTable tr:gt(0)").remove();
							$("#wishTable tr:eq(0)").after(str);
							

						}, //���������� ������ �Լ� 
						error : function(err) {
							alert(err + "���� �߻��߾��.");
						} //���������� ������ �Լ�
					})
		}

		//���ɸ�� ����
		$(document).on("click", "[name=deleteWishList]", function() {
			if (confirm("���ɸ�Ͽ��� �����Ͻðڽ��ϱ�?")) {
				$.ajax({
					url : "ajax", //������û�ּ�
					type : "post", //��û���(method��� : get | post | put | delete )
					dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data : {
						key : "wishListAjax",
						methodName : "deleteWishList",
						goodsNo : $(this).attr("id")
					}, //�������� ���� ����������(parameter����)
					success : function(result) {
						alert("���ɸ�Ͽ��� �����Ǿ����ϴ�.");

						wishList();
					}, //���������� ������ �Լ� 
					error : function(err) {
						alert(err + "���� �߻��߾��.");
					} //���������� ������ �Լ� 
				});//ajax��
			}
		})

		//���ݼ��� �˾�â
		$(document).on("click", "[value='�ǸŰ�����']", function() {
			let sellNo = $(this).attr("name");
			const popup = document.querySelector('#popupSell');
			$("[name='sellNo']").val(sellNo);
			popup.classList.remove('has-filter');
			popup.classList.remove('hide');
			$("[name=sellPrice]").val("");
		});

		//���ݼ����ϱ�	

		$(document).on("click", "#priceChange", function() {
			//alert($("#highestPrice").text());
			//alert($("[name='sellPrice']").val() < $("#highestPrice").text())
			if ($("[name='sellPrice']").val() > $("#highestPrice").text()) {
				if (confirm("���� �����Ͻðڽ��ϱ�?")) {
					$.ajax({
						url : "ajax", //������û�ּ�
						type : "post", //��û���(method��� : get | post | put | delete )
						dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
						data : {
							key : "sellAjax",
							methodName : "updateSellPrice",
							userId : "id",
							sellNo : $("[name='sellNo']").val(),
							sellPrice : $("[name='sellPrice']").val()
						}, //�������� ���� ����������(parameter����)
						success : function(result) {
							alert("���� ����");
							selectSellingInfoByUserId();
							closePopup2();
						}, //���������� ������ �Լ� 
						error : function(err) {
							alert(err + "���� �߻��߾��.");
						} //���������� ������ �Լ� 
					});//ajax��
				}
			} else {
				if (confirm("����ǸŸ� �Ͻðڽ��ϱ�?")) {
					$.ajax({
						url : "ajax", //������û�ּ�
						type : "post", //��û���(method��� : get | post | put | delete )
						dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
						data : {
							key : "sellAjax",
							methodName : "updateSellPrice",
							sellNo : $("[name='sellNo']").val(),
							sellPrice : $("#highestPrice").text()
						}, //�������� ���� ����������(parameter����)
						success : function(result) {
							alert("����Ǹ� �Ǿ����ϴ�.");
							selectSellingInfoByUserId();
							closePopup2();
						}, //���������� ������ �Լ� 
						error : function(err) {
							alert(err + "���� �߻��߾��.");
						} //���������� ������ �Լ� 
					});//ajax��
				}
			}

		});

		//�Ǹ����(sell���̺��� �����Ѵ�.)
		$(document).on("click", "[name='sellCancel']", function() {

			if (confirm("���� �ǸŸ� ����Ͻðڽ��ϱ�??")) {
				$.ajax({
					url : "ajax", //������û�ּ�
					type : "post", //��û���(method��� : get | post | put | delete )
					dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data : {
						key : "sellAjax",
						methodName : "deleteSell",
						sellNo : $(this).attr("id")
					}, //�������� ���� ����������(parameter����)
					success : function(result) {
						alert("�ǸŰ� ��ҵƽ��ϴ�.");
						selectSellingInfoByUserId();
						selectSellWaitInfoByUserId();
					}, //���������� ������ �Լ� 
					error : function(err) {
						alert(err + "���� �߻��߾��.");
					} //���������� ������ �Լ� 
				});//ajax��
			}
		});

		wishList();
		selectSellingInfoByUserId();
		selectSellWaitInfoByUserId();
		function selectUser() {
			$.ajax({
				url : "ajax", //������û�ּ�
				type : "post", //��û���(method��� : get | post | put | delete )
				dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
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

				}, //���������� ������ �Լ� 
				error : function(err) {
					alert(err + "���� �߻�");
				} //���������� ������ �Լ� 
			})// ���۽� 
		}// ����  ��

		$("#userUpdate").click(function() {

			if ($(this).val() == "�����ϱ�") {

				$("#userPwd").removeAttr("readonly");
				$("#userPwd").focus();
				$("#userPhone").removeAttr("readonly");
				$("#userAddr").removeAttr("readonly");
				$("#userEmail").removeAttr("readonly");

				$("#userUpdate").val("�����Ϸ�")

			}

			else if ($(this).val() == "�����Ϸ�") {

				var form = $("#userDto").serialize();
				alert(form);
				$.ajax({
					url : "ajax", //������û�ּ�
					type : "post", //��û���(method��� : get | post | put | delete )
					dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data : form,
					success : function(result) {
						if (result == 1) {
							alert("������ �Ϸ� �Ǿ����ϴ�.")
							selectUser();
							$("#userUpdate").val("�����ϱ�");

						} else {
							alert("������ �ٽ� Ȯ�����ּ���.")
						}

					}, //���������� ������ �Լ� 
					error : function(err) {
						alert(err + "���� �߻�");
					} //���������� ������ �Լ� 
				})// ���۽� 
			}

		});

		$("#pwdCheck").on("click", function() {

			$.ajax({
				url : "ajax", //������û�ּ�
				type : "post", //��û���(method��� : get | post | put | delete )
				dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
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
						alert("��й�ȣ�� �ٽ� �Է����ּ���.");
						$("[name=inputPwd]").val("");

					}

				}, //���������� ������ �Լ� 
				error : function(err) {
					alert(err + "���� �߻��߾��.");
				} //���������� ������ �Լ� 
			});//ajax��
		})

		selectUser();
		
		function newAlarm(){
			$.ajax({
				url : "ajax", //������û�ּ�
				type : "post", //��û���(method��� : get | post | put | delete )
				dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
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

				}, //���������� ������ �Լ� 
				error : function(err) {
					alert(err + "���� �߻��߾��.");
				} //���������� ������ �Լ� 
			});//ajax��
			
			
			
			
			
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
						id="defaultOpen">����������</button>
					<button class="tablinks" onclick="openCity(event, 'profile-alarm')"
						id="alarmOpen">�˶� <i class="bi bi-hearts" style="color: red;"></i><span class="alarm-counter"></span></button><!--�����˶����� [bi-hearts :�����ܸ�] --><!--�����˶����� [alarm-counter:����] -->
					<button class="tablinks" onclick="openCity(event, 'shopping-buy')">���ų���</button>
					<button class="tablinks" onclick="openCity(event, 'shopping-sell')">�Ǹų���</button>
					<button class="tablinks"
						onclick="openCity(event, 'shopping-wishList')">���ɻ�ǰ</button>

				</div>

				<div id="profile-info" class="tabcontent">
					<form name="userDto" method="post" id="userDto">
						<input type="hidden" name="key" value="userAjax"> <input
							type="hidden" name="methodName" value="updateUserInfo">
						<h3>����������</h3>
						<div id='profile_info'>
							<div id='profile_group'>
								<h4 id='grop_title'>�α�������</h4>
								<div class="form-group">
									<fieldset disabled="">
										<label class="form-label" for="disabledInput">���̵�</label> <input
											class="form-control" id="userId" type="text"
											placeholder="Disabled input here..." disabled=""
											readonly="readonly">
									</fieldset>
								</div>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">�̸�</label>
										<input class="form-control" id="userName" type="text"
											placeholder="Readonly input here..." readonly="readonly" />
									</fieldset>
								</div>
							</div>

							<div id='profile_group'>


								<h4 id='grop_title'>��������</h4>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">��й�ȣ</label>
										<input class="form-control" style="top: 5px;"
											placeholder="Readonly input here..." name="userPwd"
											id="userPwd" type="text" readonly="readonly" />
									</fieldset>
								</div>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">��ȭ��ȣ</label>

										<input class="form-control" style="top: 5px;"
											placeholder="Readonly input here..." name="userPhone"
											id="userPhone" type="text" readonly="readonly" />
									</fieldset>
									<!-- 									<div class="form-group"> -->
									<!-- 										<fieldset> -->
									<!-- 											<label class="form-label mt-4" for="readOnlyInput">�ּ�</label> -->
									<!-- 												<input class="form-control" style="top: 5px;" -->
									<!-- 												placeholder="Readonly input here..." name="userAddr" id="userAddr" -->
									<!-- 												type="text" readonly="readonly" /> -->
									<!-- 										</fieldset> -->
									<!-- 									</div> -->
									<fieldset>
										<div class="form-group">
											<label class="form-label mt-4" for="readOnlyInput">�ּ�</label>
											<p>
												<input class="form-control"
													style="width: 40%; display: inline;" placeholder="�����ȣ" na
													me="mem_oaddress" id="mem_oaddress" type="text"
													readonly="readonly">
												<button type="button" class="btn btn-default"
													onclick="execPostCode();">
													<i class="fa fa-search"></i> �����ȣ ã��
												</button>
										</div>
									</fieldset>
									<fieldset>
										<div class="form-group">
											<input class="form-control" style="top: 5px;"
												placeholder="���θ� �ּ�" name="userAddr" id="userAddr"
												type="text" readonly="readonly" />
										</div>
									</fieldset>
								</div>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">�̸���</label>
										<input class="form-control" style="top: 5px;"
											placeholder="Readonly input here..." name="userEmail"
											id="userEmail" type="text" readonly="readonly" />
									</fieldset>
								</div>



								<input type="button" value="�����ϱ�" id="userUpdate">

							</div>
						</div>
					</form>
				</div>

				<div id="profile-alarm" class="tabcontent">
					<table id="alarmList">

						<tr>
							<th>��ȣ</th>
							<th>��ǰ��</th>
							<th>����</th>
							<th>����</th>
							<th>��¥</th>
							<th>����</th>
						</tr>
					</table>
				</div>

				<div id="shopping-buy" class="tabcontent">
					<h3>����</h3>
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item" role="presentation"><a class="nav-link"
							data-bs-toggle="tab" href="#home" aria-selected="false"
							role="tab" tabindex="-1" id="buyList">���ų���</a></li>
						<li class="nav-item" role="presentation"><a
							class="nav-link active" data-bs-toggle="tab" href="#profile"
							aria-selected="true" role="tab" id="onGoingBid">������</a></li>
					

					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="home" role="tabpanel">

							<table id="buyTable">
								<tr>
									<th>��ȣ</th>
									<th>����</th>
									<th>��ǰ��</th>
									<th>�귣���</th>
									<th>�������</th>
									<th>�ŷ���</th>
									<th>�ŷ�����</th>
								</tr>
							</table>
						</div>
						<div class="tab-pane fade active show" id="profile"
							role="tabpanel">

							<table>
								<tr>
									<th>��ȣ</th>
									<th>��ǰ��</th>
									<th>�귣���</th>
									<th>������</th>
									<th>�ŷ�����</th>
									<th>����</th>
									<th>����</th>
								</tr>

							</table>
						</div>

					</div>
				</div>

				<div id="shopping-sell" class="tabcontent">
					<h3>�Ǹ�</h3>
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item" role="presentation"><a class="nav-link"
							data-bs-toggle="tab" href="#home2" aria-selected="false"
							role="tab" tabindex="0" id="sellList">�Ǹų���</a></li>
						<li class="nav-item" role="presentation"><a
							class="nav-link active" data-bs-toggle="tab" href="#profile2"
							aria-selected="false" role="tab" id="sellingList">�Ǹ���</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link"
							data-bs-toggle="tab" href="#profile3" aria-selected="false"
							role="tab" id="sellWaitList">�ǸŽ�û</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="home2" role="tabpanel">
							<table id="sellTable">
								<tr>
									<th>��ȣ</th>
									<th>����</th>
									<th>��ǰ��</th>
									<th>�귣���</th>
									<th>�������</th>
									<th>�ŷ���</th>
									<th>�ŷ�����</th>
								</tr>
							</table>
						</div>
					</div>

					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="profile2"
							role="tabpanel">
							<table id="sellingTable">
								<tr>
									<th>��ȣ</th>
									<th>��ǰ��</th>
									<th>�귣���</th>
									<th>�ǸŰ��ݰ�</th>
									<th>�������</th>
									<th>����ǸŰ�</th>
									<th>����</th>
									<th>����</th>
								</tr>
							</table>
						</div>
					</div>

					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="profile3" role="tabpanel">
							<table id="waitTable">
								<tr>
									<th>��ȣ</th>
									<th>��ǰ�̸�</th>
									<th>�귣��</th>
									<th>�ǸŰ���</th>
									<th>�����</th>
									<th>����ǸŰ�</th>
									<th>����</th>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div id="shopping-wishList" class="tabcontent">
					<h3>���ɻ�ǰ</h3>
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
					��й�ȣ: <input type="password" name="inputPwd" size="30">
					<p>

						<input type="button" value="Ȯ��" id="pwdCheck"
							style="text-align: center"> <input type="button"
							value="�ݱ�" onclick="history.back();">
					<p>
				</div>

			</form>

		</div>
	</div>

	<div id="popupBid" class="hide">
		<div class="content">
			<p>
			<form name="writeForm" method="post">
				���� ��ȣ<input type="text" name="bidNo" size="30" readonly="readonly">
				<p>
					���� ����<input type="text" name="bidPrice" size="30" maxlength="9">
				<p>
					<input type="button" value="����">
			</form>
			<button onclick="closePopup1()">�ݱ�</button>
		</div>
	</div>

	<div id="popupSell" class="hide">
		<div class="content">
			<p>
			<form name="priceChange" method="post">
				<div>
					�Ǹ� ��ȣ: <input type="text" name="sellNo" size="30"
						readonly="readonly">
					<p>
						���� ����: <input type="text" name="sellPrice" size="30">
					<p>
				</div>
				<input type="button" value="����" id="priceChange">
			</form>
			<button onclick="closePopup2()">�ݱ�</button>
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