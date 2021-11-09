<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Language" content="ko" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>스크립트 공부</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
div,pre { background : #FFF; padding:10px; margin:10px; } 
table { border:1px solid #AAA; } 
td { border:1px solid #AAA; width:25px; height:25px; }
</style>
</head>
<body>
<div> 
	<p>this is 1st p</p> 
</div> 
<div> 
	<p>this is 2nd p</p> 
</div> 
<div class="myClass">
	<ul> 
		<li class="siblings">list item 1</li> 
		<li>list item 2</li> 
		<li>list item 3</li> 
		<li>list item 4</li> 
		<li>list item 5</li> 
	</ul>
	<p>this is 3rd p</p> 
</div>

<script>
$(document).ready(function(){
	//find
	$("div").find("p").css("border", "1px solid red");
	
	//siblings
	$(".siblings").siblings("li").css("background", "gray");
});
</script>
</body>
</html>