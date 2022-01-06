<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<form>
	<table>
		<thead>
			<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			</tr>	
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
	 			<tr>
 			<td>${list.nt_no}</td>
  			<td>${list.title}</td>
			<td>${list.nt_writer}</td>
	 				 <fmt:parseDate value="${list.postdate}" var="dateValue" pattern="yyyyMMddHHmmss"/> 
	 				 <td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" onclick="location.href='/notice/write'">글쓰기</button>
</form>
</body>
</html> 