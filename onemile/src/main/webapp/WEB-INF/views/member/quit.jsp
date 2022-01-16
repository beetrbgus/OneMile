<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.error {
	margin-top: 10px;
	color: red;
}

.page-body {
	width: 400px;
}

.page-body {
	margin-left: auto;
	margin-right: auto;
	margin-top: 70px;
	margin-bottom: 10px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.bottom-message {
	width: 100%;
	height: 56px;
	text-align: center;
	line-height: 56px;
	font-size: 13px;
	position: relative;
	bottom: auto;
	left: auto;
	margin-top: 12px;
	box-shadow: none;
	background: none;
}

.forgot {
	margin-left: auto;
	margin-right: auto;
	display: inline-block;
	position: relative;
	cursor: pointer;
	padding-left: 24px;
	vertical-align: top;
	font-size: 13px;
	font-weight: 400;
}

#txtSaveId {
	padding-left: 0;
}

.login-action {
	text-align: center;
}
</style>
<script>



function withdrawal(){
	
	if($("input:checkbox[name=confirmed]").is(":checked") == true){
		alert('탈퇴가 성공적으로 완료되었습니다.');	
		$("form").submit();
	}else{
		alert('약관에 동의해 주세요.');	
		return
	}
	
}

function cancel() {
    window.history.back();
}

</script>

<style>
.css-1vu0zgi-WithdrawalContainer {
	box-sizing: border-box;
	max-width: 730px;
	padding: 40px 15px;
	margin: 0px auto;
}

.css-1lj3sn1-WithdrawalTitle {
	margin: 0px 0px 40px;
	font-size: 24px;
	line-height: 32px;
	color: rgb(0, 0, 0);
	font-weight: bold;
}

.css-etu0mm-FormGroupDiv {
	margin: 20px 0px 40px;
}

.css-myaxy0-FormGroupTitle {
	color: rgb(66, 66, 66);
	font-size: 18px;
	font-weight: bold;
	line-height: 24px;
	margin: 0px 0px 20px;
}

.css-o9vtrs-WithdrawalBox {
	margin: 0px 0px 10px;
	padding: 10px 20px;
	border: 1px solid rgb(219, 219, 219);
	font-size: 14px;
	line-height: 21px;
	color: rgb(66, 66, 66);
	border-radius: 4px;
}

.css-etu0mm-FormGroupDiv {
	margin: 20px 0px 40px;
}

._4VN_z {
	flex-direction: row;
	padding-right: 6px;
}

._3xqzr {
	display: inline-flex;
	align-items: center;
	vertical-align: middle;
	width: 100%;
}

._3zqA8 {
	position: relative;
	display: inline-block;
	font-size: 0;
	padding: 9px;
}

._1aN3J {
	font-size: 15px;
}

._3UImz {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	cursor: inherit;
	opacity: 0;
	box-sizing: border-box;
}

._2mDYR {
	display: inline-block;
	width: 22px;
	height: 22px;
	box-sizing: border-box;
	padding: 2px;
	border: 1px solid #ccc;
	border-radius: 4px;
	background-color: #fff;
	color: #fff;
	font-size: 16px;
	line-height: 1;
	transition: color .1s, border-color .1s, background-color .1s;
}

._2UftR {
	width: 1em;
	height: 1em;
}

.css-155vnvm-WithdrawalRequired {
	font-weight: bold;
	color: rgb(255, 119, 119);
}

.css-o9vtrs-WithdrawalBox h3 {
	margin: 10px 0px;
	font-weight: bold;
	font-size: 17px;
	line-height: 23px;
	color: rgb(66, 66, 66);
}

.css-o9vtrs-WithdrawalBox ul {
	margin: 0px 0px 10px 10px;
	list-style-type: disc;
}

.css-o9vtrs-WithdrawalBox li {
	margin: 5px 0px;
}

::marker {
	unicode-bidi: isolate;
	font-variant-numeric: tabular-nums;
	text-transform: none;
	text-indent: 0px !important;
	text-align: start !important;
	text-align-last: start !important;
}

