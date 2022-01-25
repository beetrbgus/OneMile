<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detail.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detail-socialing.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/grid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reboot.css">
<script type="text/javascript" src="${root}/onemile/resources/js/social/mapRead.js"></script>
<script type="text/javascript" src="${root}/onemile/resources/js/social/regDate.js"></script>
<script type="text/javascript" src="${root}/onemile/resources/js/social/regValidate.js"></script>

<form id="regForm" action="../modify" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="socialNo" value="${socialDetail.socialNo}">
	
	<!-- css테스트중 -->
	<div class="container detail">
		<div class="detail-wrapper">
			<div class="detail_info">
				<p class="detail_name">
					<input type="text" name="title" required placeholder="제목을 입력해주세요."
						value="${socialDetail.title}">
				</p>
				<div class="detail_info_container">
					<div>
						<div>
							<p class="sub">장소</p>
						</div>
						<p class="detail_startDate">
							<input type="text" id="location" name="location" required
								readonly value="${socialDetail.detailAddress}">
						</p>
					</div>
					<div>
						<div>
							<p class="socialing_startDate sub">관심카테고리</p>
						</div>
						<p class="summary-sub">
							<select class="big" required>
								<option value="">카테고리선택</option>
								<c:forEach var="category" items="${bigCategory}">
									<c:if test="${category.bigType !='전체'}">
										<option value="${category.bigType}"
											<c:if test="${category.bigType eq socialDetail.type}">selected="selected"</c:if>>
											${category.bigType}</option>
									</c:if>
								</c:forEach>
							</select> <select class="middle" name="smalltype" required>
								<c:forEach items="${middleList}" var="middle">
									<option value="${middle.smallType}"
										<c:if test="${middle.smallType eq socialDetail.smalltype}">selected="selected"</c:if>>
										${middle.smallType}</option>
								</c:forEach>
							</select>
						</p>
					</div>
					<div>
						<div>
							<p class="sub">소셜링 이미지[최대 3장, 5MB 등록 가능]</p>
						</div>
						<p class="detail_startDate">
							<input type="file" name="attach" multiple>
						</p>

					</div>
				</div>

			</div>
			<div class="detail_carousel_row no_padding row">
				<div class="col-12">
					<div id="detail_main_carousel" class="carousel slide"
						data-ride="carousel">
						<div class="carousel-inner" id="cover_carousel_inner">


							<!-- 미리보기  -->
							<div id="result"
								style="display: flex; flex-direction: row; width: 500px; height: 400px; margin-left: 200px;">
							
								<c:forEach var="image" items="${socialDetail.imageInfo}">
									<div class="imgdiv">
										<img  width="150px" height="150px"
											src="${pageContext.request.contextPath}/image/download?imageNo=${image.imageNo}&folder=social">
										<input type="hidden" value="${image.imageNo}">
										<button type="button" class="deleteImg">x</button>
									</div>
								</c:forEach>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="detail_floating_zone"
			style="position: absolute; top: 600px; width: 412px; right: 500px;">
			<div class="detail_buttons_row floating row">
				<div id="map"
					style="width: 412px; height: 400px; top: 10px; right: 20px;"></div>
			</div>
			
		</div>
		<div id="info_row" class="detail_content_row row">
			<div class="col-12">
				<h3 class="sub_title">인원 및 날짜 설정</h3>

			</div>
			<div class="col-12">
				<div class="info_row no_padding row">
					<div class="col-auto"></div>
					<div class="col info_people">
						시작일 : <input type="hidden" name="startDate"> <input
							type="date" id="startDay" required> <input type="time"
							id="startTime" required>
					</div>
				</div>

				<div class="info_row no_padding row">
					<div class="col-auto"></div>
					<div class="col info_datetime">
						종료일 : <input type="hidden" name="endDate"> <input
							type="date" id="endDay" required> <input type="time"
							id="endTime" required>
					</div>
				</div>
				<div class="info_row no_padding row">
					<div class="col-auto"></div>
					<div class="col info_location">
						최소인원 : <input type="number" name="minpeople" min="2"
							value="${socialDetail.minpeople}" required>
					</div>
				</div>
				<div class="info_row no_padding row">
					<div class="col-auto"></div>
					<div class="col info_location">
						최대인원 : <input type="number" name="maxpeople" min="2" max="${AD}"
							value="${socialDetail.maxpeople}" required>
					</div>
				</div>
				<div class="info_price_row info_row no_padding row"
					style="display: none;">
					<div class="col-auto"></div>
					<div class="col info_price">
					</div>
				</div>
			</div>
		</div>
		<div id="introduce_row" class="detail_content_row row">
			<div class="col-12 p-20"></div>

			<div class="col-12" id="introduce">
				<textarea name="context" placeholder="모임을 설명해주세요." required
					cols="50" rows="10" style="resize: none;">${socialDetail.context}</textarea>
			</div>
		</div>
		<input type="hidden" name="lat" value="${socialDetail.lat}" required>
		<input type="hidden" name="lng" value="${socialDetail.lng}" required>
		
		
		<button type="button" id="submitBtn">수정하기</button>
	</div>
</form>

