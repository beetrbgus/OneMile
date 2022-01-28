<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.wpurchase-wrap .btn-wrap {
	text-align: center;
}

.wpurchase-wrap h3 em {
	display: inline-block;
	color: rgba(0, 0, 0, 0.84);
	font-size: 24px;
	font-weight: bold;
}

.wpurchase-terms-section .terms-notice-box {
	border: 1px solid #f0f2f5;
}

.outer2 {
	display: flex;
	justify-content: center;
}

.wpurchase-order .order-list li {
	padding: 15px;
	border-bottom: 1px solid #e4e4e4;
}

.wpurchase-order .order-list li .title {
	margin-bottom: 8px;
	font-size: 14px;
	line-height: 17px;
	color: #00c4c4;
}

.wpurchase-order .order-list li .text {
	margin-bottom: 20px;
	font-size: 12px;
	line-height: 16px;
	color: #686868;
}

.wpurchase-order .order-list li .sum {
	font-size: 14px;
	line-height: 24px;
	font-weight: 500;
	text-align: right;
}

.wpurchase-order .order-list li .sum em {
	padding-right: 25px;
}

.wpurchase-order .order-list li .sum {
	font-size: 14px;
	line-height: 24px;
	font-weight: 500;
	text-align: right;
}

.DefaultFundingPrice_container__1gSin {
	line-height: 18px;
	letter-spacing: 0;
	font-size: 12px;
	font-weight: 400;
	font-style: normal;
	margin-top: 8px;
	border: 0.5px solid #cdd3d8;
	border-radius: 4px;
	background-color: #f9fafb;
	padding: 16px;
}

label.Radio_radio__1S1J3>input:checked+.Radio_icon__gDAhN:before {
	background-color: #00c4c4;
}

label.Radio_radio__1S1J3>.Radio_icon__gDAhN:before {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	transition-property: background-color;
	transition-duration: .15s;
	border-radius: 999em;
	background-color: #fff;
	width: 0.5em;
	height: 0.5em;
	content: "";
}

label.Radio_radio__1S1J3>input:checked+.Radio_icon__gDAhN {
	border-color: #00c4c4 !important;
}

label.Radio_radio__1S1J3.Radio_md__36Y-U>.Radio_icon__gDAhN {
	font-size: 20px;
}

label.Radio_radio__1S1J3.Radio_md__36Y-U>span {
	line-height: 28px;
	letter-spacing: -.3px;
	font-size: 16px;
	font-weight: 400;
	font-style: normal;
}

label.Radio_radio__1S1J3>.Radio_icon__gDAhN {
	display: block;
	position: relative;
	transition-property: opacity, border-color, background-color;
	transition-duration: .15s;
	opacity: 1;
	z-index: 1;
	border: 1px solid #cdd3d8;
	border-radius: 999em;
	background-color: #fff;
	width: 1em;
	height: 1em;
	font-size: 1em;
	box-sizing: border-box;
}

.DefaultFundingPrice_container__1gSin .DefaultFundingPrice_title__3ba6Z
	{
	line-height: 20px;
	letter-spacing: 0;
	font-size: 14px;
	font-weight: 700;
	font-style: normal;
	display: inline-flex;
	color: #212529;
}

.DefaultFundingPrice_container__1gSin dl {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 8px;
	color: #495057;
}

.DefaultFundingPrice_container__1gSin .DefaultFundingPrice_totalPrice__x2h8J
	{
	margin-top: 8px;
	color: #212529;
}

.DefaultFundingPrice_container__1gSin dl {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 8px;
	color: #495057;
}

.DefaultFundingPrice_container__1gSin .DefaultFundingPrice_totalPrice__x2h8J em
	{
	line-height: 30px;
	font-size: 20px;
}

.payment-info-container #reward-simplepay-app {
	float: none;
	width: 100%;
	box-sizing: border-box;
}

label.Radio_radio__1S1J3>input:checked+.Radio_icon__gDAhN:before {
	background-color: #00c4c4;
}

label.Radio_radio__1S1J3>.Radio_icon__gDAhN:before {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	transition-property: background-color;
	transition-duration: .15s;
	border-radius: 999em;
	background-color: #fff;
	width: 0.5em;
	height: 0.5em;
	content: "";
}

label.Radio_radio__1S1J3>input:checked+.Radio_icon__gDAhN {
	border-color: #00c4c4 !important;
}

label.Radio_radio__1S1J3.Radio_md__36Y-U>.Radio_icon__gDAhN {
	font-size: 20px;
}

label.Radio_radio__1S1J3.Radio_labeled__1V1EY>.Radio_icon__gDAhN {
	display: inline-block;
	margin-right: 16px;
	vertical-align: middle;
}

label.Radio_radio__1S1J3.Radio_md__36Y-U>span {
	line-height: 28px;
	letter-spacing: -.3px;
	font-size: 16px;
	font-weight: 400;
	font-style: normal;
}

label.Radio_radio__1S1J3>.Radio_icon__gDAhN {
	display: block;
	position: relative;
	transition-property: opacity, border-color, background-color;
	transition-duration: .15s;
	opacity: 1;
	z-index: 1;
	border: 1px solid #cdd3d8;
	border-radius: 999em;
	background-color: #fff;
	width: 1em;
	height: 1em;
	font-size: 1em;
	box-sizing: border-box;
}

