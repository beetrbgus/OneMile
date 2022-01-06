<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${path}/resources/js/notice.js"></script>

</head>
<body>
<form>
<input type="text" placeholder="제목" id="title" name="title">
<input type="text" placeholder="작성자" id="nt_writer" name="nt_writer">
<input type="text" placeholder="내용" id="cont" name="cont"> 
<button type="button" onclick="fn_noticeWrite();">등록</button>
</form>
</body>
</html>