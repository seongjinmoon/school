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

</style>
</head>
<body>

<a href="https://www.naver.com" class="attr">attr속성 검색</a>
<br/>

<input type="text" name="txtName" id="txtName" />
<a href="#" class="txtName">val찾기</a>
<br/>

<div id="txt">text 글 가져오기~<p>ㅎㅎ</p></div>
<a href="#" class="txt">text찾기</a>
<a href="#" class="txt2">html찾기</a>
<script>
$(document).ready(function(){
	//속성 찾기
	$(".attr").click(function(){
		alert($(this).attr("href"));
		
		return false;
	});
	
	//val
	$(".txtName").click(function(){
		alert($("#txtName").val());
	});
	
	//text, html
	$(".txt").click(function(){
		alert($("#txt").text());
	});
	$(".txt2").click(function(){
		alert($("#txt").html());
	});
});
</script>
</body>
</html>