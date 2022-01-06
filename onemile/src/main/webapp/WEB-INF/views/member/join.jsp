<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
#att_zone {
	width: 660px;
	min-height: 150px;
	padding: 10px;
	border: 1px dotted #00f;
}

#att_zone:empty:before {
	content: attr(data-placeholder);
	color: #999;
	font-size: .9em;
}
</style>
<style>
.notice {
	color: red;
}
</style>

<script>
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
		  imageView = function imageView(att_zone, btn){

		    var attZone = document.getElementById(att_zone);
		    var btnAtt = document.getElementById(btn)
		    var sel_files = [];
		    
		    // 이미지와 체크 박스를 감싸고 있는 div 속성
		    var div_style = 'display:inline-block;position:relative;'
		                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
		    // 미리보기 이미지 속성
		    var img_style = 'width:100%;height:100%;z-index:none';
		    // 이미지안에 표시되는 체크박스의 속성
		    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
		                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
		  
		    btnAtt.onchange = function(e){
		      var files = e.target.files;
		      var fileArr = Array.prototype.slice.call(files)
		      for(f of fileArr){
		        imageLoader(f);
		      }
		    }  
		    
		  
		    // 탐색기에서 드래그앤 드롭 사용
		    attZone.addEventListener('dragenter', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		    }, false)
		    
		    attZone.addEventListener('dragover', function(e){
		      e.preventDefault();
		      e.stopPropagation();
		      
		    }, false)
		  
		    attZone.addEventListener('drop', function(e){
		      var files = {};
		      e.preventDefault();
		      e.stopPropagation();
		      var dt = e.dataTransfer;
		      files = dt.files;
		      for(f of files){
		        imageLoader(f);
		      }
		      
		    }, false)
		    

		    
		    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
		    imageLoader = function(file){
		      sel_files.push(file);
		      var reader = new FileReader();
		      reader.onload = function(ee){
		        let img = document.createElement('img')
		        img.setAttribute('style', img_style)
		        img.src = ee.target.result;
		        attZone.appendChild(makeDiv(img, file));
		      }
		      
		      reader.readAsDataURL(file);
		    }
		    
		    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
		    makeDiv = function(img, file){
		      var div = document.createElement('div')
		      div.setAttribute('style', div_style)
		      
		      var btn = document.createElement('input')
		      btn.setAttribute('type', 'button')
		      btn.setAttribute('value', 'x')
		      btn.setAttribute('delFile', file.name);
		      btn.setAttribute('style', chk_style);
		      btn.onclick = function(ev){
		        var ele = ev.srcElement;
		        var delFile = ele.getAttribute('delFile');
		        for(var i=0 ;i<sel_files.length; i++){
		          if(delFile== sel_files[i].name){
		            sel_files.splice(i, 1);      
		          }
		        }
		        
		        dt = new DataTransfer();
		        for(f in sel_files) {
		          var file = sel_files[f];
		          dt.items.add(file);
		        }
		        btnAtt.files = dt.files;
		        var p = ele.parentNode;
		        attZone.removeChild(p)
		      }
		      div.appendChild(img)
		      div.appendChild(btn)
		      return div
		    }
		  }
		)('att_zone', 'btnAtt')

</script>

<!-- <script>
function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function (e) {
	       for(var i in input){
	          $('#img'+i).attr('src', e.target.result[i]);
	    	   
	       }
       }
       reader.readAsDataURL(input.files[0]);
    }
}
 $(function () {
	 //파일이 선택되면 3개 이상인지 확인해서 차단
    $("input[name=attach]").on("input", function () {
    	console.log(this.files);
    	console.log("event " +event.target);
    	console.log(this.files);
        if (this.files.length > 3) {
            alert("파일은 3개까지만 선택이 가능합니다");
            $(this).val(""); //선택취소
            return;
        }
        setThumbnail($(this).files);
		//선택한 파일을 읽어서 전송 가능하도록 보관
        //파일이 몇갠지 모르니까 배열에 보관한다
        fileList = this.files;
        console.log(fileList);  
		
    });
		function setThumbnail(imagefile) {
			console.log("썸네일    "+imagefile)
            var reader = new FileReader();
            reader.onload = function (imagefile) {
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                document.querySelector("div#preview").appendChild(img);
            };
            reader.readAsDataURL(event.target.files[0]); }
        
		 
 }); 		
