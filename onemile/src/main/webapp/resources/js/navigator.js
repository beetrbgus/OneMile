$(function(){
	
	//인증 버튼 클릭시 위치 정보 받아오고 세션에 저장.
	$(".confirmbtn").click(function(){
		navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				
	});
	function locationLoadSuccess(pos){
	    // 현재 위치 받아오기
	    var lat = pos.coords.latitude;
	    var lng = pos.coords.longitude;
	    getAddr(lat,lng)
	};

	function locationLoadError(pos){
	    alert('위치 정보를 가져오는데 실패했습니다.');
	};
	//위도 경도로 해당 위치의 동이름 가져오기.
	function getAddr(lat,lng){
		var geocoder = new kakao.maps.services.Geocoder();

	    var coord = new kakao.maps.LatLng(lat, lng);
	    var callback = function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	        	console.log(result[0]);
	        	let goo = String(result[0].region_2depth_name);
	        	let dong = result[0].region_3depth_name;
	        	$(".dong").val(dong);
	        	console.log("result[0].x "+result[0].x);
	        	console.log("result[0].y "+result[0].y);
	        	console.log("result[0].region_2depth_name "+ goo);
	        	console.log("result[0].region_3depth_name "+ dong);
		    	removeSession(); 
	    		setSession(result[0].y,result[0].x,dong,goo);
	    		$.ajax({
					url:context+"/member/myTown?goo="+goo+"&dong="+dong,
					type:"get",
					dataType:"text",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success:function(resp){
						console.log("세션 저장 성공");
					},
					error:function(e){
						console.log("실패", e);
					}
				});
	        }
	    };
	    geocoder.coord2RegionCode(lng,lat,callback);
	}
	//세션제 저장된 위치 정보 모두 삭제  
	function removeSession(){
    	let lat= sessionStorage.getItem("lat");
    	let lng= sessionStorage.getItem("lng");
    	let dong= sessionStorage.getItem("dong");
    	let goo= sessionStorage.getItem("goo");

		if(lat !=0 ||lat !=undefined || lat != null
			|| lng !=0 ||lng ==undefined || lng != null
			|| dong !=0 ||dong ==undefined || dong != null){
			sessionStorage.removeItem("lat");
			sessionStorage.removeItem("lng");
			sessionStorage.removeItem("dong");
	    	//지웠으면 트루 반환
	    	return true;
		}
		return false;
	}
	//세션에 위도 , 경도 , 동네이름 저장 
	function setSession(lat,lng,dong,goo){
		
	    sessionStorage.setItem("lat", lat );
	    sessionStorage.setItem("lng", lng );
	    sessionStorage.setItem("dong", dong );

	}

});