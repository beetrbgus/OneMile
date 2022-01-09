<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form id="regForm" action="reg" method="post">
	<br>
	이미지 :
	<input type="file" name="attach" >
	
	<br>
	제목 :
	<input type="text" name="title" required>
	<br>
	관심 카테고리 :
	<select class="big" name="type" required > 
		<option value="">카테고리선택</option>
		<c:forEach var="category" items="${bigCategory}">
			<option value="${category.bigType}">${category.bigType}</option>
		</c:forEach>
	</select>
	<select class="middle" name="smallType" required></select>
	<br>
	설명 :
	<textarea name="context" placeholder="모임을 설명해주세요." required></textarea>
	<br>
	추가 이미지 등록 :<input type="file" name="attach" >
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
	<input type="hidden" name="lat" required>
	<br>
	경도 :
	<input type="hidden" name="lng" required>
	<br>
	상세주소 :
	<input type="text" name="location" required>
	
	<br>
	최소인원 :
	<input type="number" name="minpeople" min="2" value="2" required>
	<br>
	최대인원 : 
	<input type="number" name="maxpeople" min="2" value="2" required>
	<div id="map" style="width: 500px; height: 400px;"></div>
	
	<button type="button" id="submitBtn">등록하기</button>
</form>
<script>
	$(function(){
		function inputDate(day,time){
			let formdate = day + " "+time;
				return formdate;
		}

		$("#submitBtn").on("click",function(){
			let startDate = inputDate($("#startDay").val(),$("#startTime").val());
			let endDate = inputDate($("#endDay").val(),$("#endTime").val());
			
			console.log("지도      상세주소   "+$("#location").val());
			$("input[name=endDate]").val(endDate);
			$("input[name=startDate]").val(endDate);
			
			console.log("startDate      :"+ $("input[name=startDate]").val());
			console.log("EndDate      :"+ $("input[name=endDate]").val());
			/* $("#regForm").submit();	 */
		});

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