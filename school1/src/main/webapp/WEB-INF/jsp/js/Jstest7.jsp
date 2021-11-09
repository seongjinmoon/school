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
a.on{text-decoration:underline;font-weight:bold;color:blue;}
button.on{background:pink;}
</style>
</head>
<body>
<ul>
	<li><a href="#" class="on">메뉴 1</a></li>
	<li><a href="#">메뉴 2</a></li>
	<li><a href="#">메뉴 3</a></li>
	<li><a href="#">메뉴 4</a></li>
	<li><a href="#">메뉴 5</a></li>
</ul>

<button>toggle용</button>

<script>
$(document).ready(function(){
	$("a").click(function(){
		if($(this).hasClass("on")){
			alert("이미 선택 되어져있습니다.");
		}else{
			$("a").removeClass("on");
			$(this).addClass("on");
		}
		
		return false;
	});
	
	$("button").click(function(){
		$(this).toggleClass("on");
	});
});
</script>
</body>
</html>