<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="write" method="post">
	<input type="hidden" name="middlename" value="사건">
	제목 <input type="text" name="title"><br>
	내용 <textarea cols="100" rows="20" name="content"></textarea><br>
	위도 <input type="text" name="lat">
	경도 <input type="text" name="lon">
	자세한 주소 <input type="text" name="detailAddress">
	파일 <input type="file" name="attach">
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>