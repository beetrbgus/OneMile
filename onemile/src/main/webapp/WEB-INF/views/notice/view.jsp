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
<form id="frm">
<input type="hidden" value="" name="seq" id="seq">
<div>제목 : ${view.title} </div>
<div>작성자 : ${view.nt_writer}</div>
<div>내용 : ${view.cont} </div>
<button type="button" onclick='location.href="/notice/list"'>목록</button>
<button type="button" onclick='fn_goUpdateView(${view.seq})'>수정</button>
<button type="button" onclick='fn_boardDelete(${view.seq})'>삭제</button>
</form>
</body>
</html>