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
<table> 
	<tr>
		<td>#1</td>
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
		<td>#11</td>
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
		<td>#21</td>
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
		<td>#31</td>
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

<script>
$(document).ready(function(){
	//first, last
	$("td:first").css("background", "red");
	
	//first-child, last-child
	$("td:last-child").css("background", "yellow");
	
	//nth
	//$("td:nth-child(2n+1)").css("background", "green");
});
</script>
</body>
</html>