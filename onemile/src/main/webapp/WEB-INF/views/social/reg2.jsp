<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="reg" method="post">
	제목 :
	<input type="text" name="title">
	관심 카테고리.
	<select class="big" required >
		<option value="">카테고리선택</option>
		<c:forEach var="category" items="${bigCategory}">
			<option value="${category.bigType}">${category.bigType}</option>
		</c:forEach>
	</select>
	<select class="middle" name="smallType" required></select>
	
	설명 :
	<input type="text" name="context">
	시작일 :
	<input type="text" name="startDate">
	종료일 :
	<input type="text" name="endDate">
	위도 :
	<input type="hidden" name="lat">
	경도 :
	<input type="hidden" name="lng">
	상세주소 :
	<input type="text" name="location">
	이미지 :
	<input type="file" name="attach">
	
	<input type="number" name="minpeople">
	<input type="number" name="maxpeople">
	
	<div id="map" style="width: 500px; height: 400px;"></div>
</form>
<script>
	$(function(){
		$("select[name=type]").on("change",function(){
			var category = $(this).val();

			$.ajax({
			  url : "${pageContext.request.contextPath}/miles/data/category/child",
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