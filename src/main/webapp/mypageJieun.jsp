<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="css/mypage2.css">
<style type="text/css">
</style>

<script type="text/javascript" src="js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(function(){
	
		$("#orderList").on("click", function(){
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
					    str+=`<td>${"${item.goodsMainImg}"}</td>`;
					    str+=`<td><a href='#'>${"${item.goodsName}"}</a></td>`;
					    str+=`<td>${"${item.brand}"}</td>`;
					    str+=`<td>${"${item.orderStatus}"}</td>`;
					    str+=`<td>${"${item.orderPrice}"}</td>`;
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
		
		
	})
	
	
	
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
		  <button class="tablinks" onclick="openCity(event, 'profile-alarm')">�˶�</button>
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
		  <h3>�˶�</h3>
		  <p>Paris is the capital of France.</p> 
		</div>
		
		<div id="shopping-buy" class="tabcontent">
		  <h3>����</h3>
		  <ul class="nav nav-tabs" role="tablist">
			  <li class="nav-item" role="presentation">
			    <a class="nav-link" data-bs-toggle="tab" href="#home" aria-selected="false" role="tab" tabindex="-1" id="orderList">���ų���</a>
			  </li>
			  <li class="nav-item" role="presentation">
			    <a class="nav-link active" data-bs-toggle="tab" href="#profile" aria-selected="true" role="tab">������</a>
			  </li>
		<%
			session.setAttribute("userId", "id");
		
		%>	 
	
			</ul>
			<div id="myTabContent" class="tab-content">
			  <div class="tab-pane fade" id="home" role="tabpanel">
			  <h3>���ų���</h3>
				<table id= "buyTable">
				<tr>
					<th>��ǰ��</th>
					<th>�귣���</th>
					<th>�������</th>
					<th>�ŷ���</th>
					<th>�ŷ�����</th>
				</tr>
				</table>
			  </div>
			  <div class="tab-pane fade active show" id="profile" role="tabpanel">
			  	<h3>������</h3>
			  	<table>
				<tr>
					<th>��ǰ��</th>
					<th>�귣���</th>
					<th>������</th>
					<th>�ŷ�����</th>
				</tr>
				
				
				</table>
			  </div>
			 
   	      	</div>
		 </div>
		
		<div id="shopping-sell" class="tabcontent">
		  <h3>�Ǹ�</h3>
		 <ul class="nav nav-tabs" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link" data-bs-toggle="tab" href="#home" aria-selected="false" role="tab" tabindex="-1">Home</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link active" data-bs-toggle="tab" href="#profile" aria-selected="true" role="tab">Profile00</a>
  </li>
   <li class="nav-item" role="presentation">
    <a class="nav-link active" data-bs-toggle="tab" href="#profile" aria-selected="true" role="tab">Profile99</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade active show" id="home" role="tabpanel">
    <p>1Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
  </div>
  <div class="tab-pane fade active show" id="profile" role="tabpanel">
    <p>2Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
  </div>
	<div class="tab-pane fade active show" id="profile" role="tabpanel">
    <p>3Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
  </div>
</div>
		 </div>
		 
		<div id="shopping-wishList" class="tabcontent">
		  <h3>���ɻ�ǰ</h3>
		  <section id='product'>
				<div class="productBEST_container">
					<div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="��ǰ�̹����Դϴ�." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img' ></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">�귣��</a>
							</div>
							<p id="name">��ǰ�̸�</p>
							<div class="price">
								<p id="num">000,000��</p>
								<p id="p">��ñ��Ű�</p>
							</div>
						</div>
					</div>
					<div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="��ǰ�̹����Դϴ�." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img'></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">�귣��</a>
							</div>
							<p id="name">��ǰ�̸�</p>
							<div class="price">
								<p id="num">000,000��</p>
								<p id="p">��ñ��Ű�</p>
							</div>
						</div>
					</div><div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="��ǰ�̹����Դϴ�." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img'></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">�귣��</a>
							</div>
							<p id="name">��ǰ�̸�</p>
							<div class="price">
								<p id="num">000,000��</p>
								<p id="p">��ñ��Ű�</p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="productBEST_container">
					<div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="��ǰ�̹����Դϴ�." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img'></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">�귣��</a>
							</div>
							<p id="name">��ǰ�̸�</p>
							<div class="price">
								<p id="num">000,000��</p>
								<p id="p">��ñ��Ű�</p>
							</div>
						</div>
					</div>
					<div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="��ǰ�̹����Դϴ�." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img'></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">�귣��</a>
							</div>
							<p id="name">��ǰ�̸�</p>
							<div class="price">
								<p id="num">000,000��</p>
								<p id="p">��ñ��Ű�</p>
							</div>
						</div>
					</div><div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="��ǰ�̹����Դϴ�." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img'></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">�귣��</a>
							</div>
							<p id="name">��ǰ�̸�</p>
							<div class="price">
								<p id="num">000,000��</p>
								<p id="p">��ñ��Ű�</p>
							</div>
						</div>
					</div>
				</div>
								<div class="productBEST_container">
					<div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="��ǰ�̹����Դϴ�." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img'></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">�귣��</a>
							</div>
							<p id="name">��ǰ�̸�</p>
							<div class="price">
								<p id="num">000,000��</p>
								<p id="p">��ñ��Ű�</p>
							</div>
						</div>
					</div>
					<div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="��ǰ�̹����Դϴ�." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img'></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">�귣��</a>
							</div>
							<p id="name">��ǰ�̸�</p>
							<div class="price">
								<p id="num">000,000��</p>
								<p id="p">��ñ��Ű�</p>
							</div>
						</div>
					</div><div class="bestItem item1">
						<div class="item_img_block">
						<div class="item_img">
							<img alt="��ǰ�̹����Դϴ�." src="" id='product' >
						</div>
						<div id='like'><img src="img/heart.svg" id='like_img'></div>
						</div>
						<div id='item_text'>
							<div class="item_brand">
								<a href="#" id="brand_text">�귣��</a>
							</div>
							<p id="name">��ǰ�̸�</p>
							<div class="price">
								<p id="num">000,000��</p>
								<p id="p">��ñ��Ű�</p>
							</div>
						</div>
					</div>
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