ul {
	padding: 1rem;
}

.css-1ek4v32-WithdrawalActions {
	display: flex;
}

.css-m3n2ud-WithdrawalButton.css-m3n2ud-WithdrawalButton {
	flex: 1 1 auto;
	margin: 0px 5px;
	max-width: 160px;
	border: 1px solid;
	border-color: #dbdbdb;
}

._3s8ZZ._36MJM, ._3s8ZZ:disabled {
	background-color: #dbdbdb;
	border-color: #dbdbdb;
	color: #fafafa;
}

._3Z6oR:disabled {
	cursor: default;
}

.css-m3n2ud-WithdrawalButton.css-m3n2ud-WithdrawalButton {
	flex: 1 1 auto;
	margin: 0px 5px;
	max-width: 160px;
}

._2tsrJ, ._3VkGp {
	font-size: 17px;
	line-height: 26px;
}

._2tsrJ {
	padding: 11px 10px;
}

._3AsCW {
	border: 1px solid;
	background-color: #35c5f0;
	border-color: #35c5f0;
	color: #fff;
}
</style>
<div class="css-1vu0zgi-WithdrawalContainer">
	<h1 class="css-1lj3sn1-WithdrawalTitle">회원탈퇴</h1>
	<div class="css-etu0mm-FormGroupDiv">
		<div class="css-myaxy0-FormGroupTitle">회원 탈퇴 신청에 앞서 아래 내용을 반드시
			확인해주세요.</div>
		<div class="css-nznlwj-FormGroupContent">
			<div class="css-o9vtrs-WithdrawalBox">
				<h3>회원탈퇴 시 처리내용</h3>
				<ul>
					<li>원마일 멤버십은 소멸되며 환불되지 않습니다.</li>
					<li>공동구매 구매 정보가 삭제됩니다.</li>
					<li>소비자보호에 관한 법률 제6조에 의거,계약 또는 청약철회 등에 관한 기록은 5년, 대금결제 및 재화등의
						공급에 관한 기록은 5년, 소비자의 불만 또는 분쟁처리에 관한 기록은 3년 동안 보관됩니다. 동 개인정보는 법률에 의한
						보유 목적 외에 다른 목적으로는 이용되지 않습니다.</li>
				</ul>
				<h3>회원탈퇴 시 게시물 관리</h3>
				<p>회원탈퇴 후 원마일 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을
					확인할 수 없으므로 게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당
					게시물을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.</p>
				<h3>회원탈퇴 시 정보보관</h3>
				<p>
					"개인정보의 수집·이용 목적이 달성”된 이후이므로
					회원정보 및 그동안 이용하셨던 서비스 이용 기록이 지체 없이 삭제됩니다.
					다만 관계법령에 의해 보관해야 하는 정보는 법령이 정한 기간 동안 보관한 후 파기합니다.
				</p>
			</div>
			<div class="css-9fo625-WithdrawalRow e187gapo5">
				<div>
					<label class="_3xqzr _4VN_z"><div class="_3zqA8">
							<input type="checkbox" class="" name="confirmed" id="checkBtn"
								required onblur="CheckForm()">
						</div> <span class="_1aN3J">위 내용을 모두 확인하였습니다.&nbsp;<span
							class="css-155vnvm-WithdrawalRequired e187gapo3">필수</span></span></label>
				</div>

			</div>
		</div>
	</div>
	<div class="css-1ek4v32-WithdrawalActions e187gapo1">
		<form method="post">
			<div class="page-body">
				<main class="account-intro-login">
					<div class="user-sign-container">
						<div class="wz container form-container form-login">

							<div class="field">
								<div class="wz input">
									<input type="password" id="userName" name="pw"
										class="input-text" placeholder="비밀번호 입력" autocomplete="off" />
									<input type="submit" id="btnLogin"
										class="wz button primary block submit-button" value="탈퇴하기"
										onClick="withdrawal()" />
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>

		</form>

	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>