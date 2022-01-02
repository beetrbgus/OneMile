<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%-- 페이지에서 사용할 JSTL 변수 --%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="${root}/resources/js/sigungu.js"></script>
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
        <input type="file" name="attach" multiple/>
          <input type="submit" value="개설" />
        </div>
       </form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>