<script type="text/javascript"src="${root}/onemile/resources/js/social/mapRead.js"></script>
<script type="text/javascript"src="${root}/onemile/resources/js/social/regDate.js"></script>
<script type="text/javascript"src="${root}/onemile/resources/js/social/regValidate.js"></script>
<script>
/* 카테고리 */
$(function(){
	let imgCnt = $(".imgdiv").length;
	console.log("imgCnt    "+imgCnt);
	$(".big").on("change",function(){
		var category = $(this).val();
	
		$.ajax({ 
			url : '${pageContext.request.contextPath}/miles/data/category/child',
			type : "post",
			async : false,
			data : { 
				categorySuper : category
			},
			success : function(resp) {
				console.log("성공", resp);
					
				var middle = $(".middle");
				middle.find("option").remove();
				for (var dto of resp) { 
					var middleOption = $("<option>");
					middleOption.val(dto.smallType);
					middleOption.text(dto.smallType);
					middle.append(middleOption);
				}
		  	},
	 		error : function(e) {
			  console.log("실패", e);
 		  	}
 		});
	});

	//파일 갯수 제한
	//파일이 선택되면 3개 이상인지 확인해서 차단
	if(imgCnt <= 3){
		$("input[name=attach]").on("input", function () {
		    console.log(this.files);
		    console.log("event " +event.target);
		    console.log(this.files);
		    if (this.files.length + imgCnt > 3) {
		      	alert("파일은 3개까지만 선택이 가능합니다");
		      	$(this).val(""); //선택취소
		      	return;
	      	}
    	 });
	}else{
		alert("이미지는 3장까지 등록 가능합니다.");
	}
      						
	//이미지 미리보기
 	var sel_files = [];
 	$("input[name=attach]").on("input", handleImgsFilesSelect);
 	
	function handleImgsFilesSelect(e) {
	    sel_files = [];
	    var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);
	    
	    filesArr.forEach(function(f){
	    	if(!f.type.match("image.*")){
	        	alert("확장자는 이미지 확장자만 가능합니다.");
	            return;
	        }
        sel_files.push(f);
        var reader = new FileReader();
        reader.onload = function(e) {
	        var html = "<div class='imgdiv'><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile'width='150px' height='150px'><button type='button' class='deleteImg'>x</button></div>";
	       
	        $("#result").append(html);
	        /* 동적으로 추가한 것에대해서는 이벤트 적용이 안되기 때문에 , 이벤트 걸어주기. */
	        $(document).on('click', '.deleteImg', function deleteEvent(){
	    		let imgdiv = $(this).parent();
    			imgdiv.remove();
    			return;
	    	});
        }
        reader.readAsDataURL(f);
     });
	}
	

	/* 이미지 비동기 삭제*/
	
	$(".deleteImg").on("click",function(){
		let imgdiv = $(this).parent();
		let imageNo = imgdiv.find("input").val();
		console.log("imageNo    " + imageNo);
		console.log("imgdiv    " + imgdiv);
		console.log("imgdiv.find('input')    " + imgdiv.find("input"));
		if(!imgdiv.find("input")){
			imgdiv.remove();
			return;
		}
		$.ajax({
			  url : "${pageContext.request.contextPath}/image/delete?imageNo="+imageNo+"&folder=social",
	  		  type : "delete",
	  		  dataType : "text",
	  		  success : function() {
	  			console.log("성공");
	  			imgCnt--;
	  			console.log("imgCnt   "+imgCnt);
	  			imgdiv.remove();
	  		  },
	  		  error : function(e) {
				  console.log("실패", e);
	  		  }
  		});
	});
	/*카테고리 선택시 비동기 */
	$("select[name=type]").on("change",function(){
		var category = $(this).val();
		
		var root = "${pageContext.request.contextPath}"; 
		
		console.log("root   "+root);
		$.ajax({
		  url : root+'/miles/data/category/child',
  		  type : "post",
  		  data : {
  			  categorySuper : category
  		  },
  		  success : function(resp) {
  			console.log("성공", resp);
  			
  			var middle = $(".middle");
  			middle.children().remove();
  			for (var dto of resp) {
				var middleOption = $("<option>");
				middleOption.val(dto.smallType);
				middleOption.text(dto.smallType);
				middle.append(middleOption);
			}
  		  },
  		  error : function(e) {
			  console.log("실패", e);
  		  }
  		});
	}); 
	/*최대 이미지 파일 갯수*/
	function maxFileValidate(){
		let originImglength = $(".imgdiv").length;
		
	}
});
</script>
<script>
	/* 가져온 값 넣기 */
	$(function(){
		insertStartDate();
		insertEndDate();
		
		let userlat = ${socialDetail.lat};
		let userlng = ${socialDetail.lng};
		
		//읽어온 시작일 입력
		function insertStartDate(){
			let startDate = "${socialDetail.startDate}";
			let startArr = startDate.split(" ");
			console.log(startArr);
			$("#startDay").val(startArr[0]);
			$("#startTime").val(startArr[1]);
		}
		//읽어온 종료일 입력
		function insertEndDate(){ 
			let endDate = "${socialDetail.endDate}";
			let endArr = endDate.split(" ");
			console.log(endArr);
			$("#endDay").val(endArr[0]);
			$("#endTime").val(endArr[1]);
		}
		
		function inputDate(day,time){
			let formdate = day + " "+time+":00";
				return formdate;
		}
		
		$("#submitBtn").on("click",function(){
			let startDate = inputDate($("#startDay").val(),$("#startTime").val());
			let endDate = inputDate($("#endDay").val(),$("#endTime").val());
			console.log("지도      상세주소   "+$("#location").val());
			$("input[name=endDate]").val(endDate);
			$("input[name=startDate]").val(endDate);
			$("input[name=smalltype]").val($(".middle").val());
		
			console.log("startDate      :"+ $("input[name=startDate]").val());
			console.log("EndDate      :"+ $("input[name=endDate]").val());
			console.log("startDate      :"+ $("input[name=minpeople]").val());
			console.log("EndDate      :"+ $("input[name=maxpeople]").val());
			console.log();
			console.log($(".big").val());
			$("#regForm").submit(); 
		});
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>