.SimplePayPurchase_simplePayPurchase__3IMEe .SimplePayPurchase_radioContainer__3LKI_ .SimplePayPurchase_radioLabel__2-EE1 .SimplePayPurchase_icon__2f9jv
	{
	margin-right: 8px;
	font-size: 24px;
}

.withIcon_icon__2cPeY {
	display: block;
	transform: scale(1);
	transition: transform .3s ease-out;
	width: 1em;
	height: 1em;
	fill: currentColor;
}

.SimplePayPurchase_simplePayPurchase__3IMEe .SimplePayPurchase_radioContainer__3LKI_ .SimplePayPurchase_radioLabel__2-EE1 .SimplePayPurchase_icon__2f9jv
	{
	margin-right: 8px;
	font-size: 24px;
}

.withIcon_icon__2cPeY {
	display: block;
	transform: scale(1);
	transition: transform .3s ease-out;
	width: 1em;
	height: 1em;
	fill: currentColor;
}

label.Radio_radio__1S1J3.Radio_md__36Y-U>span {
	line-height: 28px;
	letter-spacing: -.3px;
	font-size: 16px;
	font-weight: 400;
	font-style: normal;
}

label.Radio_radio__1S1J3 .Radio_label__3LIYq {
	vertical-align: -1px;
	color: #212529;
}

.SimplePayPurchase_simplePayPurchase__3IMEe .SimplePayPurchase_radioContainer__3LKI_ .SimplePayPurchase_radio__3vJtq,
	.SimplePayPurchase_simplePayPurchase__3IMEe .SimplePayPurchase_radioContainer__3LKI_ .SimplePayPurchase_radioLabel__2-EE1
	{
	display: flex;
	align-items: center;
}

.payment-info-container {
	position: relative;
	padding-bottom: 60px;
}

.payment-info-container #wpurchaseReserveNotice {
	float: none;
	margin-bottom: 0;
	box-sizing: border-box;
}

.wpurchase-notice {
	margin-bottom: 42px;
}

#payment-system-notice li, #wpurchaseReserveNotice li {
	margin: 0;
	position: relative;
	list-style: none;
	font-size: 13px;
	line-height: 1.54;
	color: rgba(0, 0, 0, 0.54);
}

.wpurchase-notice li {
	font-size: 12px;
	line-height: 16px;
	margin-bottom: 10px;
	list-style-type: disc;
}

.wpurchase-terms-section .terms-notice-box .doing-all-agree {
	border-bottom: 1px solid #f0f2f5;
	font-weight: bold;
}

.wpurchase-terms-section .terms-notice-box label {
	padding: 14px;
}

.wpurchase-terms-section .terms-notice-box label span {
	padding-left: 28px;
}
</style>

<input type="hidden" value="${sessionScope.logNo}">
<input type="hidden" value="${sessionScope.logId}">
<input type="hidden" value="${confirmVO.quantity}">
<input type="hidden" name="totalAmount" value="${confirmVO.price}">
<input type="hidden" value="${confirmVO.productName}">
<input type="hidden" name="type" value="정기">

