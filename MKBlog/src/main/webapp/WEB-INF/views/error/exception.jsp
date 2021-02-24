<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<article>
		<div class="container">
			<p>データの処理中問題が行いました。</p>
			<p>管理者に問い合わせてください。</p>
			<h3>${exception.getMessage() }</h3>
			<ul>
				<c:forEach items="${exception.getStackTrace() }" var="stack">
					<li><c:out value="${stack.toString() }"/></li>
				</c:forEach>
			</ul>
		</div>
	</article>
</body>
</html>