</script> -->

<script>
$(function () {
        //아이디 중복확인 Ajax
        $("input[name=email]").on("blur", function () {
            var input = $("input[name=email]").val();
            $.ajax({
                url: "${root}/member/emailcheck",
                type: "get",
                data: {
                    email: input
                },
                success: function (resp) {
                    if (resp == "YESICAN") {} else if (resp == "NONONO") {
                        $("input[name=email]").next().text("이미 사용중인 이메일입니다.");
                    }
                },
                error: function (err) {}
            });
        });
        //닉네임 중복확인 Ajax
        $("input[name=nick]").on("blur", function () {
            var input = $("input[name=nick]").val();
            $.ajax({
                url: "${root}/member/nickcheck",
                type: "get",
                data: {
                    nick: input
                },
                success: function (resp) {
                    if (resp == "YESICAN") {} else if (resp == "NONONO") {
                        $("input[name=nick]").next().text("이미 사용중인 닉네임입니다.");
                    }
                },
                error: function (err) {}
            });
        });
        //전화번호 중복확인 Ajax
        $("input[name=phone]").on("blur", function () {
            var input = $("input[name=phone]").val();
            $.ajax({
                url: "${root}/member/phonecheck",
                type: "get",
                data: {
                    phone: input
                },
                success: function (resp) {
                    if (resp == "YESICAN") {} else if (resp == "NONONO") {
                        $("input[name=phone]").next().text("이미 사용중인 전화번호입니다.");
                    }
                },
                error: function (err) {}
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
    function pwCheck() {
        var regex = /^[A-Za-z0-9!@#$\s_-]{8,16}$/;
        var input = document.querySelector("input[name=pw]");
        var notice = input.nextElementSibling;

        if (regex.test(input.value)) {
            notice.textContent = "";
            return true;
        } else {
            notice.textContent = "비밀번호는 8~16자 이내의 영문,숫자,특수문자로 작성하세요";
            return false;
        }
    }
    //비밀번호 확인
    function pw2Check() {
        var pwInput = document.querySelector("input[name=pw]");
        var pw2Input = document.querySelector("input[name=pw2]");
        var notice = pw2Input.nextElementSibling;

        if (pwInput.value.length > 0 && pwInput.value == pw2Input.value) {
            notice.textContent = "";
            return true;
        } else {
            notice.textContent = "비밀번호가 일치하지 않습니다";
            return false;
        }
    }

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
        //입력이 되어있는지만 확인
        var input = document.querySelector("input[name=birth]");
        var notice = input.nextElementSibling;

        if (input.value.length > 0) {
            notice.textContent = "";
            return true;
        } else {
            notice.textContent = "생년월일을 선택하세요";
            return false;
        }
    }

    //정규식들 종합체크
    function formCheck() {
        return emailCheck() && pwCheck() && pw2Check() && nickCheck() && birthCheck() && phoneCheck();
    }

    /* 멀티페이지 */
    $(function () {
        $(".page").hide();
        $(".page").eq(0).show();

        var p = 0;

        $(".next").click(function (e) {
            e.preventDefault();

            p++;
            console.log(p)
            $(".page").hide();
            $(".page").eq(p).show();
        });

        $(".prev").click(function (e) {
            e.preventDefault();

            p--;
            $(".page").hide();
            $(".page").eq(p).show();
        });
    });

    /* 카테고리 */
    $(function () {
        $(".big").change(function () {

            var category = $(this).val();
            $.ajax({
                url: "${pageContext.request.contextPath}/miles/data/category/child",
                type: "post",
                data: {
                    categorySuper: category
                },
                success: function (resp) {
                    console.log("성공", resp);

                    var middle = $(".middle");
                    middle.find("option").remove();
                    for (var dto of resp) {

                        var middleOption = $("<option>");
                        middleOption.val(dto.smallType);
                        middleOption.text(dto.smallType);
                        middle.append(middleOption);
                    }
                },
                error: function (e) {
                    console.log("실패", e);
                }
            });
        });
    });

    /* 선택한 카테고리 출력하기 */
    $(function () {
        $(".middle").change(function () {
            var div = $("#category-select");
            var big = $("select[name=location] option:selected").val();
            var middle = $(this).val();

            var select = $("<input type='text' placeholder=' " + big + "" + middle + " '>");
            var select2 = $("<button type='button' class='delete'>x</button>");

            div.append(select);
            div.append(select2);
        });
        /* 버튼누르면 해당 카테고리 삭제 */
        $(".delete").on("click", function () {
            $(this).parent().remove();
        });
    });

    function lengCheck() {

        var input = document.querySelector("#intro");
        var output = document.querySelector("#intro-length");

        var len = input.value.length;

        //만약 1000글자가 넘어간다면 넘어간 만큼 글자를 제거
        while (len > 100) {
            input.value = input.value.substring(0, input.value.length - 1);
            len--;
        }

        //글자 정리 후 길이 설정
        output.textContent = len;
    }

    // 약관확인 이벤트 처리
    $(function(){
    var $agreeContainer = $('.modal-terms-agree');
    var $btnClose = $('#btn-agree-terms-close', $agreeContainer);
    
    //글자 정리 후 길이 설정
    output.textContent = len;
	}
	$(document).ready(function(){
		let mbti  = $("select[name=mbti]");
		mbti.append("<option>ㅋㅋㅋㅋ</option>");
		console.log("mbti   "+mbti);
	});

    $agreeContainer.each(function () {
        var $checkbox = $('input[type="checkbox"]:not(.toggle)', this);
        var $agreeTermField = $('.agree-term-field');
        var $inputAgreeAll = $checkbox.filter('#agreeAllCheckBox');
        var $inputAgree = $checkbox.filter('#agreeCheck');
        var $inputAgreePrivacy = $checkbox.filter('#agreePrivacyCheck');
        var $inputAgreeGroup = $checkbox.filter('#agreeCheck, #allowDirectMail');
        var $inputAllowDirectMail = $checkbox.filter('#allowDirectMail');
        var $inputsAllow = $('.sub-field input', $agreeTermField);
        var $inputAllowEmail = $checkbox.filter('#allowEmail');
        var $inputAllowSMS = $checkbox.filter('#allowSMS');
        var $buttonAgree = $('#btnAgree', $agreeContainer);

        function setClosingEvent() {
            var event = new CustomEvent("closing", {
                detail: {
                    isAgreeTermAll: $inputAgreeAll.prop('checked'),
                    isAgreeTerm: $inputAgree.prop('checked'),
                    isAllowDM: $inputAllowDirectMail.prop('checked') ? 1 : 0,
                    isAllowEmail: $inputAllowEmail.prop('checked') ? 1 : 0,
                    isAllowSMS: $inputAllowSMS.prop('checked') ? 1 : 0
                }
            });
            $agreeContainer[0].dispatchEvent(event);
        }
    })

        // 체크박스
        $checkbox.on('change', function (event) {
            var target = event.target;
            var id = target.id;
            var checked = target.checked;

            if (id === 'agreeAllCheckBox') {
                // 전체동의
                $checkbox.prop('checked', checked);
            }

            // 전체동의
            $inputAgreeAll.prop('checked', $(
                '#agreeCheck, #agreePrivacyCheck, #allowDirectMail').filter(
                ':checked').length === 3);

            // 확인 버튼
            $buttonAgree.prop('disabled', !$inputAgree.is(':checked') || !$inputAgreePrivacy
                .is(
                    ':checked'));
        });

        $inputAllowDirectMail.on('click', function (event) {
            var target = event.target;
            $inputsAllow.prop('checked', target.checked);
        });

        // 닫기
        $btnClose.on('click', function () {
            $checkbox.prop('checked', false);
            $('#agreeAllCheckPage')
                .prop('checked', false)
                .removeClass('partial-selected');

            closeLyPop('agreeTerms');
            setClosingEvent();
        });

        // 확인
        $buttonAgree.on('click', function () {
            $('#agreeAllCheckPage').prop('checked', $inputAgree.is(':checked'));
            if ($inputAgreeAll.prop('checked')) {
                $('#agreeAllCheckPage').removeClass('partial-selected');
            } else if ($inputAgree.prop('checked')) {
                $('#agreeAllCheckPage').addClass('partial-selected');
            }

            closeLyPop('agreeTerms');
            setClosingEvent();
        });
    });

    $(function () {
        // 약관확인 이벤트 처리
        var $agreeContainer = $('.modal-terms-agree');
        var $btnClose = $('#btn-agree-terms-close', $agreeContainer);

        $agreeContainer.each(function () {
            var $checkbox = $('input[type="checkbox"]:not(.toggle)', this);
            var $agreeTermField = $('.agree-term-field');
            var $inputAgreeAll = $checkbox.filter('#agreeAllCheckBox');
            var $inputAgree = $checkbox.filter('#agreeCheck');
            var $inputAgreePrivacy = $checkbox.filter('#agreePrivacyCheck');
            var $inputAgreeGroup = $checkbox.filter('#agreeCheck, #allowDirectMail');
            var $inputAllowDirectMail = $checkbox.filter('#allowDirectMail');
            var $inputsAllow = $('.sub-field input', $agreeTermField);
            var $inputAllowEmail = $checkbox.filter('#allowEmail');
            var $inputAllowSMS = $checkbox.filter('#allowSMS');
            var $buttonAgree = $('#btnAgree', $agreeContainer);

            function setClosingEvent() {
                var event = new CustomEvent("closing", {
                    detail: {
                        isAgreeTermAll: $inputAgreeAll.prop('checked'),
                        isAgreeTerm: $inputAgree.prop('checked'),
                        isAllowDM: $inputAllowDirectMail.prop('checked') ? 1 : 0,
                        isAllowEmail: $inputAllowEmail.prop('checked') ? 1 : 0,
                        isAllowSMS: $inputAllowSMS.prop('checked') ? 1 : 0
                    }
                });
                $agreeContainer[0].dispatchEvent(event);
            }

            // 체크박스
            $checkbox.on('change', function (event) {
                var target = event.target;
                var id = target.id;
                var checked = target.checked;

                if (id === 'agreeAllCheckBox') {
                    // 전체동의
                    $checkbox.prop('checked', checked);
                }

                // 전체동의
                $inputAgreeAll.prop('checked', $(
                    '#agreeCheck, #agreePrivacyCheck, #allowDirectMail').filter(
                    ':checked').length === 3);

                // 확인 버튼
                $buttonAgree.prop('disabled', !$inputAgree.is(':checked') || !$inputAgreePrivacy
                    .is(
                        ':checked'));
            });

            $inputAllowDirectMail.on('click', function (event) {
                var target = event.target;
                $inputsAllow.prop('checked', target.checked);
            });

            // 닫기
            $btnClose.on('click', function () {
                $checkbox.prop('checked', false);
                $('#agreeAllCheckPage')
                    .prop('checked', false)
                    .removeClass('partial-selected');

                closeLyPop('agreeTerms');
                setClosingEvent();
            });

            // 확인
            $buttonAgree.on('click', function () {
                $('#agreeAllCheckPage').prop('checked', $inputAgree.is(':checked'));
                if ($inputAgreeAll.prop('checked')) {
                    $('#agreeAllCheckPage').removeClass('partial-selected');
                } else if ($inputAgree.prop('checked')) {
                    $('#agreeAllCheckPage').addClass('partial-selected');
                }

                closeLyPop('agreeTerms');
                setClosingEvent();
            });
        });
    })
</script>


<main class="sign-up-page">
	<div class="wz container form-container">
		<form method="post" enctype="multipart/form-data" onsubmit="return formCheck();">
			
			<!-- 1페이지 -->
			<div class="page">
				<div class="wz text display2 page-title">
					<h2 class="wz text display2 page-title">회원가입</h2>
				</div>
			
			<div class="row">
			<label>프로필 사진</label>
				<input type='file' id='btnAtt' multiple name="attach" />
				<div id='image_preview'>
					<div id='att_zone'
						data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
				</div>
			  </div>
			  
<div class="field name-field">
				<label class="label">이메일</label> <input type="email" id="mail"
					name="email" required class="input text block large valid"
					autocomplete="off" onblur="emailCheck();">
				<div class="notice"></div>
			</div>
			<div class="field name-field">
				<label class="label">비밀번호</label> <input type="password"
					id="password" name="pw" required class="input text block large"
					autocomplete="off" onblur="pwCheck();">
				<div class="notice"></div>
			</div>
			<div class="field name-field">
				<label class="label">비밀번호 확인</label> <input type="password"
					id="password2" name="pw2" required class="input text block large"
					autocomplete="off" onblur="pw2Check();">
				<div class="notice"></div>
			</div>
			<div class="field name-field">
				<label class="label">닉네임</label> <input type="text" name="nick"
					id="nickName" required class="input text block large"
					autocomplete="off" onblur="nickCheck();">
				<div class="notice"></div>
			</div>
			<div class="field name-field">
				<label>연락처</label> <input type="tel" name="phone" id="number"
					class="input text block large" autocomplete="off"
					onblur="phoneCheck();" placeholder="전화번호 -포함 13자리를 입력해주세요.">
				<div class="notice"></div>
			</div>
			<div class="field name-field">
				<label class="label">생년월일</label> <input type="date" id="birthdDay"
					name="birth" required class="wz input" autocomplete="off"
					onblur="birthCheck();">
			</div>
			<div class="field name-field">
				<label>성별</label> <select name="gender"
					class="input text block large">
					<option value="남자" class="label">남자</option>
					<option value="여자" class="label">여자</option>
					<option value="기타" class="label">기타</option>
				</select>
			</div>

			<div class="wz input">
				<textarea name="intro" rows="5" cols="50" placeholder="자기소개"
					id="intro" oninput="lengCheck();"></textarea>
			</div>
			<div>
				<span id="intro-length" class="label">0</span> / 100
			</div>


		</form>

		<div class="row">
			<button type="button" class="form-btn next">다음으로</button>
		</div>

		<div class="page">
			<main class="sign-up-page">
				<div class="wz container form-container">
					<div class="wz text display2 page-title">
						<h2 class="wz text display2 page-title">회원가입</h2>
					</div>
					<div class="row">
						<label class="label">관심사 설정</label>
					</div>

					<div class="row">
						<select class="input text block large" required name="location">
							<option value="">카테고리선택</option>
							<c:forEach var="category" items="${category}">
								<option value="${category.bigType}">${category.bigType}</option>
							</c:forEach>
						</select> <select class="middle" name="smalltype"></select>
					</div>

					<div id="category-select"></div>
					<div class="row">
						<label class="label">MBTI</label> <br> <select name="mbti"
							class="input text block large">
							<option value="INFP">INFP
							<option>
						</select>
					</div>

					<div class="row">
						<label class="label">코로나 백신접종여부</label> <input type="file"
							name="attach" accept="image/*" class="input text block large">
					</div>
					<button type="button" class="form-btn prev">이전 단계로</button>

					<div class="row">
						<input type="submit" value="가입" class="form-btn">
					</div>

				</div>
			</main>
		</div>
	</div>
</main>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>