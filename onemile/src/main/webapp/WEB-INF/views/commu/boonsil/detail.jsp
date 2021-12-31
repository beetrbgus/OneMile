<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	$(document).ready(function(){
		if(${logId==null})){
		alert("로그인 후 이용가능 합니다.");
		location.href="";//login페이지
		}
	});
</script>

<div>
	<div>
		<h2>제목 : ${commuDetailVO.title}</h2>
		작성자 : ${commuDetailVO.nick}
	</div>
	<div>
		내용
		${commuDetailVO.content}
		<!--<c:if test="사진이 있으면">
			<img src = "">
		</c:if>-->
	</div>

	<div>
		<form action="reply/edit">
	    	<c:forEach var="replyVo" items="${replyVOList}">
	    		${replyVo.writerNick},
	    		${replyVo.regDate},
	    		${replyVo.content},
	    	</c:forEach>
	    </form>
	    <div>
	    	 <form action="reply/insert" method="post">
            <c:forEach var="replyVo" items="${replyVo}">
                <input type="hidden" name="commuNo" value="${commuVo.commuNo}">
                <input type="hidden" name="memberNo" value="${sessionsScope.uid}">
                <input type="hidden" name="replyReceiverNo" value="${commuVo.writer}">
                <input type="hidden" name="vieYN" value="N">
            </c:forEach>
			<c:if test="${logId == null}">
	            <input type="button" value="댓글 쓰기" disabled="disabled">
	        </c:if>
	        <c:if test="${logId != null}">
	            <input type="button" value="댓글 쓰기" id="commentWrite">
	        </c:if>
        </form>
	    </div>
	    
	    <div>
	    	
	    </div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>