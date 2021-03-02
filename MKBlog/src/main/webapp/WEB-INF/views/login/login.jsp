<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
</head>
<body>
<!-- login form {s} --> 
	<form:form class="form-signin" name="form" id="form" role="form"
		 modelAttribute="userVO" method="post" action="${pageContext.request.contextPath}/board/saveBoard"> 
	 	<div class="text-center mb-4"> 
	 		<h1 class="h3 mb-3 font-weight-normal">MK.COM</h1> 
	 	</div> 
	 	<div class="form-label-group"> 
	 		<form:input path="uid" id="uid" class="form-control" placeholder="User ID" required="" autofocus="" /> 
	 		<label for="uid" class="sr-only">ユーザーアイディー</label> 
	 	</div>
	 	<div class="form-label-group"> 
	 		<form:password path="pwd" id="pwd" class="form-control" placeholder="User Password" required="" /> 
	 		<label for="pwd" class="sr-only">ユーザーパスワード</label> 
	 	</div> 
	 	<button class="btn btn-lg btn-primary btn-block" type="submit">加入</button>
	 	<span style="font-size:11pt;">Sign up</span> 
	 	<p class="mt-5 mb-3 text-muted text-center">© 2021. MK. All rights reserved.</p> 
	 </form:form> 
<!-- login form {e} -->
</body>
</html>