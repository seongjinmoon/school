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
div { background : #FFF; padding:10px; margin:10px; } 
table { border:1px solid #AAA; width:100% }
tr{height:30px;} 
td { border:1px solid #AAA; }
</style>
</head>
<body>

<div style="margin-top:30px;"> 
	<table> 
		<tr>
			<td class="notSelect">#1</td>
			<td>#2</td>
			<td>#3</td>
			<td>#4</td>
			<td>#5</td> 
			<td>#6</td>
			<td>#7</td>
			<td>#8</td>
			<td>#9</td>
			<td>#10</td> 
		</tr> 
		<tr> 
			<td class="notSelect">#11</td>
			<td>#12</td>
			<td>#13</td>
			<td>#14</td>
			<td>#15</td> 
			<td>#16</td>
			<td>#17</td>
			<td>#18</td>
			<td>#19</td>
			<td>#20</td> 
		</tr> 
		<tr> 
			<td class="notSelect">#21</td>
			<td>#22</td>
			<td>#23</td>
			<td>#24</td>
			<td>#25</td> 
			<td>#26</td>
			<td>#27</td>
			<td>#28</td>
			<td>#29</td>
			<td>#30</td> 
		</tr> 
		<tr> 
			<td class="notSelect">#31</td>
			<td>#32</td>
			<td>#33</td>
			<td>#34</td>
			<td>#35</td> 
			<td>#36</td>
			<td>#37</td>
			<td>#38</td>
			<td>#39</td>
			<td>#40</td> 
		</tr> 
	</table> 
</div>

<script>
$(document).ready(function(){
	//요소 중 n번째
	$("tr:eq(0) > td:eq(7)").css("background", "#EEE");
	//gt이후 요소, lt이전 요소
	$("tr:eq(1) > td:gt(2)").css("background", "#EEE"); 
	//odd(홀수), even(짝수)
	$("tr:eq(2) > td:odd").css("background", "#EEE");
	//첫 번째 요소
	$("tr:eq(3) > td:first").css("background", "#EEE");
	//마지막 요소
	$("tr:eq(3) > td:last").css("background", "#EEE");
	/*
	//not요소
	$("td:not(.notSelect)").css("background", "#AAA");
	*/
	
});
</script>
</body>
</html>