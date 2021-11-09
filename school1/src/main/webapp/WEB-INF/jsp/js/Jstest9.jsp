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
<a href="#" id="submit">전송</a>
<input type="checkbox" id="all_check"/>전체선택여부
<ul>
	
	<li><input type="checkbox" name="check"/>1</li>
	<li><input type="checkbox" name="check"/>2</a></li>
	<li><input type="checkbox" name="check"/>3</a></li>
	<li><input type="checkbox" name="check"/>4</a></li>
	<li><input type="checkbox" name="check"/>5</a></li>
</ul>
<script>
$(document).ready(function(){
	$("#all_check").click(function(){
		if($(this).prop("checked")){
			$("input[name=check]").prop("checked",true);
		}else{
			$("input[name=check]").prop("checked",false);
		}
	});

	$("#submit").click(function(){
		if($("input[name=check]:checked").length == 0){
			alert("선택안하냐?");
			return false;
		}else{
			alert("올~ 선택하긴했네?");
		}
	});
});
</script>
</body>
</html>