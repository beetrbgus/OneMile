<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
#map {
	width:700px;
	height:500px;
	}
.page-container {
	max-width: 700px;
	margin: auto;
	padding: 56px 0;
	overflow-x: inherit;
}
.post-title {
	min-height: 43px;
	height: 43px;
	font-weight: 700;
	font-size: 32px;
	overflow: hidden
}

.post-content {
	font-size: 22px;
}
textarea {
	width: 100%;
	padding: 0;
	margin: 0 -10px 4px;
	border: 0;
	border-radius: 0;
	resize: none;
}
﻿select::-ms-expand { 
	display: none;
}
.select {
  -o-appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
.file-choose{
	width:100%;
}
.category{
	width:100%;
	font-size:22px;
	padding-top:0.4rem;
}
.myButton {
	float:right;
	margin-top:10px;
	border-color: #00c4c4;
    background-color: #00c4c4;
    color: #fff;
    padding: 9px 24px;
    line-height: 1.75;
    font-size: 16px;
}
.myButton:hover {
	background-color:#dde2e6;
}
.form-input {
	width:500px;
	font-size:20px;
	margin-top:1rem;
	margin-bottom:1rem;
}
.label{
	font-size:22px;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=229c9e937f7dfe922976a86a9a2b723b&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script>
	$(function() {
	
		//지도 생성 준비 코드
		var container = document.querySelector("#map");
		var options = {
			center : new kakao.maps.LatLng(37.5339851357212, 126.897094049199),
			level : 4
		};

		//지도 생성 코드
		var map = new kakao.maps.Map(container, options);
		$(".search-btn").click(
				function() {
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다

					geocoder.addressSearch($("input[name=keyword]").val(),
							function(result, status) {

								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
				});
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';
					detailAddr += '<div>지번 주소 : '
							+ result[0].address.address_name + '</div>';

					var content = '<div class="bAddr">'
							+ '<span class="title">법정동 주소정보</span>'
							+ detailAddr + '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
					$("input[name=fgLocation]").val(
							result[0].address.address_name);
					var address = $("input[name=fgLocation]").val();

					//2. 카카오 장소변환 샘플 코드를 복사 후 일부 수정
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(address, function(result, status) {
						var coords = new kakao.maps.LatLng(result[0].y,
								result[0].x);

						$("input[name=fgLatitude]").val(result[0].y);
						$("input[name=fgLongitude]").val(result[0].x);

					});
				}
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);

		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				
			}
		}
	});
</script>
<div class="page-container">
	<div class="ui-header">
		<h2 class="title">커뮤니티</h2>
	</div>
	<form action="write" method="post" enctype="multipart/form-data">
		<select name="middleName" class="category">
			<option value="" class="label category">카테고리 선택</option>
			<option value="맛집" class="label category">동네맛집</option>
			<option value="사건" class="label category">동네사건/사고</option>
			<option value="얌얌" class="label category">얌세권</option>
		</select>
		<textarea rows="1" maxlength="100" name="title" class="post-title"
			placeholder="제목을 입력하세요."></textarea>
		<div id="map"></div>
		<input class="form-input" type="text" name="fgLocation" readonly placeholder="참조할 위치를 클릭하세요."><br>
		<label class="label">상세주소 : </label><input class="form-input" type="text" name="detailAddress" placeholder="상세주소를 입력하세요.">
		<input type="hidden" name="lat">
		<input type="hidden" name="lng">
		<textarea cols="100" rows="20" name="content" class="post-content"
		placeholder="내용을 입력하세요."></textarea>
		<input type="file" name="attach" class="file-choose">
		<input type="submit" value="등록하기" class="myButton">
	</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>