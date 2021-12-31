<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div>
	<div>
		<h2>제목 : ${commuDetailVO.title}</h2>
		작성자 : ${commuDetailVO.nick}
	</div>
	<div>
		내용
		${commuDetailVO.content}
		<!--<c:if test="사진이 있으면">
			<img src = "">
		</c:if>-->
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>