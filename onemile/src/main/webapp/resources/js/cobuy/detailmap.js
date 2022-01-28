$(function(){
	console.log("lat    "+lat);
	console.log("lng    "+lng);
	var mapContainer = document.getElementById("map"), // 지도를 표시할 div 
	mapOption = { 
		center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
		level : 2 
	};
	//지도를 생성합니다.
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var markerPosition = new kakao.maps.LatLng(lat, lng); 
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition 
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map); 
});