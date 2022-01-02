<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
<form method="post" enctype="multipart/form-data">
	<input type="file" name="attach"> <input type="text"
		name="title" placeholder="공구의 제목을 입력해주세요."> 만료 기한 : <input
		type="date" min="2022-01-01" name="deadLine"> 가격 : <input
		type="number" name="price"> 수량 : <input type="number"
		name="stock"> 상품 이름 : <input type="text" name="pName">
	상품 설명 :
	<textarea name="descript" placeholder="상품 정보를 입력해주세요."></textarea>
	<input type="file" name="attach" multiple="multiple">
	<!--  지도 영역 -->
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
	</div>
	<input id="location" type="hidden" name="detailAddress">
	<input id="lat" type="hidden" name="lat">
	<input id="lng" type="hidden" name="lng">

	<p id="result"></p>

	<button type="submit">전송한다</button>
</form>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 1
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	infowindow = new kakao.maps.InfoWindow({
		zindex : 1
	}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다


	//지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var detailAddr = '<div>지번 주소 : ' + result[0].address.address_name
						+ '</div>';

				var content = '<div class="bAddr">'
						+ '<span class="title">법정동 주소정보</span>' + detailAddr
						+ '</div>';

				// 마커를 클릭한 위치에 표시합니다 
				marker.setPosition(mouseEvent.latLng);
				marker.setMap(map);

				// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				infowindow.setContent(content);
				infowindow.open(map, marker);
				
				console.log('mouseEvent.latLng     :' +mouseEvent.latLng);
				map.setCenter(mouseEvent.latLng); 
				console.log("marker.getPosition()    "+marker.getPosition());
				console.log("map.getCenter().la    "+map.getCenter().getLat());
				console.log("map.getCenter().ma    "+map.getCenter().getLng());
				
				document.getElementById('lat').value = map.getCenter().getLat();
				document.getElementById('lng').value = map.getCenter().getLng();
				
			}
		});
	});

	function searchAddrFromCoords(coords, callback) {
		// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>