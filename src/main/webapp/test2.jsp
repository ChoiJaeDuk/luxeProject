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

<form name="writeForm" method="post" action="${pageContext.request.contextPath}/front?key=order&methodName=insertOrders"
enctype="multipart/form-data">
	brand<input type="text" name="brand" size="30"><p>
	category<input type="text" name="category" size="30"><p>
	goodsName<input type="text" name="goodsName" size="30"><p>
	goodsNamekor<input type="text" name="goodsNameKor" size="30"><p>
	goodsModelNo<input type="text" name="goodsModelNo" size="30"><p>
	releaseDate<input type="text" name="goodsReleaseDate" size="30"><p>
	releasePrice<input type="text" name="goodsReleasePrice" size="30"><p>	

   <input type="file" name="goodsMainImg" maxlength="60" size="40">
  
	<input type="submit" value="보내!">
	
	<a href="${pageContext.request.contextPath}/front?key=sell&methodName=selectSellAll"> tttt</a>
	<c:forEach items="${sellAllList}" var="s">
		<p>${s.sellPrice}<p>
		${s.sellNo}<p>
		
	</c:forEach>
</form>
</body>
</html>