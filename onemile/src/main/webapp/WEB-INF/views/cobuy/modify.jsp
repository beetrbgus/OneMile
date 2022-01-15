<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
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
	width:100%;
	min-height: 43px;
	height: 43px;
	font-weight: 700;
	font-size: 32px;
	overflow: hidden
	margin-bottom:5px;
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
.num-input{
	flex:2;
	font-size:22px;
}
.label{
	font-size:22px;
}
</style>
<div class="page-container">
	<div class="ui-header">
		<h2 class="title">공동구매</h2>
	</div>
	<form id="cobuyform" method="post" enctype="multipart/form-data">
		<label class="label">이미지 : </label><input type="file" name="attach" required accept="image/jpeg, image/png, image/jpg"><br><br>
	<input class="post-title" type="text" name="title" placeholder="공구의 제목을 입력해주세요." required value="${detail.title}"><br><br>
	<select name="middleName" class="category" >
		<option value="" class="label category">카테고리</option>
		<option value="패션·잡화" class="label category">패션·잡화</option>
		<option value="뷰티" class="label category">뷰티</option>
		<option value="푸드" class="label category">푸드</option>
		<option value="홈·리빙" class="label category">홈·리빙</option>
		<option value="여행·레저" class="label category">여행·레저</option>
		<option value="패션·잡화" class="label category">패션·잡화</option>
		<option value="스포츠·모빌리티" class="label category">스포츠·모빌리티</option>
		<option value="베이비·키즈" class="label category">베이비·키즈</option>
		<option value="반려동물" class="label category">반려동물</option>
	</select> <br><br>
		<label class="label">만료기한 : </label><input type="date" class="form-input" id="deadLine" name="deadLine" required value="${detail.deadLine}"><br><br>
		<label class="label">가격 : </label><input type="number" class="num-input" name="price" min="100" required placeholder="원 단위" value="${detail.price}"> <label class="label">수량 : </label><input type="number" class="num-input" name="stock" min="0" required placeholder="개 단위" value="${detail.stock}"><br><br>
	<hr> 
		<label class="label">상품이름 : </label><input type="text" class="post-title" name="pName" required placeholder="상품명을 입력해주세요." value="${detail.PName}"><br><br>
		<label class="label">상품설명 : </label><textarea name="descript" class="post-content" placeholder="상품 정보를 입력해주세요." required>${detail.descript}</textarea><br><br>
		<label class="label">이미지 : </label><input type="file" class="form-input" name="attach" multiple="multiple" value="${detail.attach}">
	<!--  지도 영역 -->

	<div class="map_wrap">
		<div id="map" 
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
	</div>
	<input id="location" type="hidden" name="detailAddress" required value="${detail.detailAddress}"><br><br>
	<input id="lat" type="hidden" name="lat" required value="${detail.lat}">
	<input id="lng" type="hidden" name="lng" required value="${detail.lng}">

	<p id="result"></p>

	<button id="submitBtn" type="button" class="myButton">전송</button>
</form>
</div>
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
<script type="text/javascript"src="${root}/onemile/resources/js/cobuy/map.js"></script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>