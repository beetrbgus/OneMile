<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
작성일 / 조회수 / 제목 / 작성자 <br>
<c:forEach var="commuVo" items="${listBoonsil}">
	${commuVo.regDate} / ${commuVo.hit} / ${commuVo.title} / ${commuVo.nick}<br>
</c:forEach>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>