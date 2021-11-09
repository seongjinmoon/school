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
<ul> 
	<li><input type="checkbox" checked="checked" />CheckBox #1 - </li> 
	<li><input type="checkbox" />CheckBox #2</li> 
	<li><input type="checkbox" checked="checked" />CheckBox #3</li> 
</ul> 

<select multiple="multiple"> 
	<option>Option #1</option> 
	<option selected="selected">Option #2</option> 
	<option>Option #3</option> 
</select>

<script>
$(document).ready(function(){
	$(":checked").css("width", "50px"); 
	$(":selected").css("background", "red");
});
</script>
</body>
</html>