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
<form id="cobuyform" method="post" enctype="multipart/form-data">
	<input type="file" name="attach" required accept="image/jpeg, image/png, image/jpg">
	<input type="text" name="title" placeholder="공구의 제목을 입력해주세요." required>
	<select name="middleName" >
		<option value="패션·잡화">패션·잡화</option>
		<option value="뷰티">뷰티</option>
		<option value="푸드">푸드</option>
		<option value="홈·리빙">홈·리빙</option>
		<option value="여행·레저">여행·레저</option>
		<option value="패션·잡화">패션·잡화</option>
		<option value="스포츠·모빌리티">스포츠·모빌리티</option>
		<option value="베이비·키즈">베이비·키즈</option>
		<option value="반려동물">반려동물</option>
	</select>
	<br> 
		만료 기한 : <input type="date" id="deadLine" name="deadLine" required>
		가격 : <input type="number" name="price" min="100" required> 
		수량 : <input type="number" name="stock" min="0" required>
	<br> 
		상품 이름 : <input type="text" name="pName" required>
		상품 설명 : <textarea name="descript" placeholder="상품 정보를 입력해주세요." required></textarea>
		이미지 : <input type="file" name="attach" multiple="multiple">
	<!--  지도 영역 -->

	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
	</div>
	<input id="location" type="hidden" name="detailAddress" required>
	<input id="lat" type="hidden" name="lat" required>
	<input id="lng" type="hidden" name="lng" required>

	<p id="result"></p>

	<button id="submitBtn" type="button">전송한다</button>
</form>
<script>
//날짜 검사
function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + "-" + month + "-" + day;
}
let deadLine = $("#deadLine"); 
deadLine.attr("min",getToday);
$(function(){

	//글 제목 검사.
	function titlevali(){ 
	    let title = $("input[name=title]").val();
	    console.log("title   "+title);
	    if(title.length==0){
	    	return alert("제목을 입력하세요.");
	    }else if(title.length>50){
	    	return alert("제목의 길이는 50글자 내외입니다.");
	    }
	    return true;
	} 
	//글 카테고리 검사.
	function middleNamevali(){
	    let middleName = $("select[name=middleName]").val();
	    console.log("middleName   "+middleName);
	    if(middleName==undefined||middleName==null){
	    	return alert("카테고리의 값을 확인하세요.");
	    }
	    return true;
	}
	//만료기한 검사.
	function deadLinevali(){
	    let deadLine = $("input[name=deadLine]").val();
	    var format = /^(19[0-9][0-9]|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	    let test = new RegExp(format).test(deadLine);
	    console.log("test   "+test);
	    console.log("deadLine   "+deadLine);
	    if(deadLine==undefined||deadLine==null||deadLine==""){
	    	return alert("마감일을 확인하세요."); 
	    }
	    return true;
	}
	//상품 이름 검사.
	function pnamevali(){
	    let pName = $("input[name=pName]").val();
	    console.log("pName   "+pName);
	    if(pName.length==0){
	    	return alert("상품 이름을 입력하세요.");
	    }else if(pName.length>33){
	    	return alert("상품 이름의 길이는 33글자 내외입니다.");
	    }
	    return true;
	}
	//상품 설명 검사.
	function descriptvali(){
	    let descript = $("textarea[name=descript]").val(); 
	    console.log("descript   "+descript);
	    if(descript.length==0||descript==undefined){
	    	return alert("상품 설명을 입력하세요.");
	    }else if(descript.length>60){
	    	return alert("상품설명의 길이는 60글자 내외입니다.");
	    }
	    return true;
	}
	//지도 검사
	function locationvali(){
		let location = $("#location").val();
		if(location==undefined|| location ==""||location==null){
			return alert("지도를 검색해주세요.");
		}
		return true;
	}
	$("#submitBtn").click(function(e){
		e.preventDefault(); 
		
		if(titlevali()&&middleNamevali()&&deadLinevali()&&
				pnamevali()&&descriptvali()&&locationvali()){
			 $("#cobuyform").submit(); 
		}
	});
});

</script>
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
				
				map.setCenter(mouseEvent.latLng); 
				
				document.getElementById('lat').value = map.getCenter().getLat();
				document.getElementById('lng').value = map.getCenter().getLng();
				document.getElementById('location').value = result[0].address.address_name;
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