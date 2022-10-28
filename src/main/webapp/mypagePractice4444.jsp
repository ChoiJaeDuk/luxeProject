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

<!--������-->  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- �ܺ��� css���� �����ϱ� -->
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
	
		//���ų��� ��ȸ
		$("#buyList").on("click", function(){
			$.ajax({
				url :"ajax" , //������û�ּ�
				type:"post", //��û���(method��� : get | post | put | delete )
				dataType:"json"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
				data: {key:"orderAjax" , methodName : "selectOrderByUserIdForBuy"}, //�������� ���� ����������(parameter����)
				success :function(result){
					let str="";
					$.each(result, function(index, item){
					    str+="<tr>";
					    str+=`<td>${"${(index+1)}"}</td>`;
					    str+=`<td><img alt="��ǰ�̹���" src=${pageContext.request.contextPath}${"${item.goodsMainImg}"}></td>`;
					    str+=`<td><a href='#'>${"${item.goodsName}"}</a></td>`;
					    str+=`<td>${"${item.brand}"}</td>`;
					    str+=`<td>${"${item.orderStatus}"}</td>`;
					    str+=`<td>${"${item.orderPrice.toLocaleString()}"}</td>`;
					    str+=`<td>${"${item.orderDate}"}</td>`;
					   
					    str+="</tr>";
				  });
					
					$("#buyTable tr:gt(0)").remove();
					$("#buyTable tr:eq(0)").after(str);
					
				} , //���������� ������ �Լ� 
				error : function(err){  
					alert(err+"���� �߻��߾��.");
				}  //���������� ������ �Լ� 
			});//ajax��
		})
		
		//�Ǹų��� ��ȸ
		$("#sellList").on("click", function(){
			
			$.ajax({
				url :"ajax" , //������û�ּ�
				type:"post", //��û���(method��� : get | post | put | delete )
				dataType:"json"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
				data: {key:"orderAjax" , methodName : "selectOrderByUserIdForSell" },	
				success :function(result){
					let str="";
					$.each(result, function(index, item){
					    str+="<tr>";
					    str+=`<td>${"${(index+1)}"}</td>`;
					    str+=`<td><img alt="��ǰ�̹���" src=${pageContext.request.contextPath}${"${item.goodsMainImg}"}></td>`;
					    str+=`<td><a href='#'>${"${item.goodsName}"}</a></td>`;
					    str+=`<td>${"${item.brand}"}</td>`;
					    str+=`<td>${"${item.orderStatus}"}</td>`;
					    str+=`<td>${"${item.orderPrice.toLocaleString()}"}</td>`;
					    str+=`<td>${"${item.orderDate}"}</td>`;
					    str+="</tr>";
					   
				  });
					
					$("#sellTable tr:gt(0)").remove();
					$("#sellTable tr:eq(0)").after(str);
					
				} , //���������� ������ �Լ� 
				error : function(err){  
					alert(err+"���� �߻��߾��.");
				}  //���������� ������ �Լ� 
			});//ajax��
		})
		
		//�˶���ȸ
		function alarmOpen(){
			$.ajax({
				url :"ajax" , //������û�ּ�
				type:"post", //��û���(method��� : get | post | put | delete )
				dataType:"json"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
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
					    str+=`<td><input type="button" name="alarmDelete" value ="����" id=${"${item.alarmNo}"}></td>`;
					   
					    str+="</tr>";
				  });
					
					$("#alarmList tr:gt(0)").remove();
					$("#alarmList tr:eq(0)").after(str);
					
				} , //���������� ������ �Լ� 
				error : function(err){  
					alert(err+"���� �߻��߾��.");
				}  //���������� ������ �Լ� 
			});//ajax��
		}
		

		$("#alarmOpen").on("click", function(){
	
			alarmOpen();
			
		})
		
		//�˶�����
		$(document).on("click", "[name=alarmDelete]", function(){
			let result = confirm("�˶��� �����Ͻðڽ��ϱ�?");
			if(result == true){
				 $.ajax({
					 
			   			url :"ajax" , //������û�ּ�
			   			type:"post", //��û���(method��� : get | post | put | delete )
			   			dataType:"text"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
			   			data: {key:"alarmAjax" , methodName : "deleteAlarm", alarmNo : $(this).attr('id') }, //�������� ���� ����������(parameter����)
			   			success :function(result){
			   				if(result==0){
			   					alert("�������� �ʾҽ��ϴ�.");
			   				}else{
			   					alert("�����Ǿ����ϴ�.");
			   					alarmOpen();
			   				}
			   				
			   				
			   			} , //���������� ������ �Լ� 
			   			error : function(err){  
			   				alert(err+"���� �߻��߾��.");
			   			}  //���������� ������ �Լ� 
			   		});//ajax��
			}
			
		})
		
		//���� ���� ���� ��ȸ
		function selectAllBid(){
			$.ajax({
				url : "ajax", //������û�ּ�
				type : "post", //��û���(method��� : get | post | put | delete )
				dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
				data : {key : "bidAjax", methodName : "selectAllBidByUserId", bidStatus : "������"}, //�������� ���� ����������(parameter����)
				success : function(result) {
					let str = "";
					$.each(result, function(index, bid) {
						str += "<tr>";
						str += "<td>" + (index + 1) + "</td>";
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
		};
		
		// ������ ���ý� �⺻���� �������� ���� ���
		$("#purchaseButton").on("click", function(){
			$("#profile").css("visibility", "visible");
			$("#onGoingBid").trigger("click");
		});

		
		/**���� �� ���� ��ȸ*/
		$("#onGoingBid").on("click", function() {
			selectAllBid();
		});
		
		
		//���� ���� ����
		$(document).on("click", "#profile input[value='��������']", function () {
			if(confirm("�����Ͻðڽ��ϱ�?")){
				let bidNo = $(this).attr("name");
				$.ajax({
					url : "ajax", //������û�ּ�
					type : "post", //��û���(method��� : get | post | put | delete )
					dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data : {key : "bidAjax", methodName : "deleteBid", bidNo:bidNo}, //�������� ���� ����������(parameter����)
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
		$(document).on("click", "#profile input[value='����������']", function () {
			
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
				if(bidPrice=="")
					state=false;
					
				
				if(state){
					$.ajax({
						url : "ajax", //������û�ּ�
						type : "post", //��û���(method��� : get | post | put | delete )
						dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
						data : {key : "bidAjax", methodName : "updateBidPrice", bidNo:bidNo, goodsNo: goodsNo, bidPrice:bidPrice}, //�������� ���� ����������(parameter����)
						success : function(result) {
							//$(this).parent().parent().find('td').eq(1).text()
							if(result!=0){
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
			
			function selectSellingInfoByUserId(){ //�Ǹ��� ��ǰ ��ȸ
				   $.ajax({
					url :"ajax" , //������û�ּ�
					type:"post", //��û���(method��� : get | post | put | delete )
					dataType:"json"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data: {key:"sellAjax" , methodName : "selectSellingInfoByUserId", id : "id"}, //�������� ���� ����������(parameter����)
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
						    str+=`<td><input type='button' value='�ǸŰ�����' name=${'${item.sellNo}'}></td>`;
						    str+=`<td><input type='button' value='�ǸŻ���' name='sellCancel' id = ${'${item.sellNo}'}></td>`;
						    str+="</tr>";
					  });
					 	$("#sellingTable tr:gt(0)").remove();
						$("#sellingTable tr:eq(0)").after(str); 
						
					} , //���������� ������ �Լ� 
					error : function(err){  
						alert(err+"���� �߻��߾��.");
					}  //���������� ������ �Լ� 
				});//ajax��
			   }// �Լ���
			
				
			
			function selectSellWaitInfoByUserId() {//�ǸŴ���� ��ǰ��ȸ
				$.ajax({
					url :"ajax" , //������û�ּ�
					type:"post", //��û���(method��� : get | post | put | delete )
					dataType:"json"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data: {key:"sellAjax" , methodName : "selectSellWaitInfoByUserId", id : "id"}, //�������� ���� ����������(parameter����)
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
						    str+=`<td><input type='button' value='����' name='sellCancel' id =${'${item.sellNo}'}></td>`;
						    str+="</tr>";
					  });
						$("#waitTable tr:gt(0)").remove();
						$("#waitTable tr:eq(0)").after(str);
						
					} , //���������� ������ �Լ� 
					error : function(err){  
						alert(err+"���� �߻��߾��.");
					}  //���������� ������ �Լ� 
				});//ajax��
			};
			
			//���ɸ�� ��ȸ
			 function wishList() {
				$.ajax({
					url :"ajax" , //������û�ּ�
					type:"post", //��û���(method��� : get | post | put | delete )
					dataType:"json"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data: {key:"wishListAjax" , methodName : "selectWishList"}, //�������� ���� ����������(parameter����)
					success :function(result){
						let str="";  //str+=`<td>${"${item.goodsDTO.goodsName}"}</td>`;
						$.each(result, function(index, item){
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
						
					} , //���������� ������ �Լ� 
					error : function(err){  
						alert(err+"���� �߻��߾��.");
					}  //���������� ������ �Լ�
				})
			}
			
			
			//���ɸ�� ����
				$(document).on("click", "[name=deleteWishList]", function() {
					if(confirm("���ɸ�Ͽ��� �����Ͻðڽ��ϱ�?")){
						$.ajax({
							url :"ajax" , //������û�ּ�
							type:"post", //��û���(method��� : get | post | put | delete )
							dataType:"text"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
							data: {key:"wishListAjax" , methodName : "deleteWishList", goodsNo : $(this).attr("id")}, //�������� ���� ����������(parameter����)
							success :function(result){
								alert("���ɸ�Ͽ��� �����Ǿ����ϴ�.");
				
								wishList();
							} , //���������� ������ �Լ� 
							error : function(err){  
								alert(err+"���� �߻��߾��.");
							}  //���������� ������ �Լ� 
						});//ajax��
					} 
				})
			
			
			//���ݼ��� �˾�â
			$(document).on("click","[value='�ǸŰ�����']", function(){
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
					if($("[name='sellPrice']").val() > $("#highestPrice").text()){
						if(confirm("���� �����Ͻðڽ��ϱ�?")){
							$.ajax({
								url :"ajax" , //������û�ּ�
								type:"post", //��û���(method��� : get | post | put | delete )
								dataType:"text"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
								data: {key:"sellAjax" , methodName : "updateSellPrice", userId : "id", sellNo : $("[name='sellNo']").val(), sellPrice : $("[name='sellPrice']").val()}, //�������� ���� ����������(parameter����)
								success :function(result){
									alert("���� ����");
									selectSellingInfoByUserId();
									closePopup2();
								} , //���������� ������ �Լ� 
								error : function(err){  
									alert(err+"���� �߻��߾��.");
								}  //���������� ������ �Լ� 
							});//ajax��
						}
					}else {
						if(confirm("����ǸŸ� �Ͻðڽ��ϱ�?")){
							$.ajax({
								url :"ajax" , //������û�ּ�
								type:"post", //��û���(method��� : get | post | put | delete )
								dataType:"text"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
								data: {key:"sellAjax" , methodName : "updateSellPrice", sellNo : $("[name='sellNo']").val(), sellPrice : $("#highestPrice").text()}, //�������� ���� ����������(parameter����)
								success :function(result){
									alert("����Ǹ� �Ǿ����ϴ�.");
									selectSellingInfoByUserId();
									closePopup2();
								} , //���������� ������ �Լ� 
								error : function(err){  
									alert(err+"���� �߻��߾��.");
								}  //���������� ������ �Լ� 
							});//ajax��
						}
					}
				
			});
			
			//�Ǹ����(sell���̺��� �����Ѵ�.)
			$(document).on("click", "[name='sellCancel']", function() {
			
				 if(confirm("���� �ǸŸ� ����Ͻðڽ��ϱ�??")){
					$.ajax({
						url :"ajax" , //������û�ּ�
						type:"post", //��û���(method��� : get | post | put | delete )
						dataType:"text"  , //������ ������ ������(����)Ÿ��(text | html | xml | json )
						data: {key:"sellAjax" , methodName : "deleteSell", sellNo : $(this).attr("id")}, //�������� ���� ����������(parameter����)
						success :function(result){
							alert("�ǸŰ� ��ҵƽ��ϴ�.");
							selectSellingInfoByUserId();
							selectSellWaitInfoByUserId();
						} , //���������� ������ �Լ� 
						error : function(err){  
							alert(err+"���� �߻��߾��.");
						}  //���������� ������ �Լ� 
					});//ajax��
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
				<a href="">����������</a>
				<a href="">���ɻ�ǰ</a>
				<a href="">�α���</a>
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
		  <button class="tablinks" onclick="openCity(event, 'profile-info')" id="defaultOpen">����������</button>
		  <button class="tablinks" onclick="openCity(event, 'profile-alarm')" id="alarmOpen">�˶�</button>
		  <button class="tablinks" onclick="openCity(event, 'shopping-buy')">���ų���</button>
		  <button class="tablinks" onclick="openCity(event, 'shopping-sell')">�Ǹų���</button>
		  <button class="tablinks" onclick="openCity(event, 'shopping-wishList')">���ɻ�ǰ</button>
		  
		</div>

		<div id="profile-info" class="tabcontent">
		  <h3>����������</h3>
		  <div id='profile_info'>
					<div id='profile_group'>
						<h4 id='grop_title'>�α�������</h4>
							<div class="form-group">
							  <fieldset disabled=""> 
							    <label class="form-label" for="disabledInput">���̵�</label>
							    <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="">
							  </fieldset>
							</div>
						<div class="form-group">
						  <fieldset>
						    <label class="form-label mt-4" for="readOnlyInput">��й�ȣ</label>
						    <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." readonly="">
						  </fieldset>
						</div>
					</div>
					
					<div id='profile_group'>
					<form action="">
						<h4 id='grop_title'>��������</h4>
						<div class="form-group">
						  <fieldset>
						    <label class="form-label mt-4" for="readOnlyInput">�̸�</label>
						    <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." readonly="">
						  </fieldset>
						</div>
						<div class="form-group">
						  <fieldset>
						    <label class="form-label mt-4" for="readOnlyInput">��ȭ��ȣ</label>
						    <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." readonly="">
						  </fieldset>
						</div>
						<div class="form-group">
						  <fieldset>
						    <label class="form-label mt-4" for="readOnlyInput">�ּ�</label>
						    <input class="form-control" id="readOnlyInput" type="text" placeholder="Readonly input here..." readonly="">
						  </fieldset>
						</div>
						<button>�����ϱ�</button>
					</form>
					</div>
				</div>
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
			  <li class="nav-item" role="presentation">
			    <a class="nav-link" data-bs-toggle="tab" href="#home" aria-selected="false" role="tab" tabindex="-1" id="buyList">���ų���</a>
			  </li>
			  <li class="nav-item" role="presentation">
			    <a class="nav-link active" data-bs-toggle="tab" href="#profile" aria-selected="true" role="tab" id="onGoingBid">������</a>
			  </li>
		<%
			session.setAttribute("userId", "ID");
		
		%>	 
	
			</ul>
			<div id="myTabContent" class="tab-content">
			  <div class="tab-pane fade" id="home" role="tabpanel">
			
				<table id= "buyTable">
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
			  <div class="tab-pane fade active show" id="profile" role="tabpanel">
			 
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
  <li class="nav-item" role="presentation">
    <a class="nav-link" data-bs-toggle="tab" href="#home2" aria-selected="false" role="tab" tabindex="0" id="sellList">�Ǹų���</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link active" data-bs-toggle="tab" href="#profile2" aria-selected="false" role="tab" id="sellingList">�Ǹ���</a>
  </li>
   <li class="nav-item" role="presentation">
    <a class="nav-link" data-bs-toggle="tab" href="#profile3" aria-selected="false" role="tab" id="sellWaitList">�ǸŽ�û</a>
  </li>
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
  	<div class="tab-pane fade active show" id="profile2" role="tabpanel">
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
			���� ��ȣ<input type="text" name="bidNo" size="30" readonly="readonly"><p>
			���� ����<input type="text" name="bidPrice" size="30" maxlength="9"><p>
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
		�Ǹ� ��ȣ: <input type="text" name="sellNo" size="30" readonly="readonly"><p>
		���� ����: <input type="text" name="sellPrice" size="30"><p>		
	</div>
	<input type="button" value="����" id="priceChange">
</form>
    <button onclick="closePopup2()">�ݱ�</button>
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