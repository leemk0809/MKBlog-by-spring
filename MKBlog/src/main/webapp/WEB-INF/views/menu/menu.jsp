<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ include file="/WEB-INF/views/layout/header.jsp"%> 

<c:url var="saveURL" value="/restMenu/saveMenu"></c:url> 
<c:url var="deleteURL" value="/restMenu/deleteMenu"></c:url> 
<c:url var="updateURL" value="/restMenu/updateMenu"></c:url> 
<c:url var="getMenuListURL" value="/restMenu/getMenuList"></c:url> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>メニューリスト</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script> 
	$(function(){ 
		fn_showList(); 
	}); 
	
	function fn_showList(){
		var paramData = {}; 
		$.ajax({ 
			url : "${getMenuListURL}", 
			type : "POST", 
			dataType : "json", 
			data : paramData, 
			success : function(result){ 
				console.log(result); 
				if (result.status == "OK"){ 
					if ( result.menuList.length > 0 ) { 
						var list = result.menuList; 
						var htmls = ""; 
						result.menuList.forEach(function(e) { 
							htmls += '<tr>'; 
							htmls += '<td>' + e.mid + '</td>'; 
							htmls += '<td>';
							//e.codeで修正します。
							htmls += '<a href="#" onClick="fn_menuInfo(' + e.mid + ',\'' + e.code 
									+'\',\'' + e.codename + '\', ' + e.sort_num + ', \'' + e.comment + '\')" >';
							htmls += e.code 
							htmls += '</td>'; 
							htmls += '<td>' + e.codename + '</td>'; 
							htmls += '<td>' + e.sort_num + '</td>'; 
							htmls += '<td>' + e.comment + '</td>'; 
							htmls += '</tr>'; 
						}); 
					} 
				} else { 
					console.log("getMenuList - Fail"); 
				} 
				$('#menuList').html(htmls); 
			} 
		});
	}
	
	function fn_menuInfo(mid, code, codename, sort_num, comment){
			$("#mid").val(mid);
			$("#code").val(code);
			$("#codename").val(codename);
			$("#sort_num").val(sort_num);
			$("#comment").val(comment);
			
			$("#code").attr("readonly", true);
	}
	
	$(document).on('click', '#btnSave', function(e){ 
		e.preventDefault(); 
		var url = "${saveURL}"; 
		
		if($("#mid").val() != 0){
			url = "${updateURL}";	
		}
		
		if($("#code").val() == ""){
			alert("コードを確認してください"); 
			return; 
		}
		
		var paramData = { 
			"code" : $("#code").val() , 
			"codename" : $("#codename").val() , 
			"sort_num" : $("#sort_num").val() , 
			"comment" : $("#comment").val() 
		}; 
		$.ajax({ 
			url : url , 
			type : "POST" , 
			dataType : "json" , 
			data : paramData , 
			success : function(result){ 
				fn_showList(); 
				$("#btnInit").trigger("click");
			} 
		}); 
	});
	
	$(document).on('click','#btnInit', function(e){
		$('#mid').val(0);
		$('#code').val('');
		$('#codename').val('');
		$('#sort_num').val('');
		$('#comment').val('');
		$('#code').attr("readonly", false);
	});
	$(document).on('click', '#btnDelete', function(e){ 
		e.preventDefault(); 
		if ($("#code").val() == "") { 
			alert("コードを確認してください"); 
			return; 
		} 
		var url = "${deleteURL}"; 
		var paramData = { "code" : $("#code").val() }; 
		$.ajax({ 
			url : url , 
			type : "POST" , 
			dataType : "json" , 
			data : paramData , 
			success : function(result){ 
				fn_showList(); 
				//削除後、内容リセット 
				$("#btnInit").trigger("click");
			} 
		}); 
	});

</script>
<style> 
	#paginationBox{ padding : 10px 0px; } 
</style> 
</head>
<body> 
	<article> 
		<div class="container"> 
			<!-- Menu form {s} -->
			<h4 class="mb-3">メニュー情報</h4> 
			<div> 
				<form:form name="form" id="form" role="form" modelAttribute="menuVO" method="post" 
					action="${pageContext.request.contextPath}/menu/saveMenu"> 
					<form:hidden path="mid" id="mid"/> 
					<div class="row"> 
						<div class="col-md-4 mb-3"> 
							<label for="code">コード</label> 
							<form:input path="code" id="code" class="form-control" placeholder="" value="" required="" /> 
							<div class="invalid-feedback">正しいコードが必要です。</div> 
						</div>
						 <div class="col-md-5 mb-3"> 
						 	<label for="codename">コードネーム</label> 
						 	<form:input path="codename" class="form-control" id="codename" placeholder="" value="" required="" /> 
						 	<div class="invalid-feedback">正しいコードネームが必要です。</div> 
						 </div>
						 <div class="col-md-3 mb-3"> 
						 	<label for="sort_num">整列</label> 
							<form:input path="sort_num" class="form-control" id="sort_num" placeholder="" required="" />
						 </div> 
					</div> 
					<div class="row"> 
						<div class="col-md-12 mb-3"> 
							<label for="comment">コメント</label> 
							<form:input path="comment" class="form-control" id="comment" placeholder="" value="" required="" /> 
						</div> 
					</div>
				</form:form>
			 </div>
			 <!-- Menu form {e} -->
			 <div> 
			 	<button type="button" class="btn btn-sm btn-primary" id="btnSave">セーブ</button> 
			 	<button type="button" class="btn btn-sm btn-primary" id="btnDelete">削除</button>
			 	<button type="button" class="btn btn-sm btn-primary" id="btnInit">リセット</button> 
			 </div> 
			 <h4 class="mb-3" style="padding-top:15px">メニューリスト</h4> 
			 <!-- List{s} --> 
			 <div class="table-responsive"> 
			 	<table class="table table-striped table-sm"> 
			 		<colgroup>
			 			 <col style="width:10%;" /> 
			 			 <col style="width:15%;" /> 
			 			 <col style="width:15%;" /> 
			 			 <col style="width:10%;" /> 
			 			 <col style="width:auto;" /> 
			 		</colgroup> 
			 		<thead> 
			 			<tr> 
			 				<th>メニューアイディー</th> 
			 				<th>コード</th> 
			 				<th>コードネーム</th> 
			 				<th>整列</th> 
			 				<th>コメント</th> 
			 			</tr> 
			 		</thead> 
			 		<tbody id="menuList"> </tbody> 
			 	</table> 
			 </div>
			  <!-- List{e} --> 
		</div>
	</article>
</body>
</html>
