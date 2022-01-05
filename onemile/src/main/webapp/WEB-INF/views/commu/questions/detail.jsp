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
						<em class="user-img" style="background-image:url(https://static.wadiz.kr/assets/icon/apple-touch-icon.png)"></em>
						<span class="user-info">${commuDetailVO.nick}
						<br>${commuDetailVO.regDate}</span>
					</div>
				</div>
				<div class="inner-contents">
					<p><img src="https://cdn.wadiz.kr/ft/images/green001/2021/1228/20211228100127501_120.jpg/wadiz/format/jpg/quality/80/optimize"class="fr-fic fr-dib">
					${commuDetailVO.content}
				</div>
			</div>
		</div>
		<div class="wboard-detail-bottom">
			<div class="wboard-detail-btn-wrap">
				<a class="wz button" href="http://localhost:8080/onemile/commu/questions/list?middleName=질문">목록으로 돌아가기</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>