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
<style>
a, b{display:block;width:100px;height:100px;border:1px solid #000;line-height:100px;text-align:center;float:left;margin-right:15px;}
</style>
</head>
<body>

<a href="#" id="id">id</a>
<a href="#" class="class">class</a>
<b>element</b>
<a href="https://www.naver.com">속성 셀렉터</a>

<script>
$(document).ready(function(){
	//id 셀렉터
	$("#id").click(function(){
		alert("Id : " + $(this).text());
		return false;
	});
	
	//class 셀렉터
	$(".class").click(function(){
		alert("class : " + $(this).text());
		return false;
	});
	
	//element 셀렉터
	$("b").click(function(){
		alert("element : " + $(this).text());
	});
	/*
	//All 셀렉터
	$("*").click(function(){
		alert("ALL");
	});
	*/
	
	//다중 셀렉터
	$("#id, .class, b").click(function(){
		alert("multiple : " + $(this).text());
	});
	
	//속성 셀렉터
	$("a[href='https://www.naver.com']").click(function(){
		alert("attribute : " + $(this).text());
		return false;
	});
	
});
</script>
</body>
</html>