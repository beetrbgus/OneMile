$(function(){
	$(".confirmbtn").click(function(){
		if('geolocation' in navigator){
		    navigator.geolocation.getCurrentPosition((position) => {
		    	let lat = position.coords.latitude;
		    	let lng = position.coords.longitude;
		    	//세션이 있으면 세션 지우고  세션에 저장.
		    	if(removeSession()){
		    		setSession(lat,lng);
		    	}
		    	let region = getAddr(lat,lng);
		    });

		}
	});
	function getAddr(lat,lng){
		let geocoder = new kakao.maps.services.Geocoder();

	    let coord = new kakao.maps.LatLng(lat, lng);
	    let callback = function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	        	console.log(result[0]);
	        	let dong = result[0].region_3depth_name;
	        	$(".dong").val(dong);
	        }
	        return result[0];
	    };
	    geocoder.coord2RegionCode(lng,lat,callback);
	}
	function removeSession(){
    	let sessionlat= sessionStorage.getItem("lat");
		let sessionlng= sessionStorage.getItem("lng");		
    	
		if(sessionlat ==0 ||sessionlat ==undefined || sessionlat == null
				|| sessionlng ==0 ||sessionlng ==undefined || sessionlng == null){
	    	removeItem(lat);
	    	removeItem(lng);
	    	//지웠으면 트루 반환
	    	return true;
		}
		return false;
	}
	function setSession(lat,lng){
    	let sessionlat= sessionStorage.getItem("lat");
		let sessionlng= sessionStorage.getItem("lng");		
    	
	    sessionStorage.setItem("lat", lat );
	    sessionStorage.setItem("lng", lng );

	}

});