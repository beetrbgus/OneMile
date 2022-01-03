<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<script src="${root}/resources/js/sigungu.js"></script>
<script>
	$(function(){
		$(".big").change(function(){
		
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

  <div class="row center">
		<h2>마일즈 생성</h2>
  </div>

<form method="post" enctype="multipart/form-data">
  <div class="container-500 container-center">
  	<div class="row">
      <select name="sido" id="sido"></select>
	  <select name="gugun" id="gugun"></select>
	  <input type="hidden" id="area" name="area">
      <input type="text" name="name" placeholder="제목을 입력해주세요." style="width:500px;" required >
    </div>
	
	<select class="big" required>
     	<option value="">카테고리선택</option>
     		<c:forEach var="category" items="${category}">
          		<option value="${category.bigType}">${category.bigType}</option>
          	</c:forEach>
     </select>
     
     <select class="middle" name="smallName"></select>
     	
     <div class="row center">
          <textarea
            style="width: 500px; height: 400px"
            name="context"
            placeholder="내용을 입력해주세요."
            required></textarea>
       </div>
        
       <div class="row center">
       	  <input type="file" name="attach" multiple/>
       </div>  
       <div class="row center">
          <input type="submit" value="개설" />
       </div>

	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>