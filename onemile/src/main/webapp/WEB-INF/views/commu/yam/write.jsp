<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="write" method="post">
	<input type="hidden" name="middlename" value="얌얌">
	제목 <input type="text" name="title">
	내용 <text name="content">
	위도 <input type="text" name="lat">
	경도 <input type="text" name="lon">
	자세한 주소 <input type="text" name="detailAddress">
	파일 <input type="file" name="attach">
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>