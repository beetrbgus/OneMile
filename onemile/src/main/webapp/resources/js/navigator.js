$(function(){
	$(".confirmbtn").click(function(){
		if('geolocation' in navigator){
		    navigator.geolocation.getCurrentPosition((position) => {
		    	
		    	let lat = position.coords.latitude;
		    	let lng = position.coords.longitude;
		    	
		    	let region = getAddr(lat,lng);
		    	/*$.ajax({
		    		url:"/AjaxTest/ex01.do",
		    		type: "POST", //요청 메소드 방식
		    		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		    		data : region,
		    		success : function(result){
		    			//서버의 응답데이터가 클라이언트에게 도착하면 자동으로 실행되는함수(콜백)
		    			//result - 응답데이터
		    			//$('#result').text(result);
		    			alert(result);
		    		},
		    		error : function(a, b, c){
		    			//통신 실패시 발생하는 함수(콜백)
		    			alert(a + b + c);
		    		}
		    	});*/
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
});