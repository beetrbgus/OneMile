<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="newContainer">
	<div id="wBoardWrap">
		<div class="wboard-wrap">
			<div class="wboard-detail-content">
				<div class="ui-header">
					<h2 data-middle-name="${parameter}" class="title">운영사항</h2>
					</div>
					<div class="ui-tabs LeadMakerShortcutLinkSection_linkGroup__2XM2N">
				<ul>
					<li><a href="${root}/notice/list/board" ${parameter == "board" ? "style='color:#00b2b2;'" : ""} >공지사항</a></li>
					<li><a href="${root}/notice/list/rule" ${parameter == "rule" ? "style='color:#00b2b2;'" : ""}>운영규칙</a></li>
					<li><a href="${root}/notice/list/faq" ${parameter == "faq" ? "style='color:#00b2b2;'" : ""}>자주하는질문</a></li>
					<li><a href="${root}/notice/contact" ${parameter == "contact" ? "style='color:#00b2b2;'" : ""}>1:1문의하기</a></li>
				</ul>
			</div>
				<div class="inner-contents">
					<img src="${root}/resources/image/contact.jpg">
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>