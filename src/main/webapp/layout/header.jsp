<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function(){
			
	$("#nav-search").on("keyup",function(){
		if($(this).val() == ""){
			$("#suggest").hide();
				return;
		}
		$.ajax({
			url :"ajax" , //서버요청주소
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
	
	
});

</script>
<style type="text/css">
html,bady,div,ul,ui,dl,di,ol,h1,h2,h3,h4,h5,h6,input,
fieldset,legend,p,seect,table,th,td,tr,textarea,button{
	margin: 0; padding: 0;
}
#header{
	height: 80px; 
	min-width: 800px;
	background-color:#ffffff;	
}
/* 레이아웃 */
#header-top{
	height: 20px;
	min-width: 800px;
}
#header-bottom{
    height: 68px;
	min-width: 800px;
}
/*헤더*/
#header #header-top-menu { text-align: right;
margin-right:20px;}
#header #header-top-menu a{
	text-decoration: none; color: #222222; padding: 10px;
	font-weight: 200;	
	font-size: 15px;
	
}
#header #header-top-menu a:hover {
 font-weight: 400;	
 
}

#nav-search{
  width: 200px;
  height:33px;
  box-sizing: border-box;
  border-radius: 4px;
  font-size: 14px;
  background-color: #cccccc10;
  background-image: url('../img/icon/search02.png');
  background-size: 15px;
  background-position: 10px 7px; 
  background-repeat: no-repeat;
  padding: 12px 20px 12px 40px;
  margin-right:20px;
    border: 0.5px solid #cccccc;
  
}

/* Create a top navigation bar with a black background color  */
.topnav {
  background-color: #ffffff;
  overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #222222;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
/* .topnav a:hover { */
/*   text-decoration: overline; */
/* } */

/* Create a right-aligned (split) link inside the navigation bar */
.split { 
  float: right;
  position: relative;
  top:12px;
  margin-right: 10px;
} 

.managermode{
	display: none;
}

#logo{
	width:70px;
	height: 23px;
	float: left;
	position: relative;
	top: 4px;
	margin: 0px 20px 0px 40px;   
	font-size: 30px;
	font-weight: 900;
}

</style>
</head>
<body>
	<div id='header'>
		<div id='header-top'>
			<div id='header-top-menu'>
				<a href="${path}/mypage.jsp">마이페이지</a> <a href="${path}/QAInsert.jsp">상품등록문의</a> 
				<c:if test="${not empty userId }"><a href="${path}/front?key=user&methodName=logout">로그아웃</a> </c:if>
				<c:if test="${empty userId }"><a href="${path}/login/login.jsp">로그인</a> </c:if>
				<c:if test ="${userId eq 'admin' }"><a class="openbtn" onclick="openNav()">관리자모드</c:if></a>
				
			</div>
		</div>

		<div id='header-bottom'>
			<div class="topnav">
				<div id='logo'><a href="${path}/index.jsp" style="font-size: 24px; font-weight: 800;">LUXE</a></div>
				<a href="${pageContext.request.contextPath}/index.jsp">HOME</a> <a href="${pageContext.request.contextPath}/style/StyleBoard.jsp">STYLE</a> <a href="${pageContext.request.contextPath}/shop/shop.jsp">SHOP</a>
				<div class="split">
						<form name="search" id="search" action="${path}/shop/shop.jsp">
					    <input type="hidden" name="state" value="1" >
					    <input type="hidden" name="methodName" value="selectGoodsByGoodsName" >
					    <input type="text" placeholder="Search.." name="search" id="nav-search">
						</form>
						<div id="suggest" style="display:none"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>