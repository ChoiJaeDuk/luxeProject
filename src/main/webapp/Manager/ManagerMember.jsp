<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link rel="stylesheet" type="text/css" href="../layout/css/Reset.css">
<link rel="stylesheet" type="text/css" href="../layout/css/Layout.css">
<link rel="stylesheet" type="text/css" href="../css/manager/ManagerMember.css">

<style type="text/css">
.sidebar {
	height: 100%;
	width: 0px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #222;
	overflow-x: hidden;
	transition: 0.5s;
	padding: 0;
	display: none;
}

.sidebar a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
	top: 50px;
	position: relative;
}

.sidebar a:hover {
	color: #f1f1f1;
}

.sidebar .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
	.sidebar {
		padding-top: 15px;
	}
	.sidebar a {
		font-size: 18px;
	}
}
</style>

<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function(){


	function userList(){
	
		
		
		$.ajax({
			url :"../ajax" , //서버요청주소
			type:"post", //요청방식(method방식 : get | post | put | delete )
			dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
			data: {key:"userAjax" , methodName : "selectAllUsers"},	
			success :function(result){
				let str="";
				$.each(result, function(index, item){
					str+=`<tr>`;
					str+=`<td>${"${index+1}"}`;
					str+=`<td>${"${item.userName}"}</th>`;
					str+=`<td>${"${item.userAddr}"}</th>`;
					str+=`<td>${"${item.userPhone}"}</th>`;
					str+=`<td>${"${item.userEmail}"}</th>`;
					str+=`</tr>`;
				})
				
				$("#myTable tr:gt(0)").remove();
				$("#myTable tr:eq(0)").after(str);
				
				
			} , //성공했을때 실행할 함수 
			error : function(err){  
				alert(err+"에러 발생했어요.");
			}  //실팽했을때 실행할 함수 
		});//ajax끝


	}
	
	$("#pwdCheck").on("click", function(){
		
		$.ajax({
			url :"../ajax" , //서버요청주소
			type:"post", //요청방식(method방식 : get | post | put | delete )
			dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
			data: {key:"userAjax" , methodName : "selectUser"},	
			success :function(result){
				console.log(result);
				let pwd = $("[name=userPwd]").val();
				//console.log(pwd);
				if(result.userPwd == pwd){
					//window.close(); 
					closePopup();
				}else{
					alert("비밀번호를 다시 입력해주세요.");
				}
							
				
			} , //성공했을때 실행할 함수 
			error : function(err){  
				alert(err+"에러 발생했어요.");
			}  //실팽했을때 실행할 함수 
		});//ajax끝
	})
		
	userList();
	
	})
	


function closePopup() {
		const popup = document.querySelector('#popup');
	  	popup.classList.add('hide');
}


</script>
</head>
<body>

<div id="popup" class="has-filter">
  <div class="content">
    <p>

<form name="pwdCheck" method="post" style="text-align: center">
	
	<div style="text-align: center">
		비밀번호: <input type="password" name="userPwd" size="30"><p>
		
		
	
	 <input type="button" value="확인" id="pwdCheck" style="text-align: center">
	 <input type="button" value="닫기" onclick="history.back();">

 		<p>
<!--  		<button id="checkbtn">확인</button> -->
  		
  	</div>
  	

</form>
   
  </div>
</div>


	<div id="mySidebar" class="sidebar">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
<a href="ManagerMember.jsp">회원관리</a> <a href="ManagerProduct.jsp">상품관리</a> <a href="ManagerOrder.jsp">주문현황</a> <a
			href="ManagerSales.jsp">매출현황</a> <a href="ManagerQABoard.jsp">문의관리</a> <a href="ManagerApproval.jsp">상품승인관리</a>
	</div>
	<div id='wrap'>

		<jsp:include page="../layout/header.jsp" />

		<div class="clear"></div>


		<div id='contents'>
         <div class="container">
         <div id='con'>
            <div id='info-container'>
               <h4>회원관리페이지</h4>
               <div>
                  <table id="myTable">
                    <tr class="header">
                      <td >No</td>
                      <td >Name</td>
                      <td >Addr</td>
                      <td >Phone</td>
                      <td >Email</td>
                    </tr>
                    
                  </table>
               </div>
            </div>
            </div>
         </div>
      </div>
		<!-- contents -->
		<div class="clear"></div>

		<jsp:include page="../layout/footer.jsp" />

	</div>
	
	 <%
			session.setAttribute("userId", "admin");
		
		%>
	<!-- 스크립트 -->
	<script>
	function openNav() {
	  document.getElementById("mySidebar").style.width = "250px";
	  document.getElementById("wrap").style.marginLeft = "250px";
	  document.getElementById("mySidebar").style.display = "block";
	}
	
	function closeNav() {
	  document.getElementById("mySidebar").style.width = "0px";
	  document.getElementById("wrap").style.marginLeft= "0px";
	  document.getElementById("mySidebar").style.display = "none";
	}
	</script>
</body>
