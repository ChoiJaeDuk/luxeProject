<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script type="text/javascript">
	$(function() {
		 $("#id").keyup(function(){
			   if($(this).val() == ""){
				   $("span").text("중복결과여부");
				   return;
			   }
			   
			   $.ajax({
		   			url :"../ajax" , //서버요청주소
		   			type:"post", //요청방식(method방식 : get | post | put | delete )
		   			dataType:"text"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
		   			data: {key:"customer" , methodName : "idCheck" , id : $(this).val() }, //서버에게 보낼 데이터정보(parameter정보)
		   			success :function(result){
		   				$("span").text(result);
		   				
		   			} , //성공했을때 실행할 함수 
		   			error : function(err){  
		   				alert(err+"에러 발생했어요.");
		   			}  //실팽했을때 실행할 함수 
		   		});//ajax끝
		   });//keyup끝
		
		
	})
</script> -->
</head>	
<body>
 <a href="testDuck.jsp/front?key=sell&methodName=updateSellPrice">나와랏!!!</a> 

<form name="writeForm" method="post" action="${pageContext.request.contextPath}/front?key=user&methodName=login">
	userId<input type="text" name="userId" size="30"><p>
	userPwd<input type="text" name="userPwd" size="30"><p>
	userName<input type="text" name="userName" size="30"><p>
	userAddr<input type="text" name="userAddr" size="30"><p>
	userPhone<input type="text" name="userPhone" size="30"><p>
	userJob<input type="text" name="userJob" size="30"><p>
	userEmail<input type="text" name="userEmail" size="30"><p>	
	<input type="submit" value="보내!">
	
	<a href="${pageContext.request.contextPath}/front?key=sell&methodName=selectSellAll"> tttt</a>
	<c:forEach items="${sellAllList}" var="s">
		<p>${s.sellPrice}<p>
		${s.sellNo}<p>
		
	</c:forEach>
</form>
</body>
</html>