$(function() {

    // 지도 생성 준비 코드
    var container = document.querySelector("#map");
    var options = {
        center : new kakao.maps.LatLng(37.5339851357212, 126.897094049199),
        level : 4
    };

    // 지도 생성 코드
    var map = new kakao.maps.Map(container, options);

    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {

        var lat = position.coords.latitude, // 위도
        lon = position.coords.longitude; // 경도

        });
    }else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        message = 'geolocation을 사용할수 없어요..'

        displayMarker(message);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(message) {

        var iwContent = message; // 인포윈도우에 표시할 내용
        iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map);

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
    }

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({
        zindex : 1
    }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

    // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);

    // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(
        map,'click', function(mouseEvent) {
            searchDetailAddrFromCoords(
            mouseEvent.latLng, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                   var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
                   + result[0].road_address.address_name
                   + '</div>'
                   : '';
                   detailAddr += '<div>지번 주소 : '
                   + result[0].address.address_name
                   + '</div>';
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
                    var address = $(
                    "input[name=fgLocation]").val();
                    // 2. 카카오 장소변환 샘플 코드를 복사 후 일부 수정
                    // 주소-좌표 변환 객체를 생성합니다
                    var geocoder = new kakao.maps.services.Geocoder();

                    // 주소로 좌표를 검색합니다
                    geocoder.addressSearch(
                        address,function(result, status) {
                        	var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
                        	$("input[name=lat]").val(result[0].y);
                        	$("input[name=lng]").val(result[0].x);
                        	
                        });
            }   
        });
    });

    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', function() {
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    });

    // 좌표로 행정동 주소 정보를 요청합니다
    function searchAddrFromCoords(coords, callback) {
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
    }
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    function searchDetailAddrFromCoords(coords, callback) {
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }

    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
    function displayCenterInfo(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');
        }
    }
});