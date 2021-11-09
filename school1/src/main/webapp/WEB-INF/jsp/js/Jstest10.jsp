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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>

</style>
</head>
<body>
<div class="left_box">
		<ul id="sortable">
			<li data-id="1">데이터 1</li>
			<li data-id="2">데이터 2</li>
			<li data-id="3">데이터 3</li>
			<li data-id="4">데이터 4</li>
			<li data-id="5">데이터 5</li>
		</ul>
	</div>
<script>
$(document).ready(function(){
	$("#sortable").sortable({
		update : function(event, ui){
			$("#sortable > li").each(function(i){
				$(this).data("id", i + 1);
				$(this).attr("data-id", i + 1);
			});
		}
	});
	$("#sortable").disableSelection();
});
</script>
</body>
</html>