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
<title>수업용 예약관리</title>
<link href="/css/common.css" rel="stylesheet" type="text/css" >
<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

<div style="margin-top:30px;">
	<h2>jQuery 시작 Selector</h2> 
	<p>jQuery에 대한 자세한 내용을 보려면 jquery.com 을 방문할 수 있다.</p> 
	<div> 
		<ul class="siteUrl">
			<li>Sqler : http://www.sqler.com</li> 
			<li>jQuery : http://jquery.com</li> 
			<li> 
				<ul> 
					<li>Blog : http://www.hows.kr</li> 
					<li>Community : http://www.hoons.kr</li> 
				</ul> 
			</li> 
			<li>Items</li> 
			<li>Items</li> 
			<li>Items</li> 
		</ul>
		<ul class="siteUrl2" style="margin-top:30px;"> 
			<li>Sqler : http://www.sqler.com</li> 
			<li>jQuery : http://jquery.com</li> 
			<li> 
				<ul> 
					<li>Blog : http://www.hows.kr</li> 
					<li>Community : http://www.hoons.kr</li> 
				</ul> 
			</li> 
			<li>Items</li> 
			<li>Items</li> 
			<li>Items</li> 
		</ul>
	</div>
</div>

<div style="margin-top:30px;">
	<div>div (doesn't match since before #prev)</div> 
	<span id="prev">span#prev</span> 
	<div>div sibling</div> 
	<div>
		div sibling 
		<div id="small">div niece</div> 
	</div> 
	<span>span sibling (not div)</span> 
	<div>div sibling</div>
</div>

<script>
$(document).ready(function(){
	//Attribute Starts형
	$("div[id^='content-']").css("background", "gray");
	
	//Attribute Contains형
	$("div[id*='-1']").css("background", "yellow");
	
	//자식요소 바로 하위 태그
	$("ul.siteUrl > li").css("border", "1px solid red");
	
	//자식요소 중 해당 태그 전체
	$("ul.siteUrl2 li").css("border", "1px solid blue");
	
	//next요소
	$("h2 + p").css("font-size", "20px");
	
	//형제요소
	$("#prev ~ div").css("border", "3px groove blue");
});
</script>
</body>
</html>