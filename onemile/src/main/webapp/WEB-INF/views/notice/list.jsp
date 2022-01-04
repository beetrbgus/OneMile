<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
		</tr>	
	</thead>
	<tbody>
	<c:forEach items="${list}" var="list">
 			<tr>
 				<td>${list.nt_no}</td>
  				<td>${list.title}</td>
				 <td>${list.cont}</td>
			</tr>
		</c:forEach>
		
	</tbody>
</table>
</body>
</html>