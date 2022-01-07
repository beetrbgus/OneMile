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
						<c:if test="${commuDetailVO.imageNo} != null">
						<em class="user-img" style="background-image:url(${pageContext.request.contextPath}/image/download?imageNo=${commuDetailVO.imageNo}&folder=member)"></em>
						</c:if>
						<em class="user-img" style="background-image:url(https://via.placeholder.com/300x300?text=User)"></em>
						<span class="user-info">${commuDetailVO.nick}
						<br>${commuDetailVO.regDate}</span>
					</div>
				</div>
				<div id="map" style="width:100%;height:350px;"></div>
					<script>
					kakao.maps.load(function() {
						var lat = parseFloat('${commuDetailVO.lat}');
						var lng = parseFloat('${commuDetailVO.lng}');
						
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
					        center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
						
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
						// 마커가 표시될 위치입니다 
						var markerPosition  = new kakao.maps.LatLng(lat, lng); 
		
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
						    position: markerPosition
						});
		
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
		
						// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
						// marker.setMap(null);
				    });   
					</script>
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
