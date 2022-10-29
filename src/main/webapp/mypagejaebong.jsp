<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- �ܺ��� css���� �����ϱ� -->
<!-- <link rel="stylesheet" type="text/css" href="css/mypage2.css"> -->
<!-- daum ���θ��ּ� ã�� api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
	//��� ���� üũ ���Խ�
	let empJ = /\s/g;
	// ��й�ȣ ���Խ�
	let pwJ = /^[A-Za-z0-9]{4,12}$/;
	// �̸��� �˻� ���Խ�
	let mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// �޴��� ��ȣ ���Խ�
	let phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	//�����ȣ ã�� ��ư Ŭ���� �߻� �̺�Ʈ
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

				// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
				// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
				let fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
				let extraRoadAddr = ''; // ���θ� ������ �ּ� ����

				// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
				// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
				if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
				console.log(data.zonecode);
				console.log(fullRoadAddr);
				/*      let a = console.log(data.zonecode);
				   let b = console.log(fullRoadAddr);
				   
				   if(a == null || b = null){
				      alert("�ּҸ� Ȯ���ϼ���.");
				      return false;
				   }   */

				$("[name=mem_oaddress]").val(data.zonecode);
				$("[name=mem_address]").val(fullRoadAddr);

				document.getElementById('mem_oaddress').value = data.zonecode; //5�ڸ� �������ȣ ���
				document.getElementById('mem_address').value = fullRoadAddr;

				//document.getElementById('userAddr').value = data.jibunAddress; 
			}
		}).open();
	}
