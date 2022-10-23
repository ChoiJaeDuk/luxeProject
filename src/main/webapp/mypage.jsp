<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- �ܺ��� css���� �����ϱ� -->
<link rel="stylesheet" type="text/css" href="css/login.css">
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

<style type="text/css">
</style>
</head>
<body>
<div id='page'>
	<header>
		<div id='logo'>
			<img alt="�ΰ�" src="img/logo.PNG">
		</div>
		
		<nav id='menus'>
			<div id='top_menu'>
				<a href="mypage.jsp">����������</a> <a href="">���ɻ�ǰ</a> <a href="login.jsp">�α���</a>
			</div>
			<ul id='main_menu'>
				<li><a href="">SHOP</a></li>
				<li><a href="">STYLE</a></li>
				<li><a href="">HOME</a></li>
				<li><form class="search" role="search">
				<input id="searchbar" type="search">
				<a id="searchicon" type="submit"><i class="bi bi-search" ></i></a>
			</form></li>
			</ul>
			
		</nav>
	</header>	
	<div class="clear"></div>
	
	<section id='contents'>
	
		<nav id='sub_menu'>
			<h3><b>����������</b></h3>
			<h4>������</h4>
			<ul>
				<li><a href="#" id=''>����������</a></li>
				<li><a href="" id=''>�˶�</a></li>
			</ul>
			
			<h4>��������</h4>
			<ul>
				<li><a href="" id=''>���ų���</a></li>
				<li><a href="" id=''>�Ǹų���</a></li>
				<li><a href="" id=''>���ɻ�ǰ</a></li>
			</ul>
		</nav>
		
		<div id='main'>
			<div id='user_profile'>
				<div> <h3>����������</h3></div>
				<div id='profile_info'>
					<div id='profile_group'>
						<h4 id='grop_title'>�α�������</h4>
						<div id='unit'>
							<h5 id='title'>���̵�</h5>
							<input id='desc'type="text" autocomplete="off" placeholder="���̵�" readonly="readonly" id='desc'>
						</div>
						<div id='unit'>
							<h5 id='title'>��й�ȣ</h5>
							<input id='desc'type="password" autocomplete="off"  placeholder="********" readonly="readonly" id='desc'>
							<button>�����ϱ�</button>
						</div>
					</div>
					
					<div id='profile_group'>
					<form action="">
						<h4 id='grop_title'>��������</h4>
						<div id='unit'>
							<h5 id='title'>�̸�</h5>
							<input type="text" autocomplete="off" placeholder="ȫ�浿" id='desc'>
						</div>
						<div id='unit'>
							<h5 id='title'>��ȭ��ȣ</h5>
							<input type="text" autocomplete="off" placeholder="010-0000-000" readonly="readonly" id='desc'>
							<button>�����ϱ�</button>
						</div>
						<div id='unit'>
							<h5 id='title'>�ּ�</h5>
							<input type="text" autocomplete="off" placeholder="��⵵ ������ 8���ⱸ" id='desc'>
						</div>
						<button>�����ϱ�</button>
					</form>
					</div>
				</div>
			</div>
		</div>				
	</section>
	<div class="clear"></div>
	
	<footer> </footer>
</div>
</body>
</html>