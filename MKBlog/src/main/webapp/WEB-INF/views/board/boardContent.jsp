<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ボード</title>
<script>
	$(document).on('click','#btnList',function(e){
		location.href = "${pageContext.request.contextPath}/board/getBoardList";
	});
	
	$(document).on('click', '#btnUpdate', function(e){
		var url = "${pageContext.request.contextPath}/board/editForm";
		url = url + "?bid=" + ${boardContent.bid};
		url = url + "&mode=edit";
		
		location.href = url;
	});
	
	$(document).on('click', '#btnDelete', function(e){
		var url = "${pageContext.request.contextPath}/board/deleteBoard";
		url = url + "?bid=" + ${boardContent.bid};
		
		location.href = url;
	});
</script>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>内容</h2>
			
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><c:out value="${boardContent.title }"></c:out></div>
				<div class="board_info_box">
					<span class="board_auther"><c:out value="${boardContent.reg_id }"/></span>,
					<span class="board_date"><c:out value="${boardContent.reg_dt }"/></span>
				</div>
				<div class="board_content"><c:out value="${boardContent.content}"/></div>
				<div class="board_tag">TAG : <c:out value="${boardContent.tag}"/></div>				
			</div>
			
			<div style="margin-top:20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">修正</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">削除</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">戻る</button>
			</div>
		</div>
	</article>
</body>
</html>