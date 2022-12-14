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
<link rel="stylesheet" type="text/css" href="../css/Manager/Manager_Layout.css">
<link rel="stylesheet" type="text/css" href="../css/Manager/Manager_Sales.css">

<!-- 차트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<style type="text/css">
</style>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		//브랜드당월별매출 조회
		$(".tablinks").on("click", function(){
			
			
			$.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"salesAjax" , methodName : "selectBrandSalesByMonth", brand : $(this).text() },	
				success :function(result){
					let str="";
					$.each(result, function(index, item){
						str+=`<tr>`;
						str+=`<th>${"${item.month}"}</th>`;
						str+=`<th>${"${item.totalSales.toLocaleString()}"}원</th>`;
						str+=`<th>${"${item.totalProfit.toLocaleString()}"}원</th>`;
						str+=`</tr>`;
					})
					
					$("#myTable3 tr:gt(0)").remove();
					$("#myTable3 tr:eq(0)").after(str);
					
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
			
		
		})
		
		//전체 매출 조회
		function salesList(){
			
			$.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"salesAjax" , methodName : "selectSales" },	
				success :function(result){
					
			
					$(".sales-price:eq(0)").text(result.totalSales.toLocaleString());
					$(".sales-price:eq(1)").text(result.totalProfit.toLocaleString());
					
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝


		}
		
		//브랜드당 매출 조회
		function brandSalesList(){
			$.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"salesAjax" , methodName : "selectBrandSales"},	
				success :function(result){
					let str="";
					$.each(result, function(index, item){
						str+=`<tr>`;
						str+=`<td>${"${item.brand}"}</th>`;
						str+=`<td>${"${item.totalSales.toLocaleString()}"}원</th>`;
						str+=`<td>${"${item.totalProfit.toLocaleString()}"}원</th>`;
						str+=`</tr>`;
					})
					
					
					$("#myTable2 tr:gt(0)").remove();
					$("#myTable2 tr:eq(0)").after(str);
					
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
			

		}
		
		//판매량 조회
		function sellRate(){
			let brand = [];
			let rate = [];
			
			$.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"salesAjax" , methodName : "selectSalesRateByBrand" },	
				success :function(result){
					for(let i = 0; i< result.length; i++){
						brand.push(result[i].brand);
						rate.push(result[i].totalSalesRate);
						console.log(brand);
						console.log(rate);
					}
					
					var context = document
	                 .getElementById('myChart')
	                 .getContext('2d');
					
					var myChart = new Chart(context,{
						type: 'bar', // 차트의 형태
		                data: { // 차트에 들어갈 데이터
		                    labels: brand,//x 축
		                    datasets: [
		                        { //데이터
		                            label: '판매량', //차트 제목
		                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
		                            data: rate, //브랜드별 판매 데이터 값
		                            backgroundColor: [
		                                //색상                               
		                                '#330000',
		                                '#00ccff',
		                                '#ff0033'
		                            ],
		                            borderColor: [
		                                //경계선 색상                            
		                                '#330000',
		                                '#00ccff',                              
		                                '#ff0033'
		                            ],
		                            borderWidth: 1 //경계선 굵기
		                        }
		                    ]	
					
					 }
					,
	                 options: {
	                     scales: {
	                         yAxes: [
	                             {
	                                 ticks: {
	                                     beginAtZero: true
	                                 }
	                             }
	                         ]
	                     }
					 
	                 }
					 
					 
					})
					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝

			
		}
		
		//월별매출 조회
		$("#monthlySearch-dtn").on("click", function(){
			$.ajax({
				url :"../ajax" , //서버요청주소
				type:"post", //요청방식(method방식 : get | post | put | delete )
				dataType:"json"  , //서버가 보내온 데이터(응답)타입(text | html | xml | json )
				data: {key:"salesAjax" , methodName : "selectSalesByMonth" },	
				success :function(result){
					let str="";
					let month = [];
					let sales = [];
					let profit = [];
					
					$.each(result, function(index, item){
						str+=`<tr>`;
						str+=`<th>${"${item.month}"}</th>`;
						str+=`<th>${"${item.totalSales.toLocaleString()}"}</th>`;
						str+=`<th>${"${item.totalProfit.toLocaleString()}"}</th>`;
						str+=`</tr>`;
					})
					
					
					$("#myTable tr:gt(0)").remove();
					$("#myTable tr:eq(0)").after(str);
					
					for(let i = 0; i<result.length; i++){
						month.push(result[i].month);
						sales.push(result[i].totalSales);
						profit.push(result[i].totalProfit);
						
					}
					
					var context = document
									.getElementById('myChart2')
									.getContext('2d');
					var myChart = new Chart(context,{
					
						type:'line',
						data:{
							labels: month,
							datasets:[{
								label:'전체매출',
								fill:false,
								type:'line',
								data:sales,
								backgroudColor:[
									'#ff0000'
									
								],
								borderColor: [
	                                //경계선 색상                            
	                                '#ff0000'
	                                
	                            ],
	                            borderWidth: 1
								},{
								label:'전체순수익',
								fill:false,
								type:'line',
								data:profit,
								backgroudColor:[
									'#ffcc00'
									
								],
								borderColor: [
	                                //경계선 색상                            
	                                '#ffcc00'
	                                
	                            ],
	                            borderWidth: 1

								
							}]
						},
					 options:{
	                     scales: {
	                         yAxes: [
	                             {
	                                 ticks: {
	                                     beginAtZero: true
	                                 }
	                             }
	                         ]
	                     }
					 
					 }	
						
					})
					

					
				} , //성공했을때 실행할 함수 
				error : function(err){  
					alert(err+"에러 발생했어요.");
				}  //실팽했을때 실행할 함수 
			});//ajax끝
			
			
		})
		

		salesList();
		brandSalesList();
		sellRate();
		
	})

