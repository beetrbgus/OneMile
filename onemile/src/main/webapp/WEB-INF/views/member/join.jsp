<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
   .notice {
   color:red;
   }
    </style>

<script>
//아이디 중복확인 Ajax
$(function(){
   	$("input[name=email]").on("blur", function(){
   		var input = $("input[name=email]").val();
   		$.ajax({
   			url : "${root}/member/emailcheck",
				type : "get",
				data : {
					email : input
				},
				success : function(resp) {
					if (resp == "YESICAN") {
					} else if (resp == "NONONO") {
						$("input[name=email]").next().text("이미 사용중인 이메일입니다.");
					}
				},
				error : function(err) {
			}
		});
	});
});

//이메일 정규표현식
function emailCheck() {
		var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		var input = document.querySelector("input[name=email]");
		var notice = input.nextElementSibling;
		
		if (input.value.length == 0 || regex.test(input.value)) {
			notice.textContent = "";
			return true;
			} else {
			notice.textContent = "이메일 형식이 올바르지 않습니다";
			return false;
		}
	}
//비밀번호 정규표현식
function pwCheck(){
    var regex = /^[A-Za-z0-9!@#$\s_-]{8,16}$/;
    var input = document.querySelector("input[name=pw]");
    var notice = input.nextElementSibling;

    if(regex.test(input.value)){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "비밀번호는 8~16자 이내의 영문,숫자,특수문자로 작성하세요";
        return false;
    }
}
//비밀번호 확인
function pw2Check(){
    var pwInput = document.querySelector("input[name=pw]");
    var pw2Input = document.querySelector("input[name=pw2]");
    var notice = pw2Input.nextElementSibling;

   if(pwInput.value.length > 0 && pwInput.value == pw2Input.value){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "비밀번호가 일치하지 않습니다";
        return false;
    }
}	

//닉네임 정규표현식
function nickCheck(){
	var regex = /^[가-힣0-9]{2,10}$/;
	var input = document.querySelector("input[name=nick]");
    var notice = input.nextElementSibling;

   	if(regex.test(input.value)){
         notice.textContent = "";
         return true;
     }
     else{
         notice.textContent = "닉네임은 한글, 숫자 2~10자로 작성하세요";
         return false;
     }
}
//연락처 정규표현식
function phoneCheck(){
    var regex = /^01[016789]-[1-9][0-9]{3}-[0-9]{4}$/;
    var input = document.querySelector("input[name=phone]");
    var notice = input.nextElementSibling;

    if(input.value.length == 0 || regex.test(input.value)){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "전화번호는 -포함 13자리로 작성하세요";
        return false;
    }
} 
//생년월일 정규표현식
function birthCheck(){
    //입력이 되어있는지만 확인
    var input = document.querySelector("input[name=birth]");
    var notice = input.nextElementSibling;

    if(input.value.length > 0){
        notice.textContent = "";
        return true;
    }
    else{
        notice.textContent = "생년월일을 선택하세요";
        return false;
    }
}

//정규식들 종합체크
function formCheck(){
    return emailCheck() && pwCheck() && pw2Check() && nickCheck() && birthCheck() && phoneCheck();
}

/* 멀티페이지 */
	$(function(){
  		$(".page").hide();
    	$(".page").eq(0).show();
    	
    	var p = 0;
		
    	$(".next").click(function(e){
        e.preventDefault();
		
        p++;
        console.log(p)
        $(".page").hide();
        $(".page").eq(p).show();
    });
    
    $(".prev").click(function(e){
        e.preventDefault();

        p--;
        $(".page").hide();
        $(".page").eq(p).show();
    });
});

/* 카테고리 */
$(function(){
		$(".big").change(function(){
			
			var category = $(this).val();
		$.ajax({
		  url : "${pageContext.request.contextPath}/miles/data/category/child",
  		  type : "post",
  		  data : {
  			  categorySuper : category
  		  },
  		  success : function(resp) {
  			console.log("성공", resp);
  			var middle = $(".middle"); //지정
  			middle.find("option").remove();
  			for (var dto of resp) {
  				
				var middleOption = $("<option>");
				middleOption.val(dto.smallType);
				middleOption.text(dto.smallType);
				middle.append(middleOption);
			}
  		  },
  		  error : function(e) {
			  console.log("실패", e);
  		  }
  		 });
		
	} );
});

function lengCheck() {
 
    var input = document.querySelector("#intro");
    var output = document.querySelector("#intro-length");

    var len = input.value.length;
    
    //만약 1000글자가 넘어간다면 넘어간 만큼 글자를 제거
    while(len > 100) {
        input.value = input.value.substring(0,input.value.length-1);
        len--;
    }

    //글자 정리 후 길이 설정
    output.textContent = len;
    }

</script>

<form method="post" enctype="multipart/form-data">

<!-- 1페이지 -->
<div class="page">
<div class="container-400 container-center">
	
	<div class="row center">
		<h1>회원가입</h1>
	</div>
	
	<div class="row">
		<label>이메일</label> 
		<input type="email" name="email" required class="form-input" autocomplete="off" onblur="emailCheck();">
		<div class="notice"></div>
	</div>
	<div class="row">
		<label>비밀번호</label>
		<input type="password" name="pw" required class="form-input" autocomplete="off" onblur="pwCheck();">
		<div class="notice"></div>
	</div>
	<div class="row">
		<label>비밀번호 확인</label>
		<input type="password" name="pw2" required class="form-input" autocomplete="off" onblur="pw2Check();">
		<div class="notice"></div>
	</div>
	<div class="row">
		<label>닉네임</label>
		<input type="text" name="nick" required class="form-input" autocomplete="off" onblur="nickCheck();">
		<div class="notice"></div>
	</div>
	<div class="row">
		<label>연락처</label>
		<input type="tel" name="phone" class="form-input" autocomplete="off" onblur="phoneCheck();" placeholder="전화번호 -포함 13자리를 입력해주세요.">
		<div class="notice"></div>
	</div>
	<div class="row">
		<label>생년월일</label>
		<input type="date" name="birth" required class="form-input form-inline" autocomplete="off" onblur="birthCheck();">
	</div>
	
	<div class="row" >
		<label>성별</label>
		<select name="gender">
			<option value="남자">남자</option>
			<option value="여자">여자</option>
			<option value="기타">기타</option>
		</select>
	</div>
	
	<div class="row">
		<textarea name="intro" rows="5" cols="50" placeholder="자기소개" id="intro"  oninput="lengCheck();"></textarea>
	</div>
	<div class="row reft">
            <span id="intro-length">0</span> / 100
        </div>
	<div class="row">
		<input type="checkbox"> [필수]이용약관과 개인정보처리방침에 동의
	</div>
	<div class="row">
		<button type="button" class="form-btn next">다음으로</button>
	</div>
</div>
</div>

<div class="page">		
<div class="container-400 container-center">
	<div class="row center">
		<h1>회원가입</h1>
	</div>		
	<div class="row">
		<label>관심사 설정</label>
	</div>
	<div class="row">
		<select class="big" required>
     		<option value="">카테고리선택</option>
     		<c:forEach var="category" items="${category}">
          		<option value="${category.bigType}">${category.bigType}</option>
          	</c:forEach>
      </select>
      <select class="middle" name="smalltype"></select>
	</div>
	
	<div class="row" >
		<label>MBTI</label>
		<br>
			<select name="mbti">
				<option value="INFP">INFP<option>
			</select>
	</div>
	<div class="row">
		<label>프로필 사진</label>
		<input type="file" name="attach" accept="image/*" class="form-input" multiple>
	</div>
		
	<div class="row">
		<label>코로나 백신접종여부</label>
		<input type="file" name="attach" accept="image/*" class="form-input">
	</div>
	<button type="button" class="form-btn prev">이전 단계로</button>
		
	<div class="row">
			<input type="submit" value="가입" class="form-btn">
	</div>

</div>
</div>

</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>