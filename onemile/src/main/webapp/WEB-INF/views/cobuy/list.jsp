<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!-- 
CobuyListVO의 pName을 가져오는데 , 오류가 생김
	${CobuyListVO.pName} 이 안되고 ,
	${CobuyListVO.getPName()} 은 되고 
	${CobuyListVO.PName}도 됨.
  -->
<c:forEach items="${list}" var="CobuyListVO">
	${CobuyListVO.cobuyNo}/ ${CobuyListVO.nick} /${CobuyListVO.PName}
	<br>
</c:forEach>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>