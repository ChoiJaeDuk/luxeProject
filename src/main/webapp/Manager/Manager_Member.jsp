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

<!--아이콘-->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
<link rel="stylesheet" type="text/css" href="../css/Reset.css">
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/Layout.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/Manager/Manager_Layout.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/Manager/Manager_Member.css"> -->

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
		비밀번호: <input type="text" name="userPwd" size="30"><p>
		
		
	
	 <input type="button" value="확인" id="pwdCheck" style="text-align: center">

 		<p>
<!--  		<button id="checkbtn">확인</button> -->
  		
  	</div>
  	<input type="button" value="닫기" onclick=history.back()>

</form>
   
  </div>
</div>

</div>


<div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="Manager_Member.jsp">회원관리</a>
        <a href="Manager_Order.jsp">주문관리</a>
        <a href="Manager_Sales.jsp">매출관리</a>
        <a href="#">상품등록</a>
</div>
<div id='main'>
      <div id='header'>
         <div class="container">
            <div id='header-top'>
               <div class="container">
                  <div id='header-top-menu'>
                     <a href="">마이페이지</a> <a href="">관심상품</a> <a href="">로그인</a><a class="openbtn" onclick="openNav()">관리자모드</a>
                  </div>
               </div>
               <!-- container -->
            </div>
            <!--header-top -->

            <div id='header-nav'>
               <div class="container">
                  <nav class="navbar navbar-expand-lg navbar-light bg-light">
                     <div class="container-fluid">
                        <a class="navbar-brand" href="#">Navbar</a>
                        <button class="navbar-toggler" type="button"
                           data-bs-toggle="collapse" data-bs-target="#navbarColor03"
                           aria-controls="navbarColor03" aria-expanded="false"
                           aria-label="Toggle navigation">
                           <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarColor03">
                           <ul class="navbar-nav me-auto">
                              <li class="nav-item"><a class="nav-link active" href="#">Home
                              </a></li>
                              <li class="nav-item"><a class="nav-link" href="#">Shop</a>
                              </li>
                              <li class="nav-item"><a class="nav-link" href="#">Style</a>
                              </li>
                           </ul>
                           <form class="d-flex">
                              <input class="form-control me-sm-2" type="text"
                                 placeholder="Search">
                              <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                           </form>
                        </div>
                     </div>
                  </nav>
               </div>
               <!-- container -->
            </div>
            <!-- header-nav -->

         </div>
         <!--header container -->
      </div>
      <!-- header -->
      <div class="clear"></div>
   
      <div id='contents'>
         <div class="container">
            <div id='info-container'>
               <h4>회원관리페이지</h4>
               <p>관련 texttextexttext</p>
               <div>
                  <table id="myTable">
                    <tr class="header">
                      <th style="width:10%;">No</th>
                      <th style="width:20%;">Name</th>
                      <th style="width:30%;">Addr</th>
                      <th style="width:20%;">Phone</th>
                      <th style="width:20%;">Email</th>
                    </tr>
                    
                  </table>
               </div>
            </div>
         </div>
      </div>
      <!-- contents -->
      <div class="clear"></div>

      <div id='footer'>
         <div class="container"></div>
      </div>

   </div>
   
   <%
			session.setAttribute("userId", "admin");
		
		%>	 
   
   <script>
   function openNav() {
     document.getElementById("mySidebar").style.width = "250px";
     document.getElementById("main").style.marginLeft = "250px";
   }
   
   function closeNav() {
     document.getElementById("mySidebar").style.width = "0";
     document.getElementById("main").style.marginLeft= "0";
   }
   </script>
</body>
</html>