</script>
</head>
<body>
	<div id='wrap'>

		<div id='header'>
			<div id='header-top'>
				<div class="container">
					<div id='header-top-menu'>
						<a href="">����������</a> <a href="">���ɻ�ǰ</a> <a href="">�α���</a>
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
		<!-- header -->
		<div class="clear"></div>

		<div id='contents'>
			<div class="container">
				<div class="tab">
					<button class="tablinks" onclick="openCity(event, 'profile-info')"
						id="defaultOpen">����������</button>
					<button class="tablinks" onclick="openCity(event, 'profile-alarm')">�˶�</button>
					<button class="tablinks" onclick="openCity(event, 'shopping-buy')">���ų���</button>
					<button class="tablinks" onclick="openCity(event, 'shopping-sell')">�Ǹų���</button>
					<button class="tablinks"
						onclick="openCity(event, 'shopping-wishList')">���ɻ�ǰ</button>

				</div>

				<div id="profile-info" class="tabcontent">
					<h3>����������</h3>
					<div id='profile_info'>
						<div id='profile_group'>
							<h4 id='grop_title'>�α�������</h4>
							<div class="form-group">
								<fieldset disabled="">
									<label class="form-label" for="disabledInput">���̵�</label> <input
										class="form-control" id="userId" type="text"
										placeholder="Disabled input here..." disabled=""
										readonly="readonly">
								</fieldset>
							</div>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">�̸�</label>
										<input class="form-control" id="userName" type="text"
											placeholder="Readonly input here..." readonly="readonly" />
									</fieldset>
								</div>
						</div>

						<div id='profile_group'>
							<form name="userDto" method="post" id="userDto">
								<h4 id='grop_title'>��������</h4>
							<div class="form-group">
								<fieldset>
									<label class="form-label mt-4" for="readOnlyInput">��й�ȣ</label>
									<input class="form-control" id="userPwd" type="text"
										placeholder="Readonly input here..." readonly="readonly">
								</fieldset>
							</div>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">��ȭ��ȣ</label>
										<input class="form-control" id="userPhone" type="text"
											placeholder="Readonly input here..." readonly="readonly" />
									</fieldset>
									<div class="form-group">
										<fieldset>
											<label class="form-label mt-4" for="readOnlyInput">�ּ�</label>
											<input class="form-control" id="userAddr" type="text"
												placeholder="Readonly input here..." readonly="readonly" />
										</fieldset>
									</div>
									<fieldset>
										<div class="form-group">
											<input class="form-control"
												style="width: 40%; display: inline;" placeholder="�����ȣ" na
												me="mem_oaddress" id="mem_oaddress" type="text"
												readonly="readonly">
											<button type="button" class="btn btn-default"
												onclick="execPostCode();">
												<i class="fa fa-search"></i> �����ȣ ã��
											</button>
										</div>
									</fieldset>
									<fieldset>
										<div class="form-group">
											<input class="form-control" style="top: 5px;"
												placeholder="���θ� �ּ�" name="mem_address" id="mem_address"
												type="text" readonly="readonly" />
										</div>
									</fieldset>
								</div>
								<div class="form-group">
									<fieldset>
										<label class="form-label mt-4" for="readOnlyInput">�̸���</label>
										<input class="form-control" id="userEmail" type="text"
											placeholder="Readonly input here..." readonly="readonly" />
									</fieldset>
								</div>
								<input type="hidden" name="key" value="customer"> <input
									type="hidden" name="methodName" value="updateUserInfo">
								<input type="button" value="�����ϱ�" id="userUpdate">
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
						<li class="nav-item" role="presentation"><a class="nav-link"
							data-bs-toggle="tab" href="#home" aria-selected="false"
							role="tab" tabindex="-1">���ų���</a></li>
						<li class="nav-item" role="presentation"><a
							class="nav-link active" data-bs-toggle="tab" href="#profile"
							aria-selected="true" role="tab">������</a></li>


					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="home" role="tabpanel">
							<h3>���ų���</h3>
							<table>
								<tr>
									<th>��ǰ��</th>
									<th>�귣���</th>
									<th>�������</th>
									<th>�ŷ���</th>
									<th>�ŷ�����</th>
								</tr>
							</table>
						</div>
						<div class="tab-pane fade active show" id="profile"
							role="tabpanel">
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
						<li class="nav-item" role="presentation"><a class="nav-link"
							data-bs-toggle="tab" href="#home" aria-selected="false"
							role="tab" tabindex="-1">Home</a></li>
						<li class="nav-item" role="presentation"><a
							class="nav-link active" data-bs-toggle="tab" href="#profile"
							aria-selected="true" role="tab">Profile00</a></li>
						<li class="nav-item" role="presentation"><a
							class="nav-link active" data-bs-toggle="tab" href="#profile"
							aria-selected="true" role="tab">Profile99</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="home" role="tabpanel">
							<p>1Raw denim you probably haven't heard of them jean shorts
								Austin. Nesciunt tofu stumptown aliqua, retro synth master
								cleanse. Mustache cliche tempor, williamsburg carles vegan
								helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher
								synth. Cosby sweater eu banh mi, qui irure terry richardson ex
								squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis
								cardigan american apparel, butcher voluptate nisi qui.</p>
						</div>
						<div class="tab-pane fade active show" id="profile"
							role="tabpanel">
							<p>2Food truck fixie locavore, accusamus mcsweeney's marfa
								nulla single-origin coffee squid. Exercitation +1 labore velit,
								blog sartorial PBR leggings next level wes anderson artisan four
								loko farm-to-table craft beer twee. Qui photo booth letterpress,
								commodo enim craft beer mlkshk aliquip jean shorts ullamco ad
								vinyl cillum PBR. Homo nostrud organic, assumenda labore
								aesthetic magna delectus mollit.</p>
						</div>
						<div class="tab-pane fade active show" id="profile"
							role="tabpanel">
							<p>3Food truck fixie locavore, accusamus mcsweeney's marfa
								nulla single-origin coffee squid. Exercitation +1 labore velit,
								blog sartorial PBR leggings next level wes anderson artisan four
								loko farm-to-table craft beer twee. Qui photo booth letterpress,
								commodo enim craft beer mlkshk aliquip jean shorts ullamco ad
								vinyl cillum PBR. Homo nostrud organic, assumenda labore
								aesthetic magna delectus mollit.</p>
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
										<img alt="��ǰ�̹����Դϴ�." src="" id='product'>
									</div>
									<div id='like'>
										<img src="img/heart.svg" id='like_img'>
									</div>
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
										<img alt="��ǰ�̹����Դϴ�." src="" id='product'>
									</div>
									<div id='like'>
										<img src="img/heart.svg" id='like_img'>
									</div>
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
										<img alt="��ǰ�̹����Դϴ�." src="" id='product'>
									</div>
									<div id='like'>
										<img src="img/heart.svg" id='like_img'>
									</div>
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
										<img alt="��ǰ�̹����Դϴ�." src="" id='product'>
									</div>
									<div id='like'>
										<img src="img/heart.svg" id='like_img'>
									</div>
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
										<img alt="��ǰ�̹����Դϴ�." src="" id='product'>
									</div>
									<div id='like'>
										<img src="img/heart.svg" id='like_img'>
									</div>
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
										<img alt="��ǰ�̹����Դϴ�." src="" id='product'>
									</div>
									<div id='like'>
										<img src="img/heart.svg" id='like_img'>
									</div>
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
										<img alt="��ǰ�̹����Դϴ�." src="" id='product'>
									</div>
									<div id='like'>
										<img src="img/heart.svg" id='like_img'>
									</div>
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
										<img alt="��ǰ�̹����Դϴ�." src="" id='product'>
									</div>
									<div id='like'>
										<img src="img/heart.svg" id='like_img'>
									</div>
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
										<img alt="��ǰ�̹����Դϴ�." src="" id='product'>
									</div>
									<div id='like'>
										<img src="img/heart.svg" id='like_img'>
									</div>
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

			</div>
			<!-- container -->
		</div>
		<!-- contents -->


		<div id='footer'>
			<div class="container"></div>
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
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		document.getElementById("defaultOpen").click();

		$(function() {
			function selectUser() {
				$.ajax({
					url : "ajax", //������û�ּ�
					type : "post", //��û���(method��� : get | post | put | delete )
					dataType : "json", //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data : {
						key : "userAjax",
						methodName : "selectUser",
					},
					success : function(userDto) {

						let id = userDto.userId;
						let pwd = userDto.userPwd;
						let name = userDto.userName;
						let phone = userDto.userPhone;
						let addr = userDto.userAddr;
						let email = userDto.userEmail;

						$("#userId").val(id);
						$("#userPwd").val(pwd);
						$("#userName").val(name);
						$("#userPhone").val(phone);
						$("#userAddr").val(addr);
						$("#userEmail").val(email);

					}, //���������� ������ �Լ� 
					error : function(err) {
						alert(err + "���� �߻�");
					} //���������� ������ �Լ� 
				})// ���۽� 
			}// ����  ��

			$("#userUpdate").click(function() {

				if ($(this).val() == "�����ϱ�") {
					$("[name=methodName]").val("selectUser");
					$("#userPwd").removeAttr("readonly");
					$("#userPwd").focus();
					$("#userPhone").removeAttr("readonly");
					$("#userAddr").removeAttr("readonly");
					$("#userEmail").removeAttr("readonly");

					$(this).val("�����Ϸ�")

				}
				

			});

			/*$(document).on("click", function updateUserInfo() {

				$("userPwd").val();
				$("userPhone").val();
				$("userAddr").val();
				$("userEmail").val();

				$("#userUpdate").val("�����ϱ�")

				$.ajax({
					url : "ajax", //������û�ּ�
					type : "post", //��û���(method��� : get | post | put | delete )
					dataType : "text", //������ ������ ������(����)Ÿ��(text | html | xml | json )
					data : {
						key : "userAjax",
						methodName : "updateUserInfo",
					},
					error : function(err) {
						alert(err + "���� �߻�");
					}
				})// ���۽� 
			});//  ��*/

			selectUser();
		});//��
	<%session.setAttribute("userId", "id");%>
		
	</script>
</body>
</html>