<div class="outer2">
	<div class="wpurchase-wrap" style="width: 700px">
		
		<form name="purchaseForm" id="purchaseForm" method="post" action="${pageContext.request.contextPath}/membership/confirm">
			
			<input type="hidden" name="productNo" value="${confirmVO.productNo}">
			<input type="hidden" name="quantity" value="${confirmVO.quantity}">
			
			<h2 class="wz text display2 page-title" style="margin-top: 70px;">주문서 확인</h2>
			<hr>
			<div class="wpurchase-order" style="margin-top: 70px;">
				<div class="order-list" data-choiced-legnth="1">
					<ul>
						<li>
							<p class="title" style="font-size: x-large;">[${confirmVO.productName}]</p>
							<p class="text" style="font-size: middle;">
							멤버십혜택 : 닉네임변경 시간단축, 소셜링 생성갯수 및 참가인원 확대</p>
							<div class="info">

								<p class="sum">
									<em></em>${confirmVO.totalAmount}원
								</p>
							</div>
						</li>



					</ul>
				</div>
				<div class="order-addinfo">
					<dl>


					</dl>
					<dl>


					</dl>

				</div>
				<div id="reward-funding-price-app" data-discount-shipping-charge="0"
					data-funding-price="69000" data-add-donation="0"
					data-shipping-charge="3500">
					<div>
						<div class="DefaultFundingPrice_container__1gSin">
							<div class="DefaultFundingPrice_title__3ba6Z">
							주문서 확인
							</div>
							
							<dl class="DefaultFundingPrice_totalPrice__x2h8J">
								<dt>최종결제금액</dt>
								<dd>
									<em>${confirmVO.totalAmount}</em>원
								</dd>
							</dl>
						</div>
						
					</div>
				</div>
			</div>
			<div class="wpurchase-delivery-wrap">

				<hr>
				<br>
			</div>
			<div class="payment-info-container">
				<!-- 결제 정보 (간편결제 / 직접입력) 앱 -->
				<div id="reward-simplepay-app" data-type="purchase"
					data-is-donation-category="false"
					data-recent-payment-type="sbcredit"
					data-is-available-installment="true">
					<h3 class="SimplePayContainer_title__1AD2x">결제 정보</h3>
					<div class="SimplePayPurchase_simplePayPurchase__3IMEe"
						data-selected-pay-type="sbcredit">
						<div class="SimplePayPurchase_payType__277Y0">
							<div class="SimplePayPurchase_radioContainer__3LKI_">
								<label
									class="Radio_radio__1S1J3 Radio_md__36Y-U Radio_labeled__1V1EY SimplePayPurchase_radio__3vJtq"><input
									type="radio" value="sbcredit" checked=""><span
									class="Radio_icon__gDAhN"></span><span
									class="Radio_label__3LIYq"><div
											class="SimplePayPurchase_radioLabel__2-EE1">

											<span>카카오 간편결제</span>
										</div></span></label>
							</div>
							<div
								class="SimplePayCard_simplecard__1bVno SimplePayCard_purchase__2GiS0 SimplePayCard_noInfo__UZVmq">
								<div class="SimplePayCard_unregisted___0bUq"></div>
								<div class="SimplePayCard_registed__EtapQ">
									<div class="SimplePayCard_creditCard__ytBmr">
										<span class="SimplePayCard_cardName__1d4sO">카드</span>
										<button type="button" class="SimplePayCard_editButton__2PlF7">변경</button>
										<div class="SimplePayCard_cardNumber__b42bv"></div>
										<span class="SimplePayCard_createdAt__1NOc7">등록일: <span>YYYY.
												MM. DD</span></span>
									</div>
									<div class="SimplePayCard_notice__gpsgQ">
										<em>할부는 직접 입력으로만 이용 가능합니다.</em>
									</div>
								</div>
							</div>
						</div>
						<div class="SimplePayPurchase_payType__277Y0"></div>
					</div>
					<input type="hidden" name="has-simplepay-info" value="false">
				</div>
				<!-- 결제 예약시 유의사항 -->
				<div id="wpurchaseReserveNotice" class="wpurchase-notice">
					<p class="title">결제 예약시 유의사항</p>
					<ul>
						<li>결제실행일에 결제자 귀책사유(한도초과, 이용정지 등)로 인하여 결제가 실패할 수 있으니, 결제수단이
							유효한지 한번 확인하세요.</li>
						<li>1차 결제 실패 시 실패일로부터 3 영업일 동안 재 결제를 실행합니다.</li>

					</ul>
				</div>
			</div>
		

		<div class="wpurchase-terms wpurchase-terms-section">
			<h3>
				<em>약관 동의</em>
			</h3>
			<div class="terms-notice-box">
				<label class="wz checkbox circular doing-all-agree"> <input
					id="acceptAllCheckBox" class="notice-confirm-checkbox check-all"
					type="checkbox" name="check1" value="Y" autocomplete="off"
					oninput="checkToggle2();"> <span>전체 동의하기</span>
				</label>
				<div id="eachTermsNoticeWrap">
					<div class="term-checkbox-wrap">
						<label class="wz checkbox circular"> <input
							id="personalInfoAgreementForThirdPartiesCheckBox"
							class="notice-confirm-checkbox chxbox" type="checkbox" name="check1"
							value="Y" autocomplete="off" onchange="eachTermsChanged()" required>
							<span>개인정보 제3자 제공 동의</span>
						</label> <span class="show-term"
							onclick="showLyPop('personalInfoAgreementForThirdParties');"></span>
						<div id="personalInfoAgreementForThirdPartiesLypop"
							class="agree-popup" style="display: none;">
							<div class="agree-popup-header">
								<h4>개인정보 제3자 제공 동의</h4>
							</div>
							<div class="agree-popup-body">
								<p>
									'펀딩하기'를 통한 결제 및 리워드 전달 서비스를 제공하기 위해, 이용자의 사전 동의 아래 제3자(프로젝트
									메이커)에게 제공합니다.<br> 메이커에게 전달되는 개인 정보는 기재된 목적 달성 후 파기에 대한 책임이
									메이커에게 있으며, 파기하지 않아 생기는 문제에 대한 법적 책임은 메이커에게 있습니다.<br> 아래
									내용에 대하여 동의를 거부하실 수 있으며, 거부 시 서비스 이용이 제한됩니다. <br> <br>
								</p>
								<p class="bold">개인정보 제3자 제공 내역</p>
								<table class="">
									<colgroup>
										<col width="30%">
										<col width="70%">
									</colgroup>
									<tbody>
										<tr>
											<th>제공받는자</th>
											<td class="bold">가즘</td>
										</tr>
										<tr>
											<th>목적</th>
											<td class="bold">리워드 펀딩 정보 확인 및 발송, 리워드 발송과 관련된 공지 및
												민원처리</td>
										</tr>
										<tr>
											<th>항목</th>
											<td>서포터 정보(이름, 이메일, 휴대폰 번호), 수취인 정보(이름, 휴대폰 번호, 주소, 배송 시
												요청사항)</td>
										</tr>
										<tr>
											<th>제공받는 자의 보유 및 이용 기간</th>
											<td class="bold">펀딩 마감 후 1년</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="agree-popup-footer">
								<button type="button" class="wz button less primary"
									onclick="closeAgreePopup('personalInfoAgreementForThirdParties');">확인
								</button>
							</div>
						</div>
					</div>
					<div class="term-checkbox-wrap">
						<label class="wz checkbox circular"> <input
							id="AcceptanceOfLiabilityCheckBox"
							class="notice-confirm-checkbox chxbox" type="checkbox" name="check1"
							value="Y" autocomplete="off" onchange="eachTermsChanged()">
							<span>책임 규정에 대한 동의</span>
						</label> <span class="show-term"
							onclick="showLyPop('AcceptanceOfLiability');"></span>
						<div id="AcceptanceOfLiabilityLypop" class="agree-popup"
							style="display: none;">
							<div class="agree-popup-header">
								<h4>책임 규정에 대한 동의</h4>
							</div>
							<div class="agree-popup-body">
								<p>와디즈는 플랫폼을 제공하는 중개자로 크라우드펀딩을 받는 당사자가 아닙니다. 보상품 제공 등에 관한
									지연, 제품의 하자 등으로 인한 일체의 법적책임은 펀딩을 받는 프로젝트 개설자가 부담합니다. 하지만, 와디즈는
									프로젝트 진행자와 후원자간의 원활한 의사소통을 위해 최선의 노력을 다하고 있습니다.</p>
							</div>
							<div class="agree-popup-footer">
								<button type="button" class="wz button less primary"
									onclick="closeAgreePopup('AcceptanceOfLiability');">확인
								</button>
							</div>
						</div>
					</div>
					<div class="term-checkbox-wrap electronicFinancialTransactionWrap"
						style="display: none;">
						<label class="wz checkbox circular"></label> <span
							class="show-term"
							onclick="showLyPop('electronicFinancialTransaction');"></span>
						<div id="electronicFinancialTransactionLypop" class="agree-popup"
							style="display: none;">
							<div class="agree-popup-header">
								<h4>전자금융거래 이용약관</h4>
							</div>
							<div class="agree-popup-body">
								<article>
									<h1>전자금융거래 이용약관</h1>
									<p>와디즈(주)가 제공하는 전자금융거래서비스의 이용에 필요한 사항을 규정합니다.</p>
									<div class="update">
										<h5>업데이트 노트</h5>
										<ul>
											<li>본 이용약관은 2021년 1월 12일부터 시행됩니다.</li>
											<li>시행 2021. 7. 1</li>
										</ul>
									</div>
									<ol class="table">
										<li><a href="#제1장-총칙">제1장 총칙</a></li>
										<li><a href="#제2장-전자지급결제대행-서비스">제2장 전자지급결제대행 서비스</a></li>
										<li><a href="#제3장-결제대금예치서비스">제3장 결제대금예치서비스</a></li>
										<li><a href="#제4장-선불전자지급수단의-발행-및-관리">제4장 선불전자지급수단의 발행
												및 관리</a></li>
									</ol>
									<hr>
									<h2 id="제1장-총칙">제1장 총칙</h2>
									<h3>제1조 (목적)</h3>
									<p>본 약관은 와디즈 주식회사(이하 "회사"라 합니다)가 제공하는 전자지급결제대행서비스,
										결제대금예치서비스 및 선불전자지급수단의 발행 및 관리서비스(이하 "전자금융거래서비스"라 합니다)를 "회원"이
										이용함에 있어, "회사"와 "회원" 간 권리, 의무 및 "회원"의 서비스 이용절차 등에 관한 사항을 규정하는
										것을 그 목적으로 합니다.</p>
									<h3>제2조 (정의)</h3>
									<ol>
										<li>본 약관에서 정한 용어의 정의는 아래와 같습니다.
											<ol>
												<li>"전자금융거래"라 함은 "회사"가 "전자적 장치"를 통하여 전자금융업무를 제공하고,
													"회원"이 "회사"의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는
													거래를 말합니다.</li>
												<li>"전자지급거래"라 함은 자금을 주는 자가 "회사"로 하여금 전자지급수단을 이용하여 자금을
													받는 자에게 자금을 이동하게 하는 "전자금융거래"를 말합니다.</li>
												<li>"전자적 장치"라 함은 "전자금융거래"정보를 전자적 방법으로 전송하거나 처리하는 데 이용되는
													장치로서 현금자동지급기, 자동입출금기, 지급용단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 정보를
													전송하거나 처리하는 장치를 말합니다.</li>
												<li>"접근매체"라 함은 "전자금융거래"에 있어서 "거래지시"를 하거나 이용자 및 거래내용의
													진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 "전자금융거래서비스"를 이용하기 위하여
													"회사"에 등록된 아이디 및 비밀번호, 기타 "회사"가 지정한 수단을 말합니다.</li>
												<li>"아이디"란 "회원"의 식별과 서비스 이용을 위하여 "회원"이 설정하고 "회사"가 승인한
													숫자와 문자의 조합을 말합니다.</li>
												<li>"비밀번호"라 함은 "회원"의 동일성 식별과 "회원" 정보의 보호를 위하여 "회원"이
													설정하고 "회사"가 승인한 숫자와 문자의 조합을 말합니다.</li>
												<li>"회원"이라 함은 본 약관에 동의하고 본 약관에 따라 "회사"가 제공하는
													"전자금융거래서비스"를 이용하는 자를 말합니다.</li>
												<li>"거래지시"라 함은 "회원"이 본 약관에 따라 "회사"에게 "전자금융거래"의 처리를 지시하는
													것을 말합니다.</li>
												<li>"오류"라 함은 "회원"의 고의 또는 과실 없이 "전자금융거래"가 본 약관 또는 "회원"의
													"거래지시"에 따라 이행되지 아니한 경우를 말합니다.</li>
												<li>“사이트”라 함은 회사가 운영하는 와디즈 사이트(www.wadiz.kr)를 의미합니다.</li>
											</ol>
										</li>
										<li>본 조 및 본 약관의 다른 조항에서 정의한 것을 제외하고는 전자금융거래법 등 관련 법령에 정한
											바에 따릅니다.</li>
									</ol>
									<h3>제3조 (약관의 명시 및 변경)</h3>
									<ol>
										<li>"회사"는 "회원"이 "전자금융거래"를 하기 전에 본 약관을 사이트에 게시하고 본 약관의 중요한
											내용을 확인할 수 있도록 합니다.</li>
										<li>"회사"는 "회원"의 요청이 있는 경우 전자문서의 전송(전자우편을 이용한 전송을 포함합니다)의
											방식에 의하여 본 약관의 사본을 "회원"에게 교부합니다.</li>
										<li>"회사"가 본 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 금융거래정보 입력화면
											또는 회사가 운영하는 사이트에 게시함으로써 "회사"에게 공지합니다. 다만, 법령의 개정으로 인하여 긴급하게
											약관을 변경한 때에는 변경된 약관을 서비스 이용 초기화면 등에 1개월 이상 게시하고 "회사"에게 사후
											통지합니다.</li>
										<li>이용자는 변경에 동의하지 아니한 경우 제3항의 고지나 통지를 받은 날로부터 30일 이내에 계약을
											해지할 수 있으며, 계약해지의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 봅니다.</li>
									</ol>
									<h3>제4조 (거래내용의 확인)</h3>
									<ol>
										<li>"회사"는 인터넷사이트 등에 조회 화면을 통하여 "회원"의 거래내용("회원"의 "오류정정
											요구사실 및 처리결과에 관한 사항"을 포함합니다)을 확인할 수 있도록 합니다. 단, 전자적 장치의 운영 장애
											또는 그 밖의 사유로 거래내용을 확인하게 할 수 없는 때에는 즉시 회사의 인터넷사이트에 그 사유를 알리고, 그
											사유가 종료된 때부터 이용자가 거래내용을 확인할 수 있도록 합니다.</li>
										<li>“회원”은 “회사”에게 거래내용에 관한 서면의 교부를 요청할 수 있습니다.</li>
										<li>"회사"는 제2항에 따른 "회원"의 거래내용 서면교부 요청을 받은 경우 2주 이내에 전자문서의
											전송(전자우편을 이용한 전송을 포함합니다), 모사전송, 우편 또는 직접 교부의 방법으로 거래내용에 관한 서면을
											해당 이용자에게 교부합니다. 단, 회사가 전자적 장치의 운영장애, 그 밖의 이유로 거래내용에 관한 서면을
											교부할 수 없는 때에는 즉시 "회원"에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한
											사유를 알려야 하며, 전자적 장치의 운영장애 등의 사유로 거래내용을 제공할 수 없는 기간은 본항의 거래내용에
											관한 서면의 교부기간에 산입하지 아니합니다.</li>
										<li>제1항의 대상이 되는 거래내용 중 대상기간이 5년인 것은 다음 각호와 같습니다.
											<ol>
												<li>거래계좌의 명칭 또는 번호</li>
												<li>전자금융거래의 종류 및 금액</li>
												<li>전자금융거래상대방을 나타내는 정보</li>
												<li>전자금융거래일시</li>
												<li>"전자적 장치"의 종류 및 "전자적 장치"를 식별할 수 있는 정보</li>
												<li>"회사"가 "전자금융거래"의 대가로 받은 수수료</li>
												<li>"회원"의 출금 동의에 관한 사항</li>
												<li>해당 "전자금융거래"와 관련한 "전자적 장치"의 접속기록</li>
												<li>"전자금융거래"의 신청 및 조건의 변경에 관한 사항</li>
												<li>건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록</li>
											</ol>
										</li>
										<li>제1항의 대상이 되는 거래내용 중 대상기간이 1년인 것은 다음 각호와 같습니다.
											<ol>
												<li>전자지급수단 이용과 관련된 거래승인에 관한 기록</li>
												<li>"회원"의 오류정정 요구사실 및 처리결과에 관한 사항</li>
												<li>기타 금융위원회가 고시로 정한 사항</li>
												<li>건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록</li>
											</ol>
										</li>
										<li>“회원”이 제2항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수
											있습니다.
											<ul>
												<li>주소 : 경기도 성남시 분당구 판교로 242 A동 4층</li>
												<li>이메일주소 : info@wadiz.kr</li>
												<li>전화번호 : 1661 - 9056</li>
											</ul>
										</li>
									</ol>
									<h3>제5조 ("거래지시"의 철회 등)</h3>
									<p>"회원"이 "회사"의 "전자금융거래서비스"를 이용하여 전자지급거래를 한 경우, "회원"은 지급의
										효력이 발생하기 전까지 본 약관에서 정한 바에 따라 제4조 제5항에 기재된 연락처로 전자문서의 전송(전자우편을
										이용한 전송을 포함합니다) 또는 사이트 내 철회에 의한 방법으로 "거래지시"를 철회할 수 있습니다. 단, 각
										서비스 별 "거래지시" 철회의 효력 발생시기는 본 약관 제15조, 제20조 및 제25조에서 정한 바에 따릅니다.</p>
									<h3>제6조 ("오류"의 정정 등 )</h3>
									<ol>
										<li>"회원"은 "전자금융거래서비스"를 이용함에 있어 "오류"가 있음을 안 때에는 "회사"에 대해 그
											정정을 요구할 수 있으며, "회사"는 "회원"의 정정 신청이 있는 경우 이를 조사하여 "오류"가 있는 경우
											정정 절차를 진행하고 정정요구를 받은 날로부터 2주 이내에 그 결과를 "회원"에게 알려 드립니다.</li>
										<li>"회사"는 스스로 "전자금융거래"에 "오류"가 있음을 안 때에도 이를 즉시 조사하여 처리한 후
											그 결과를 2주 이내에 문서, 전화 또는 전자우편으로 "회원"에게 알려 드립니다.</li>
									</ol>
									<h3>제7조 ("전자금융거래" 기록의 생성 및 보존)</h3>
									<ol>
										<li>"회사"는 "회원" 이용한 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한
											경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.</li>
										<li>제1항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제4조 제3항 및
											제4항에서 정한 바에 따릅니다.</li>
									</ol>
									<h3>제8조 ("전자금융거래"정보의 제공금지)</h3>
									<ol>
										<li>"회사"는 "전자금융거래서비스"를 제공함에 있어서 취득한 "회원"의 인적 사항, "회원"의
											계좌, "접근매체" 및 "전자금융거래"의 내용과 실적에 관한 정보 또는 자료를 법령에 의하거나 "회원"의
											동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무 상 목적 외에 사용하지 아니합니다.</li>
										<li>"회사"는 "회원"이 안전하게 "전자금융거래서비스"를 이용할 수 있도록 "회원"의 개인정보보호를
											위하여 개인정보취급방침을 운용합니다. "회사"의 개인정보취급방침은 "회사"가 운영하는 사이트에서 확인할 수
											있습니다.</li>
									</ol>
									<h3>제9조 ("회사"의 책임)</h3>
									<ol>
										<li>"회사"는 "접근매체"의 위조나 변조로 발생한 사고(단, "회사"가 "접근매체"의 발급
											주체이거나 사용, 관리 주체인 경우), 계약체결 또는 "거래지시"의 전자적 전송이나 처리과정에서 발생한 사고로
											인하여 "회원"에게 손해가 발생한 경우에는 그 손해를 배상할 책임을 부담합니다.</li>
										<li>"회사"는 제1항에도 불구하고 다음 각호의 경우에는 그 책임의 전부 또는 일부를 "회원"이
											부담하게 할 수 있습니다.
											<ol>
												<li>"회원"이 "접근매체"를 제3자에게 대여하거나 그 사용을 위임한 경우 또는 양도나 담보의
													목적으로 제공한 경우</li>
												<li>제3자가 권한 없이 "회원"의 "접근매체"를 이용하여 "전자금융거래"를 할 수 있음을
													알았거나 쉽게 알 수 있었음에도 불구하고 "접근매체"를 누설하거나 노출 또는 방치한 경우</li>
												<li>법인("중소기업기본법" 제2조 제2항에 의한 소기업을 제외합니다)인 "회원"에게 손해가
													발생한 경우로서 "회사"가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로
													요구되는 충분한 주의의무를 다한 경우</li>
											</ol>
										</li>
										<li>"회사"는 전자금융거래를 위한 전자적 장치 또는 '정보통신망 이용촉진 및 정보보호 등에 관한
											법률' 제 2조 제 1항 제 1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한
											접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이
											있습니다.</li>
										<li>"회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체의 사유가 발생하여 전자금융서비스의 제공을
											일시적으로 중단할 경우에는 "회사"의 사이트를 통하여 이용자에게 중단 일정 및 중단 사유를 사전에 공지합니다.</li>
									</ol>
									<h3>제10조 (분쟁처리 및 분쟁조정)</h3>
									<ol>
										<li>"회원"은 "회사"의 사이트 하단에 게시된 분쟁처리 담당자에 대하여 "전자금융거래"와 관련한
											의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.</li>
										<li>"회원"이 "회사"에 대하여 분쟁처리를 신청한 경우에는 "회사"는 15일 이내에 이에 대한 조사
											또는 처리 결과를 "회원"에게 안내 합니다.</li>
										<li>"회원"은 "회사"의 분쟁처리결과에 대하여 이의가 있을 경우 "금융위원회의 설치 등에 관한
											법률" 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 "소비자기본법" 제60조 제1항의 규정에 따른
											한국소비자원의 소비자분쟁조정위원회에 "회사"의 "전자금융거래서비스"의 이용과 관련한 분쟁조정을 신청할 수
											있습니다.</li>
									</ol>
									<h3>제11조 ("회사"의 안정성 확보 의무)</h3>
									<p>"회사"는 전자금융거래가 안전하게 처리될 수 있도록 선량한 관리자로서의 주의를 다하며,
										"전자금융거래"의 안정성과 신뢰성을 확보할 수 있도록 "전자금융거래"의 종류 별로 전자적 전송이나 처리를 위한
										인력, 시설, "전자적 장치" 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.</p>
									<h3>제12조 (약관 외 준칙)</h3>
									<p>"회사"와 "회원" 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을
										이 약관에 우선하여 적용합니다. 본 약관에서 정하지 아니한 사항(용어의 정의 포함)에 대하여는 전자금융거래법,
										여신전문금융업법 등 소비자보호에 관한 법령 및 개별 약관에서 정한 바에 따릅니다.</p>
									<h3>제13조 (관할)</h3>
									<p>"회사"와 "회원" 간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.</p>

									<h2 id="제2장-전자지급결제대행-서비스">제2장 전자지급결제대행 서비스</h2>
									<h3>제14조 (정의)</h3>
									<p>본 장에서 정하는 용어의 정의는 아래와 같습니다.</p>
									<ol>
										<li>"전자지급결제대행 서비스"라 함은 전자적 방법으로 재화 또는 용역(이하 이 약관에서 "재화
											등"이라고 합니다)의 구매에 있어서 지급결제 정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나
											매개하는 서비스를 말합니다.</li>
										<li>"회원"이라 함은 본 약관에 동의하고 "회사"가 제공하는 "전자지급결제대행 서비스"를 이용하는
											자를 말합니다.</li>
									</ol>
									<h3>제15조 ("거래지시"의 철회)</h3>
									<ol>
										<li>"회원"이 "전자지급결제대행서비스"를 이용한 경우, 이용자는 "거래지시"된 금액의 정보에 대하여
											수취인의 계좌가 개설되어 있는 금융기관 또는 "회사"의 계좌의 원장에의 입금기록 또는 "전자적 장치"에의
											입력이 끝나기 전까지 "거래지시"를 철회할 수 있습니다.</li>
										<li>"회사"는 "회원"의 "거래지시"의 철회에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을
											"회원"에게 반환하여야 합니다.</li>
									</ol>
									<h3>제16조 ("한도" 등)</h3>
									<p>"회사"의 정책 및 결제업체(이동통신사, 카드사 등)의 기준에 따라 "회원"의 결제수단 별 월 누적
										결제액 및 결제한도가 제한될 수 있습니다.</p>
									<h3>제17조 ("접근매체"의 관리)</h3>
									<ol>
										<li>"회사"는 "전자지급결제대행 서비스" 제공 시 "접근매체"를 선정하여 "회원"의 신원, 권한 및
											"거래지시"의 내용 등을 확인합니다.</li>
										<li>"회원"은 "접근매체"를 사용함에 있어서 다른 법률에 특별한 규정이 없는 한 다음 각 호의
											행위를 하여서는 아니 됩니다.
											<ol>
												<li>"접근매체"를 양도하거나 양수하는 행위</li>
												<li>"접근매체"를 대여하거나 사용을 위임하는 행위</li>
												<li>"접근매체"를 질권 기타 담보 목적으로 하는 행위</li>
												<li>1호부터 3호까지의 행위를 알선하는 행위</li>
											</ol>
										</li>
										<li>"회원"은 자신의 "접근매체"를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며,
											"접근매체"의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.</li>
										<li>"회사"는 "회원"으로부터 "접근매체"의 분실이나 도난 등의 통지를 받은 때에는 그 때부터
											제3자가 그 "접근매체"를 사용함으로 인하여 "회원"에게 발생한 손해를 배상할 책임이 있습니다.</li>
									</ol>

									<h2 id="제3장-결제대금예치서비스">제3장 결제대금예치서비스</h2>
									<h3>제18조 (정의)</h3>
									<p>본 장에서 사용하는 용어의 정의는 다음과 같습니다.</p>
									<ol>
										<li>"결제대금예치서비스"라 함은 회사의 사이트에서 연결되는 와디즈 스토어 페이지에서 이루어지는
											선불식 통신판매에 있어서, "회사"가 "소비자"가 지급하는 결제 대금을 예치하고 배송이 완료되는 등 구매가
											확정된 후 "재화 등"의 대금을 "판매자"에게 지급하는 서비스를 말합니다.</li>
										<li>"선불식 통신판매"라 함은 "소비자"가 "재화 등"을 공급받기 전에 미리 대금의 전부 또는
											일부를 지급하는 방식의 통신판매를 말합니다.</li>
										<li>"판매자"라 함은 본 약관에 동의하고 "회사"가 운영하는 서비스에 입점하여 통신판매를 하는 자를
											말합니다.</li>
										<li>"소비자"라 함은 본 약관에 동의하고 "회사"의 서비스에 입점한 "판매자"로부터 "재화 등"을
											구매하는 자로서 전자상거래 등에 서의 소비자보호에 관한 법률 제2조 제5호의 요건에 해당하는 자를 말합니다.</li>
										<li>"이용자"라 함은 본 조 제3호 및 제4호의 "판매자"와 "소비자"를 말합니다.</li>
									</ol>
									<h3>제19조 (예치된 결제대금의 지급방법)</h3>
									<ol>
										<li>"소비자"(그 "소비자"의 동의를 얻은 경우에는 "재화 등"을 공급받을 자를 포함한다. 이하
											제2항 및 제3항에서 같습니다)는 "재화 등"을 공급받은 사실을 "재화 등"을 공급받은 날부터 3영업일 이내에
											"회사"에 통보하여야 합니다.</li>
										<li>"회사"는 "소비자"로부터 "재화 등"을 공급받은 사실을 통보 받을 경우 "회사"가 정한 기일
											내에 판매자에게 결제대금을 지급합니다.</li>
										<li>"회사"는 "소비자"가 "재화 등"을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시
											없이 그 공급받은 사실을 "회사"에 통보하지 아니하는 경우에 "소비자"의 동의 없이 "판매자"에게 결제대금을
											지급할 수 있습니다.</li>
										<li>"회사"가 "판매자"에게 결제대금을 지급하기 전에 "소비자"가 그 결제대금을 환급 받을 정당한
											사유가 발생한 경우에는 그 결제대금을 "소비자"에게 환급합니다.</li>
									</ol>
									<h3>제20조 (거래지시의 철회)</h3>
									<ol>
										<li>"이용자"가 "결제대금예치서비스"를 이용한 경우, "이용자"는 거래 지시된 금액의 정보가
											수취인이 지정한 전자적 장치에 도달한 때까지 거래지시를 철회할 수 있습니다.</li>
										<li>"회사"는 "소비자"로부터 "재화 등"을 공급받은 사실을 통보 받을 경우 "회사"가 정한 기일
											내에 판매자에게 결제대금을 지급합니다.</li>
										<li>"회사"는 "이용자"의 거래지시의 철회에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을
											"이용자"에게 반환하여야 합니다.</li>
									</ol>
									<h3>제21조 (준용규정)</h3>
									<p>제17조는 본 장에 준용합니다.</p>

									<h2 id="제4장-선불전자지급수단의-발행-및-관리">제4장 선불전자지급수단의 발행 및 관리</h2>
									<h3>제22조 (정의)</h3>
									<ol>
										<li>본 장에서 사용하는 용어의 정의는 다음과 같습니다.
											<ol>
												<li>"선불전자지급수단"이라 함은 포인트, 쿠폰 등 "회사"가 미리 "회원"에게 회원가입약관을
													통해 고지한 전자금융거래법 상 선불전자지급수단을 말합니다.</li>
												<li>"회원"이라 함은 본 약관에 동의하고 메이커, 판매자로부터 "재화 등"을 펀딩 또는 구매하고
													선불전자지급수단을 결제수단으로 하여 그 대가를 지급하는 자를 말합니다.</li>
											</ol>
										</li>
										<li>본 장에서 정하지 않은 용어는 회원가입약관에서 정한 바에 따릅니다.</li>
									</ol>
									<h3>제23조 ("접근매체"의 관리)</h3>
									<p>제17조는 본 장에 준용합니다.</p>
									<h3>제24조 ("거래지시"의 철회)</h3>
									<p>"회원"이 "선불전자지급수단"을 이용하여 자금을 지급하는 경우, "회원"은 거래 지시된 금액의 정보가
										수취인이 지정한 "전자적 장치"에 도달하기 전까지 "거래지시"를 철회할 수 있습니다.</p>
									<h3>제25조 (소멸시효)</h3>
									<p>"선불전자지급수단" 중 포인트의 소멸시효는 적립일로부터 5년이며, 쿠폰의 소멸시효는 개별 안내되는
										기간에 따릅니다. "회원"은 "회사"가 정한 소멸시효 내에서만 "선불전자지급수단"을 사용할 수 있습니다.</p>
									<h3>제26조 (기타)</h3>
									<p>"회사"는 선불전자지급수단의 보증보험 상품에 가입하였습니다.</p>
								</article>
							</div>
							<div class="agree-popup-footer">
								<button type="button" class="wz button less primary"
									onclick="closeAgreePopup('electronicFinancialTransaction');">확인
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="btn-wrap">
			<br> <br> <br>
			<hr>
			<button type="submit" id="btn-submit" onclick="purchaseReservation()"
				class="wz primary button">결제하기</button>
				
		</div>
		<!-- 간편결제 예약 앱 -->
		<div id="reward-reservation-app" data-reservation-info="null"></div>
		</form>
	</div>
	
</div>
<script>
var selected = 0;
var checkbox = $("#acceptAllCheckBox");
$(".chxbox").change(function() {
    if(this.checked) {
    	selected++;
    	
    }
    else{
    	selected--;
    	
    }
    
    if($(".chxbox").length == selected){
    	
    	checkbox.prop("checked",true);
    }else{
    	checkbox.prop("checked",false);
    }
});

function checkToggle2(){
    var checkbox = document.querySelector(".check-all");
    var checkboxList = document.querySelectorAll("input[type=checkbox]:not(.check-all)");

    for(var i=0; i < checkboxList.length; i++){
        checkboxList[i].checked = checkbox.checked;
    }
}
</script>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>