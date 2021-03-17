<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>加入</title>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 

<!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"> 

<!-- common CSS --> 
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" > 
<style>
	body {
		padding : 0px
	} 
	#tile_body { 
		width:100%; 
	 	float:left; 
	} 
</style> 
<script> 
	$(document).on('click', '#btnSignup', function(e){ 
		e.preventDefault(); 
		$("#form").submit(); 
	}); 
	$(document).on('click', '#btnCancel', function(e){ 
		e.preventDefault(); 
		
		$('#uid').val(''); 
		$('#name').val(''); 
		$('#pwd1').val(''); 
		$('#pwd2').val(''); 
		$('#email').val(''); 
		location.href="${pageContext.request.contextPath}/"; 
	}); 
</script>
</head>
<body class="text-center">
	<article> 
		<div class="container col-md-6" role="main"> 
			<div class="card"> 
				<div class="card-header">レジスター</div> 
				<div class="card-body"> 
					<form:form name="form" id="form" class="form-signup" role="form" modelAttribute="userVO" method="post" 
						action="${pageContext.request.contextPath}/user/insertUser"> 
						<div class="form-group row"> 
							<label for="uid" class="col-md-3 col-form-label text-md-right">アイディ</label> 
							<div class="col-md-5">
								<form:input path="uid" id="uid" class="form-control" placeholder="アイディを入力してください。" /> 
							</div> 
						</div> 
						<div class="form-group row"> 
							<label for="name" class="col-md-3 col-form-label text-md-right">名前</label> 
							<div class="col-md-5"> 
								<form:input path="name" id="name" class="form-control" placeholder="名前を入力してください。" />
							</div> 
						</div> 
						<div class="form-group row"> 
							<label for="pwd" class="col-md-3 col-form-label text-md-right">パスワード</label> 
							<div class="col-md-5">
								<form:password path="pwd" id="pwd" class="form-control" placeholder="パスワードを入力してください。" /> 
							</div> 
						</div>
						<div class="form-group row"> 
							<label for="re_pwd" class="col-md-3 col-form-label text-md-right">パスワード確認</label> 
							<div class="col-md-5">
								<form:password path="re_pwd" id="re_pwd" class="form-control" placeholder="パスワードを入力してください。" /> 
							</div> 
						</div> 
						<div class="form-group row"> 
							<label for="email" class="col-md-3 col-form-label text-md-right">イーメール</label> 
							<div class="input-group col-md-7">
								<div class="input-group-prepend"> 
									<span class="input-group-text">@</span> 
								</div> 
								<form:input path="email" id="email" class="form-control" placeholder="イーメールを入力してください。" />
							</div> 
						</div> 
					</form:form>
				</div> 
			</div> 
			<div style="margin-top:10px"> 
				<button type="button" class="btn btn-sm btn-primary" id="btnSignup">加入</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnCancel">キャンセル</button> 
			</div> 
		</div> 
	</article>
</body>
</html>