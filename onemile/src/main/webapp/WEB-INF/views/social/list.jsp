<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list}" var="social">
	이미지 번호 : ${social.imgNo}
	소셜 번호 : ${social.socialNo}
	소분류  : ${social.smalltype}
	제목 : ${social.title}
	시작일 : ${social.starDate}
	종료일 : ${social.endDate}
	모임장 회원번호 : ${social.memberNo}
	닉네임 : ${social.nick} 
	회원 프사 이미지 번호 : ${social.profileImgNo}
	상세주소 : ${social.detailAddress}
</c:forEach>

