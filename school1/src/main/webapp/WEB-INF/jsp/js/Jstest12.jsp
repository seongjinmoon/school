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
body{height:3000px;}
#click{display:block;width:100px;height:100px;background:#ff0000;margin:0 auto;}
#content{width:1000px;height:1000px;background:#000;margin: 3000px auto 0;}
</style>
</head>
<body>
<a href="#content" id="click">Click</a>
<div id="content"> </div>
<script>
$(document).ready(function(){
	$('a[href=#content]').click(function(){
        $('html, body').animate({scrollTop:3200}, 'slow');
        return false;
    });
});
</script>
</body>
</html>