</script>
</head>
<body>
<div id="mySidebar" class="sidebar">
		  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  <a href="Manager_Member.jsp">회원관리</a>
		  <a href="Manager_Order.jsp">주문관리</a>
		  <a href="#">매출관리</a>
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
					<h4>매출관리페이지</h4>
					<div class="sales-detail">	
					 <div id='chart-box'>
						  <div class="sales-card">
						  <p>관련 texttextexttext</p>
						  </div>
					  </div>					
					  <div class="sales-all-detail">
					    <div class="sales-card">

					      <div class='sales-all-box'>
					      	  <div class='sales-all-box-title'>
					     	  	<h3>전체매출</h3>
					     	  </div>
						      <div class='sales-all-box-text'>
							      <span class='sales-price'></span>
							      <span class='sales-won'>원</span>
						      </div>
					      </div>
					      
					      <div class='sales-all-box'>
					     	  <div class='sales-all-box-title'>
					     	  	<h3>전체수익</h3>
					     	  </div>
						      <div class='sales-all-box-text'>
							      <span class='sales-price'></span>
							      <span class='sales-won'>원</span>
						      </div>
					      </div>
					      
					      <div>
					      	<button id="monthlySearch-dtn">월별조회하기</button>
							<div id="monthlySearch" style="display: none;">
							 <table id="myTable" class="myTable">
								  <tr class="header">
								    <th style="width:10%;">월</th>
								    <th style="width:45%;">매출</th>
								    <th style="width:45%;">수익</th>
								  </tr>
							</table>
								 <div id = "salesChart" style="width: 100%; height: 50%;">
								<!--차트가 그려질 부분-->
								<canvas id="myChart2"></canvas>
							</div>
							</div>
					      </div>
					      
					    </div>
					  </div>
					
					  <div class="sales-brand-detail">
					    <div class="sales-card">
					    <div>
					    	<table id="myTable2" class="myTable">
					    		  <tr class="header">
					    		  <th style="width:30%;">브랜드</th>
								    <th style="width:35%;">매출</th>
								    <th style="width:35%;">수익</th>
								  </tr>
								  
					    	</table>
					    </div>
					      <div class="tab">
								  <button class="tablinks" onclick="openCity(event, 'Paris')">샤넬</button>
								  <button class="tablinks" onclick="openCity(event, 'Paris')">프라다</button>
								  <button class="tablinks" onclick="openCity(event, 'Paris')">디올</button>
								</div>
								
								<!-- Tab content -->
