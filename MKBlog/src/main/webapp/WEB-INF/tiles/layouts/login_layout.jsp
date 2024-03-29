<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<!DOCTYPE html> 
<html lang="ja"> 
<head> 
<meta charset="utf-8">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 

<!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"> 

<!-- common CSS --> 
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" > 

<!-- Custom styles for this template --> 
<link rel="stylesheet" href="<c:url value='/resources/common/css/login.css'/>" > 

<style>
	body {
		padding : 0px
	} 
	#tile_body { 
		width:100%; 
	 	float:left; 
	} 
</style> 
</head> 
<body class="text-center"> 
	<div id="tile_body">
		<!-- insertAttribute -> tiles.xmlで、nameを調べて一致したらファイルを読んで来ます。 -->
		<tiles:insertAttribute name="tile_body" />
	</div> 
</body> 
</html>
