<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 기본 URL --%>
<c:url var="_BASE_PARAM" value="">
	<c:param name="menuNo" value="50"/>
  	<c:if test="${not empty searchVO.searchCondition}"><c:param name="searchCondition" value="${searchVO.searchCondition}" /></c:if>
  	<c:if test="${not empty searchVO.searchKeyword}"><c:param name="searchKeyword" value="${searchVO.searchKeyword}" /></c:if>
</c:url>

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

<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header_mainsize"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" /></div>        
    <!-- //header 끝 --> 
    
    <!-- container 시작 -->
    <div id="container">
        <!-- 좌측메뉴 시작 -->
        <div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
        <!-- //좌측메뉴 끝 -->
        
        <!-- 현재위치 네비게이션 시작 -->
        <div id="content">
           	<div class="container">
				<div id="contents">
					
				    <%-- 목록영역 --%>
					<div id="bbs_wrap">
						<div class="total">
							총 예약 수 
							<strong><c:out value="${fn:length(resultList)}"/></strong>건
						</div>	
				        <div class="bss_list">
				            <table class="list_table">
				              <thead>
				                  <tr>
				                      <th class="num" scope="col">번호</th>
				                      <th scope="col">신청자명</th>
				                      <th scope="col">신청일</th>
				                      <th scope="col">신청상태</th>
				                      <th scope="col">관리</th>
				                  </tr>
				              </thead>
				              <tbody>
				                  <c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<td class="num"><c:out value="${fn:length(resultList) - (status.index)}" /></td>
						                    <td>
						                    	<c:url var="viewUrl" value="/admin/rsv/rsvApplySelect.do${_BASE_PARAM}">
													<c:param name="resveId" value="${result.resveId}"/>
													<c:param name="reqstId" value="${result.reqstId}"/>
													<c:param name="pageIndex" value="${searchVO.pageIndex}" />
												</c:url>
						                    	<a href="${viewUrl}">
						                    		<c:out value="${result.chargerNm}"/>(<c:out value="${result.frstRegisterId}"/>)
						                    	</a>
						                    </td>
						                    <td><fmt:formatDate value="${result.frstRegistPnttm}"  pattern="yyyy-MM-dd"/></td>
						                    <td>
						                    	<c:choose>
						                    		<c:when test="${result.confmSeCode eq 'R'}">신청 접수 중</c:when>
						                    		<c:when test="${result.confmSeCode eq 'O'}">신청 승인</c:when>
						                    		<c:when test="${result.confmSeCode eq 'X'}">신청 반려</c:when>
						                    	</c:choose>
						                    </td>
						                    <td>
												<c:url var="deleteUrl" value="/admin/rsv/rsvApplyDelete.do${_BASE_PARAM}">
													<c:param name="resveId" value="${result.resveId}"/>
													<c:param name="reqstId" value="${result.reqstId}"/>
													<c:param name="pageIndex" value="${searchVO.pageIndex}" />
												</c:url>
												<a href="${deleteUrl}" class="btn spot btn-del">삭제</a>
						                    </td>
										</tr>
								  </c:forEach>
								  
								  <%-- 글이 없을 경우 --%>
								  <c:if test="${fn:length(resultList) == 0}">
							    	<tr class="empty"><td colspan="5">신청자가 없습니다.</td></tr>
							    </c:if>
				                </tbody>
				            </table>
				        </div>
					    <div class="btn-cont ar">
							<c:url var="listUrl" value="/admin/rsv/rsvSelectList.do${_BASE_PARAM}"/>
						    <a href="${listUrl}" class="btn">목록</a>
						</div>
					</div>
				</div>
			</div>
           </div>
           <!-- //현재위치 네비게이션 끝 -->
	</div>
	<!-- //container 끝 -->
	
	
	<!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>

<script>
<c:if test="${not empty message}">
	alert("${message}");
</c:if>

//예약 글 삭제
$(".btn-del").click(function(){
	if(!confirm("삭제하시겠습니까?")){
		return false;
	}
});
</script>

</body>
</html>