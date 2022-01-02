<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  			var middle = $(".middle"); //지정
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
		
	} );
});
</script>


	<div class="row center">
		<h2>마일즈 생성</h2>
	</div>
    <form method="post" enctype="multipart/form-data">
     <div class="container-500 container-center">
      <div class="row center">
      <input type="text" name="name" placeholder="제목을 입력해주세요." style="width:500px;" required >
        </div>
        <div class="row center">
      <input type="text" name="area" placeholder="활동지역 작성(구까지)" style="width:300px;" required >
        </div>
      	<div class="row center">
     	
     	<select class="big" required>
     		<option value="">카테고리선택</option>
     		<c:forEach var="category" items="${category}">
          		<option value="${category.bigType}">${category.bigType}</option>
          	</c:forEach>
      </select>
      <select class="middle"></select>
     	
     	
     	</div>
       <div class="row center">
          <textarea
            style="width: 500px; height: 400px"
            name="context"
            placeholder="내용을 입력해주세요."
            required></textarea>
        </div>
        <input type="file" name="attach" multiple/>
          <input type="submit" value="개설" />
        </div>
       </form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>