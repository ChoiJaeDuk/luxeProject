<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src = "js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

// 	$(document).on("change", "select[name=orderStatus]", function(){
// 		let result;
// 		result = confirm("배송상태를 변경하시겠습니까?");
// 		if(result == true){
// 			document.orderList.methodName.value ="updateOrderByUserID";
// 			document.orderList.submit();
				
		
			
// 		}
		
// 	})

		$(document).on("change","select[name=orderStatus]" , function(){
			let result1;
	 		result1 = confirm("배송상태를 변경하시겠습니까?");
	 		if(result1 == true){
	 			console.log(result1);
				  $.ajax({
					 
			   			url :"ajax" , //서버요청주소
			   			type:"post", //요청방식(method방식 : get | post | put | delete )
			   			dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
			   			data: {key:"orderAjax" , methodName : "updateOrderByUserID" ,orderNo : $(this).parent().prev().prev().prev().text(), orderStatus : $(this).val() }, //서버에게 보낼 데이터정보(parameter정보)
			   			success :function(result){
			   				if(result==0){
			   					alert("변경되지 않았습니다.");
			   				}else{
			   					alert("변경되었습니다.");
			   				}
			   				
			   			} , //성공했을때 실행할 함수 
			   			error : function(err){  
			   				alert(err+"에러 발생했어요.");
			   			}  //실팽했을때 실행할 함수 
			   		});//ajax끝
	 		}
		   });
	   

</script>
<body>
 <table>

<c:forEach items="${order }" var="order">
	
	<tr>
	
	<th><a href="#" id="${order.orderNo}">${order.orderNo}</a></th>
	<th>${order.orderPrice}</th>
	<th>${order.orderDate}</th>
	<th>

		<select name = "orderStatus">
			<option value="${order.orderStatus}" selected>${order.orderStatus}</option>
			<option value="검수대기">검수대기</option>
			<option value="검수중">검수중</option>
			<option value="배송시작">배송시작</option>
			<option value="배송완료">배송완료</option>
			<option value="주문취소">주문취소</option>
		</select>	

	</th>
	<th>${order.buyerId}</th>
	<th>${order.sellerId }</th>
	
	</tr>
	

</c:forEach>

<c:forEach items="${sellerOrder}" var="order">

	<tr>
	<th>${order.goodsName}</th>
	<th>${order.brand}</th>
	<th>${order.orderStatus}</th>
	<th>${order.orderPrice}</th>
	<th>${order.orderDate}</th>
	</tr>

</c:forEach>

<c:forEach items="${buyerOrder}" var="order">

	<tr>
	<th>${order.goodsName}</th>
	<th>${order.brand}</th>
	<th>${order.orderStatus}</th>
	<th>${order.orderPrice}</th>
	<th>${order.orderDate}</th>
	</tr>

</c:forEach>

</table> 


<%-- 매출액 : ${orderSales.totalSales}<p>
수익 : ${orderSales.totalProfit }<p> --%>

<%-- <a href="${pageContext.request.contextPath}/front?key=sales&methodName=selectSalesByMonth" class="btn btn-danger">상세보기</a><p> --%>
<c:forEach items="${salesByMonthlist}" var="list">

	<tr>
	<th>${list.month}월</th>
	<th>${list.totalSales}원</th>
	<th>${list.totalProfit}원</th>
	</tr>

</c:forEach>

<c:forEach items="${brandList}" var="list">

	<tr>
	<th>${list.month}월</th>
	<th>${list.totalSales}원</th>
	<th>${list.totalProfit}원</th>
	</tr>

</c:forEach>

<table>
<c:forEach items="${rateList}" var="list">

	<tr>
	<th>${list.brand}</th>
	<td>${list.totalSalesRate}</td>
	</tr>

</c:forEach>
</table>

<table>
<c:forEach items="${alarmList}" var="list">

	<tr>
	<th>${list.goodsName}</th>
	<td>${list.alarmSubject}</td>
	<td>${list.alarmContent}</td>
	<td>${list.issueDate}</td>
	</tr>

</c:forEach>
</table>
<c:if test="${not empty result }">
	새로운 메시지
</c:if>
${result};
</body>
</html>