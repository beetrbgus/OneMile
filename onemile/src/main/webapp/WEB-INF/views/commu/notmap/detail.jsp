<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="newContainer">
	<div id="wBoardWrap">
		<div class="wboard-wrap">
			<div class="wboard-detail-content">
				<div class="article-top">
					<p class="title">${commuDetailVO.title}</p>
					<div class="info">
						<em class="user-img" style="background-image:url(${pageContext.request.contextPath}/image/download?imageNo=${commuDetailVO.memberNo}&folder=member)"></em>
						<span class="user-info">${commuDetailVO.nick}
						<br>${commuDetailVO.regDate}</span>
					</div>
				</div>
				<div class="inner-contents">
					<c:forEach var="imageNo" items="${imageNoList}">
					<p><img src="${pageContext.request.contextPath}/image/download?imageNo=${imageNo.imageNo}&folder=commu"class="fr-fic fr-dib">
					</p>
					</c:forEach>
					${commuDetailVO.content}
				</div>
			</div>
		</div>
		<div class="wboard-detail-bottom">
			<div class="wboard-detail-btn-wrap">
				<a class="wz button" href="http://localhost:8080/onemile/commu/notmap/list">목록으로 돌아가기</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>