<!-- 								<div id="London" class="tabcontent"> -->
<!-- 								  <table id="brandSalesTable"> -->
<!-- 								  <tr class="header"> -->
<!-- 								    <th style="width:10%;">월</th> -->
<!-- 								    <th style="width:45%;">매출</th> -->
<!-- 								    <th style="width:45%;">수익</th> -->
<!-- 								  </tr> -->
<!-- 								  <tr> -->
<!-- 								  	<td>1월</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								  </tr> -->
<!-- 								  <tr> -->
<!-- 								  	<td>2월</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								  </tr> -->
<!-- 								  <tr> -->
<!-- 								    <td>3월</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								  </tr> -->
								  
<!-- 								</table>  -->
<!-- 								</div> -->
								
								<div id="Paris" class="tabcontent">
								  <table id="myTable3" class="myTable">
								  <tr class="header">
								    <th style="width:10%;">월</th>
								    <th style="width:45%;">매출</th>
								    <th style="width:45%;">수익</th>
								  </tr>
<!-- 								  <tr> -->
<!-- 								  	<td>1월</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								  </tr> -->
<!-- 								  <tr> -->
<!-- 								  	<td>2월</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								  </tr> -->
<!-- 								  <tr> -->
<!-- 								    <td>3월</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								  </tr> -->
								  
								</table> 
								</div>
								
<!-- 								<div id="Tokyo" class="tabcontent"> -->
<!-- 								  <table id="myTable"> -->
<!-- 								  <tr class="header"> -->
<!-- 								    <th style="width:10%;">월</th> -->
<!-- 								    <th style="width:45%;">매출</th> -->
<!-- 								    <th style="width:45%;">수익</th> -->
<!-- 								  </tr> -->
<!-- 								  <tr> -->
<!-- 								  	<td>1월</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								  </tr> -->
<!-- 								  <tr> -->
<!-- 								  	<td>2월</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								  </tr> -->
<!-- 								  <tr> -->
<!-- 								    <td>3월</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								    <td>000.000원</td> -->
<!-- 								  </tr> -->
								  
<!-- 								</table>  -->
<!-- 								</div> -->
					    </div>
					  </div>
					  
					  <div class="sales-non-detail">
					    <div class="sales-card">
					      <h3>판매량통계</h3>
					     	<div id = "sellRate" style="width: 400px; height: 200px;">
								<!--차트가 그려질 부분-->
								<canvas id="myChart"></canvas>
							</div>
					    </div>
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
	
	<script>
	function openNav() {
	  document.getElementById("mySidebar").style.width = "250px";
	  document.getElementById("main").style.marginLeft = "250px";
	}
	
	function closeNav() {
	  document.getElementById("mySidebar").style.width = "0";
	  document.getElementById("main").style.marginLeft= "0";
	}
	
	$(function (){
		$("#monthlySearch-dtn").click(function (){
	  	$("#monthlySearch").toggle();
	  });
	})
	
	$(function (){
		$("#sellRate-dtn").click(function (){
	  	$("#sellRate").toggle();
	  });
	})
	
	function openCity(evt, cityName) {
	  // Declare all variables
	  var i, tabcontent, tablinks;
	
	  // Get all elements with class="tabcontent" and hide them
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	
	  // Get all elements with class="tablinks" and remove the class "active"
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	
	  // Show the current tab, and add an "active" class to the button that opened the tab
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}
	</script>
	

</body>
</html>
