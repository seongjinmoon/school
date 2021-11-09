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
<a href="#" id="btn-popup">팝업 창 띄우기</a>
<script>
$(document).ready(function(){
	$("#btn-popup").click(function(){
		var wX = screen.availWidth;
		var wY = screen.availHeight;
		wY = (wY-38);

		var winIntro = window.open(
			"/js/jstest.do",
			"타이틀 작성",
			"width="+ wX + ", height="+ wY + ", scrollbars=no, resizable=yes"
		);

		winIntro.focus();
	});
});
</script>
</body>
</html>