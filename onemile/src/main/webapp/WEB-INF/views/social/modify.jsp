<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
/* 카테고리 */
$(function(){
	$(".big").on("change",function(){
		var root = $("#rrr").val();
		console.log("root  "+root);
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
});
</script>
<input id="rrr" type="hidden" value="${pageContext.request.contextPath}">
<form id="regForm" action="../modify" method="post" enctype="multipart/form-data">
	<br>
	<input type="hidden" name="socialNo" value="${socialDetail.socialNo}">
	<input type="file" name="attach" multiple="multiple">
	이미지 :
	<c:forEach var="image" items="${socialDetail.imageInfo}">
		<div class="imgdiv">
			<img width="300px" height="215px" src="${pageContext.request.contextPath}/image/download?imageNo=${image.imageNo}&folder=social">
				<input type="hidden" value="${image.imageNo}">
				업로드 이름 : ${image.uploadName}
				저장된 이름 : ${image.saveName}"
				파일 크기 : ${image.fileSize}
				파일 유형 : ${image.fileType}
			<button type="button" class="deleteImg">x</button>
		</div>
		</c:forEach>
	<br>
	제목 :
	<input type="text" name="title" value="${socialDetail.title}" required>
	<br>
	관심 카테고리 :
	<select class="big" required > 
		<option value="" >카테고리선택</option>
		<c:forEach var="category" items="${bigCategory}">
			<c:if test="${category.bigType !='전체'}">
				<option value="${category.bigType}" 
					<c:if test="${category.bigType eq socialDetail.type}">selected="selected"</c:if>>
					${category.bigType}
				</option>
			</c:if>
		</c:forEach>
	</select>

	<select class="middle" name="smalltype" required>
		<c:forEach items="${middleList}" var="middle">
			<option value="${middle.smallType}" 
				<c:if test="${middle.smallType eq socialDetail.smalltype}">selected="selected"</c:if>
			>
				${middle.smallType}
			</option>
		</c:forEach>
	</select>
	<br>
	설명 :
	<textarea name="context" placeholder="모임을 설명해주세요." required >
		${socialDetail.context}
	</textarea>
	<br>
		
	추가 이미지 등록 :<input type="file" name="attach" multiple="multiple">
	<br>
	시작일 :
	<input type="hidden" name="startDate">
	<input type="date" id="startDay" required>
	<input type="time" id="startTime" required>
	
	<br>
	종료일 :
	<input type="hidden" name="endDate">
	<input type="date" id="endDay" required>
	<input type="time" id="endTime" required>
	<br>
	위도 :
	<input type="text" name="lat" value="${socialDetail.lat}" required>
	<br>
	경도 :
	<input type="text" name="lng" value="${socialDetail.lng}" required>
	<br>
	상세주소 :
	<input type="text" id="location" value="${socialDetail.detailAddress}" 
		name="location" required>
	
	<br>
	최소인원 :
	<input type="number" name="minpeople" min="2" value="${socialDetail.minpeople}" required>
	<br>${AD}
	최대인원 : 
	<input type="number" name="maxpeople" min="2" max="${AD}" value="${socialDetail.maxpeople}" required>
	<div id="map" style="width: 500px; height: 400px;"></div> 
	
	<button type="button" id="submitBtn">등록하기</button>
</form>

<script type="text/javascript"src="${root}/onemile/resources/js/social/mapRead.js"></script>
<script type="text/javascript"src="${root}/onemile/resources/js/social/regDate.js"></script>
<script type="text/javascript"src="${root}/onemile/resources/js/social/regValidate.js"></script>
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
<script>
	/* 이미지 비동기 삭제*/
	$(function(){
		$(".deleteImg").on("click",function(){
			let imgdiv = $(this).parent()
			let imageNo = imgdiv.find("input").val();
			console.log("imageNo    " + imageNo);
			$.ajax({
				  url : "${pageContext.request.contextPath}/image/delete?imageNo="+imageNo+"&folder=social",
		  		  type : "delete",
		  		  dataType : "text",
		  		  success : function() {
		  			console.log("성공");
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
	});
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>