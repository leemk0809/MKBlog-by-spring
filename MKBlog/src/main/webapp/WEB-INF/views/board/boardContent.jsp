<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ボード</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
	
	function showReplyList(){
		var url = "${pageContext.request.contextPath}/board/getReplyList";
		var paramData = {"bid" : "${boardContent.bid}"};
		$.ajax({
			type: 'POST',
			url: url,
			data: paramData,
			dataType: 'json',
			success: function(result){
				var htmls = "";
				if(result.length < 1){
					htmls.push("コメントがありません。");
				} else {
					$(result).each(function(){
						htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';
	                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" ' +
	                		'xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"' +
	                		' focusable="false" role="img" aria-label="Placeholder:32x32">';
	                     htmls += '<title>プレイスホルダー</title>';
	                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
	                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
	                     htmls += '</svg>';
	                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
	                     htmls += '<span class="d-block">';
	                     htmls += '<strong class="text-gray-dark">' + this.reg_id + '</strong>';
	                     htmls += '<span style="padding-left: 7px; font-size: 9pt">';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.rid + ', \'' + 
	                    		 this.reg_id + '\', \'' + this.content + '\' )" style="padding-right:5px">修正</a>';
	                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rid + ')" >削除</a>';
	                     htmls += '</span>';
	                     htmls += '</span>';
	                     htmls += this.content;
	                     htmls += '</p>';
	                     htmls += '</div>';
					})
				}
				$("#replyList").html(htmls);
			}
		});
	}
	
	$(document).on('click', '#btnReplySave', function(){
		var replyContent = $('#content').val();
		var replyReg_id = $('#reg_id').val();
		var paramData = JSON.stringify({"content": replyContent
				, "reg_id": replyReg_id
				, "bid":'${boardContent.bid}'
		});
		var headers = {"Content-Type" : "application/json"
				, "X-HTTP-Method-Override" : "POST"};

		$.ajax({
			url: "${pageContext.request.contextPath}/board/saveReply",
			headers : headers,
			data : paramData,
			type : 'POST',
			dataType : 'text',
			success: function(result){
				console.log("success!!!");
				showReplyList();
				$('#content').val('');
				$('#reg_id').val('');
			},
			error: function(error){
				console.log("에러 : " + error);
			}
		});
	}); 
	
	$(document).ready(function(){
		showReplyList();
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
			<!-- Reply Form {s} -->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top:10px">
				<form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post">
					<form:hidden path="bid" id="bid"/>
					<div class="row">
						<div class="col-sm-10">
							<form:textarea path="content" id="content" class="form-control" row="3" 
							placeholder="コメントを入力してください。"></form:textarea>
						</div>
						<div class="col-sm-2">
							<form:input path="reg_id" class="form-control" row="3" placeholder="作成者"></form:input>
							<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" 
							style="width:100%;margin-top:10px" >作成</button>
						</div>
					</div>
				</form:form>
			</div>
			<!-- Reply Form {e} -->
			<!-- Reply List {s} -->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top:10px">
				<h6 class="border-bottom pb-2 mb-o">コメントリスト</h6>
				<div id="replyList"></div>
			</div>
			<!-- Reply List {e} -->
		</div>
	</article>
</body>
</html>