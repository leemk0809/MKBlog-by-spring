<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ボード</title>

<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
	});
	
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/board/getBoardList";
	});
	
	$(document).ready(function(){
		var mode = '<c:out value="${mode}"/>';
		if(mode == 'edit'){
			$("#reg_id").prop('readonly', true);
			$("input:hidden[name='bid']").val(<c:out value="${boardContent.bid}"/>);
			$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			$("#reg_id").val('<c:out value="${boardContent.reg_id}"/>');
			$("#title").val('<c:out value="${boardContent.title}"/>');
			$("#content").val('<c:out value="${boardContent.content}"/>');
			$("#tag").val('<c:out value="${boardContent.tag}"/>');					
		}
	});
</script>
</head>
<body>
	<article>
		<div class = "container" role="main">
			<h2>ボードフォーム</h2>
			<form:form name="form" id="form" role="form" modelAttribute="BoardVO" 
				method="post" action="${pageContext.request.contextPath }/board/saveBoard">
				<form:hidden path="bid"/>
				<input type="hidden" name="mode"/>
				
				<div class= "mb-3">
					<label for="title">タイトル</label>
					<form:input path="title" id="title" class="form-contorl" placeholder="タイトルを入力してください。"/>
				</div>
				<div class= "mb-3">
					<label for="reg_id">作成者</label>
					<form:input path="reg_id" id="reg_id" class="form-contorl" placeholder="名前を入力してください。"/>
				</div>
				<div class= "mb-3">
					<label for="content">内容</label>
					<form:textarea path="content" id="content" class="form-contorl" rows="5" placeholder="内容を入力してください。"/>
				</div>
				<div class= "mb-3">
					<label for="tag">タッグ</label>
					<form:input path="tag" id="tag" class="form-contorl" placeholder="タッグを入力してください。"/>
				</div>
				<div>
					<button type="button" class="btn btn-sm btn-primary" id="btnSave">セーブ</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnList">戻る</button>
				</div>
			</form:form>
		</div>
	</article>
</body>
</html>