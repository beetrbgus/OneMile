<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
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
     	<select name="smallName">
     		<option value="축구">축구</option>
     	</select>
     	
       <div class="row center">
          <textarea
            style="width: 500px; height: 400px"
            name="context"
            placeholder="내용을 입력해주세요."
            required></textarea>
        </div>
        <input type="file" name="attach" />
          <input type="submit" value="개설" />
        </div>
       </form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>