<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!-- 
CobuyListVO의 pName을 가져오는데 , 오류가 생김
	${CobuyListVO.pName} 이 안되고 ,
	${CobuyListVO.getPName()} 은 되고 
	${CobuyListVO.PName}도 됨.
  -->
<c:forEach items="${list}" var="CobuyListVO">
	상품번호 : ${CobuyListVO.cobuyNo}/작성자: ${CobuyListVO.nick} /상품이름 :${CobuyListVO.PName} 
	/가격 : ${CobuyListVO.price}원/ 제목 : ${CobuyListVO.title} /재고 : ${CobuyListVO.stock} /
	마감기한 : ${CobuyListVO.deadLine}/ 사진번호 : ${CobuyListVO.imgNo}
<img src="D:upload/cobuy/93" width="100%" class="image image-round image-border">
<%-- <img src="D:upload/cobuy/${CobuyListVO.imgNo}" width="100%" class="image image-round image-border"> --%>
	<br>
</c:forEach>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>




