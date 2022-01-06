<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="write" method="post" enctype="multipart/form-data">
	<input type="hidden" name="middleName" value="질문">
	제목 <input type="text" name="title"><br>
	내용 <textarea cols="100" rows="20" name="content"></textarea><br>
	파일 <input type="file" name="attach">
	<input type="submit" value="등록하기">
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>