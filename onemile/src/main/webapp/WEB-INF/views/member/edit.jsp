<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
.notice {
	color: red;
}
</style>
<script>
	//기본 날짜 설정
	function getToday() {
		var date = new Date();
		var year = date.getFullYear() - 20;
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);
		date = year + '-' + month + '-' + day;
		$("#birth").val(date);
		$("#birth").attr("value", date);
		$("#birth").attr("max", date);
		return date;
	}
	//닉네임 중복확인 Ajax
	$(function() {
		$("#birth").attr("value");
		$("#birth").attr("max",getToday);
		
		$("input[name=nick]").on("input", function() {
			var input = $("input[name=nick]").val();
			$.ajax({
				url : "${root}/member/nickcheck",
				type : "get",
				data : {
					nick : input
				},
				success : function(resp) {
					if (resp == "YESICAN") {
					} else if (resp == "NONONO") {
						$("input[name=nick]").next().text("이미 사용중인 닉네임입니다.");
					}
				},
				error : function(err) {
				}
			});
		});
		//전화번호 중복확인 Ajax
		$("input[name=phone]").on("input", function() {
			var input = $("input[name=phone]").val();
			$.ajax({
				url : "${root}/member/phonecheck",
				type : "get",
				data : {
					phone : input
				},
				success : function(resp) {
					if (resp == "YESICAN") {
					} else if (resp == "NONONO") {
						$("input[name=phone]").next().text("이미 사용중인 전화번호입니다.");
					}
				},
				error : function(err) {
				}
			});
		});
	});

	//닉네임 정규표현식
	function nickCheck() {
		var regex = /^[가-힣0-9]{2,10}$/;
		var input = document.querySelector("input[name=nick]");
		var notice = input.nextElementSibling;

		if (regex.test(input.value)) {
			notice.textContent = "";

			return true;
		} else {
			notice.textContent = "닉네임은 한글, 숫자 2~10자로 작성하세요";
			return false;
		}
	}
	//연락처 정규표현식
	function phoneCheck() {
		var regex = /^01[016789]-[1-9][0-9]{3}-[0-9]{4}$/;
		var input = document.querySelector("input[name=phone]");
		var notice = input.nextElementSibling;

		if (input.value.length == 0 || regex.test(input.value)) {
			notice.textContent = "";
			return true;
		} else {
			notice.textContent = "전화번호는 -포함 13자리로 작성하세요";
			return false;
		}
	}
	//생년월일 정규표현식
	function birthCheck() {
		var regex = /^(19[0-9][0-9]|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		var input = document.querySelector("input[name=birth]");
		var notice = input.nextElementSibling;

		if (input.value.length > 0 && regex.text(input.value)) {
			notice.textContent = "";
			return true;
		} else {
			notice.textContent = "올바른 날짜를 선택해주세요";
			return false;
		}
	}
	//정규식들 종합체크
	function formCheck() {
		return nickCheck() && birthCheck() && phoneCheck();
		
	}
	/* 이미지 비동기 삭제*/
	$(function(){
		$(".deleteImg").on("click",function(){
			let imgdiv = $(this).parent()
			let imageNo = imgdiv.find("input").val();
			console.log("imageNo    " + imageNo);
			$.ajax({
				  url : "${pageContext.request.contextPath}/image/delete?imageNo="+imageNo+"&folder=social",
		  		  type : "delete",
		  		  dataType : "text",
		  		  success : function() {
		  			console.log("성공");
		  			imgdiv.remove();
		  		  },
		  		  error : function(e) {
					  console.log("실패", e);
		  		  }
	  		});
		});
</script>

<form method="post">
	<div class="outer2">
		<div class="wz container form-container" style="width: 500px">
			<h2 class="wz text display2 page-title" style="margin-top: 50px">회원정보
				수정</h2>
			<div class="field name-field" style="margin-top: 30px">
			
				<label class="label">이메일</label>
				<div class="wz input">
					<input id="nickName" class="input text block large" type="email"
						aria-required="true" autocomplete="off" onblur="emailCheck();"
						value="${memberVO.email}" readonly>
					<div class="notice"></div>
				</div>
			</div>

			<div class="field name-field">
				<label class="label">닉네임 
				<span class="notice">[${count == 1 ? '멤버십 가입 후 이용바랍니다' : ''}]</span></label>
				<div class="wz input">
					<input ${count == 1 ? 'readonly' : ''} id="nickName"
						class="input text block large" type="text" placeholder="닉네임 입력"
						name="nick" aria-required="true" autocomplete="off"
						onblur="nickCheck();" value="${memberVO.nick}">
					<div class="notice"></div>
				</div>
			</div>

			<div class="field name-field">
				<label class="label">연락처</label>
				<div class="wz input">
					<input id="nickName" class="input text block large" type="tel"
						placeholder="-포함 13자리를 입력해주세요." name="phone" aria-required="true"
						autocomplete="off" onblur="phoneCheck();"
						value="${memberVO.phone}">
					<div class="notice"></div>
				</div>
			</div>

			<div class="field name-field">
				<label class="label">생년월일</label>
				<div class="wz input">
					<input id="birth" class="input text block large" type="date"
						name="birth" aria-required="true">
					<div class="notice"></div>
				</div>
			</div>

			<div class="field password-field group">
				<div class="wz input">
					<label>MBTI</label> <br> <select name="mbti">
						<option value="선택안함">선택안함</option>
						<option value="ISTJ">ISTJ</option>
						<option value="ISFJ">ISFJ</option>
						<option value="INFJ">INFJ</option>
						<option value="INTJ">INTJ</option>
						<option value="ISTP">ISTP</option>
						<option value="ISFP">ISFP</option>
						<option value="INFP">INFP</option>
						<option value="INTP">INTP</option>
						<option value="ESTP">ESTP</option>
						<option value="ESFP">ESFP</option>
						<option value="ENFP">ENFP</option>
						<option value="ENTP">ENTP</option>
						<option value="ESTJ">ESTJ</option>
						<option value="ESFJ">ESFJ</option>
						<option value="ENFJ">ENFJ</option>
						<option value="ENTJ">ENTJ</option>
					</select>
				</div>
			</div>
			<div class="field password-field group" style="margin-top: 70px">
				<label class="label">자기소개</label>
				<div class="wz input">
					<textarea name="intro" rows="5" cols="50" id="intro"
						oninput="lengCheck();" class="input text block large">${memberVO.intro}</textarea>
				</div>
			</div>
			<br> 
			<c:if test="${param.error != null}">
			<div class="row center"> 
				<h4 class="error">정보가 일치하지 않습니다</h4>
			</div>
			</c:if>
			<input type="submit" id="btnJoin"
				class="wz button primary block" onclick="formCheck();" value="수정하기" onClick="alert('정보가 성공적으로 변경되었습니다.')">
				<a href="${root}/member/quit">탈퇴하기</a>
		</div>
	</div>
			
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>