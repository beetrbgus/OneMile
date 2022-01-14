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
<form id="regForm" action="reg" method="post" enctype="multipart/form-data">
	<br>
	이미지 :
	<input type="file" name="attach" >
	
	<br>
	제목 :
	<input type="text" name="title" required>
	<br>
	관심 카테고리 :
	<select class="big" required > 
		<option value="">카테고리선택</option>
		<c:forEach var="category" items="${bigCategory}">
			<c:if test="${category.bigType !='전체'}">
				<option value="${category.bigType}">${category.bigType}</option>
			</c:if>
		</c:forEach>
	</select>
	<select class="middle" name="smalltype" required></select>
	<br>
	설명 :
	<textarea name="context" placeholder="모임을 설명해주세요." required></textarea>
	<br>
	추가 이미지 등록 :<input type="file" name="attach" multiple="multiple">
	<br>
	시작일 :
	<input type="hidden" name="startDate">
	<input type="date" id="startDay" required>
	<input type="time" id="startTime" required>
	<input type="datetime-local" id="startTime" required>
	<br>
	종료일 :
	<input type="hidden" name="endDate">
	<input type="date" id="endDay" required>
	<input type="time" id="endTime" required>
	<br>
	위도 :
	<input type="hidden" name="lat" required>
	<br>
	경도 :
	<input type="hidden" name="lng" required>
	<br>
	상세주소 :
	<input type="text" id="location" name="location" required>
	
	<br>
	최소인원 :
	<input type="number" name="minpeople" min="2" value="2" required>
	<br>
	최대인원 : 
	<input type="number" name="maxpeople" min="2" max="${AD}" value="2" required>
	<div id="map" style="width: 500px; height: 400px;"></div>
	
	<button type="button" id="submitBtn">등록하기</button>
</form>
<script>
	$(function(){
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
		function dateValid(){
			
		}
	});

</script>
<script>
	$(function(){
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
<script type="text/javascript"src="${root}/onemile/resources/js/cobuy/map.js"></script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>