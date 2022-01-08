<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
    .wpurchase-order .order-list {
        border-top: 1px solid #666;
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

    .DefaultFundingPrice_container__1gSin .DefaultFundingPrice_title__3ba6Z {
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

    .DefaultFundingPrice_container__1gSin .DefaultFundingPrice_totalPrice__x2h8J {
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

    .SimplePayPurchase_simplePayPurchase__3IMEe .SimplePayPurchase_radioContainer__3LKI_ {
        display: flex;
        align-items: center;
    }

    .SimplePayPurchase_simplePayPurchase__3IMEe .SimplePayPurchase_radioContainer__3LKI_ .SimplePayPurchase_badge__3NIVz {
        margin-left: auto;
    }

    .SimplePayPurchase_simplePayPurchase__3IMEe .SimplePayPurchase_simplePayBadge__1Px25 {
        line-height: 14px;
        letter-spacing: 0;
        font-size: 10px;
        font-weight: 700;
        font-style: normal;
        position: relative;
        border-radius: 12px;
        background-color: #2ed5d5;
        padding: 5px 7px;
        color: #fff;
    }

    .DefaultFundingPrice_container__1gSin .DefaultFundingPrice_totalPrice__x2h8J em {
        line-height: 30px;
        font-size: 20px;
    }

    label.Radio_radio__1S1J3>input:checked+.Radio_icon__gDAhN:before {
        background-color: #00c4c4;
    }

    label.Radio_radio__1S1J3>input:focus+span:before,
    label.Radio_radio__1S1J3>input:hover+span:before {
        border-color: #00c4c4;
        background-color: #f9fafb;
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
    
</style>

	<input type="hidden" value="${sessionScope.logNo}">
	<input type="hidden" value="${sessionScope.logId}">
	<input type="hidden" value="${confirmVO.quantity}">
	<input type="hidden" name="totalAmount" value="${confirmVO.price}">
	<input type="hidden" value="${confirmVO.productName}">
	<input type="hidden" name="type" value="정기">
	
	<div>
		${confirmVO.productNo}	/ ${confirmVO.productName} / ${confirmVO.totalAmount} / ${confirmVO.quantity}
	</div> 
	
<form action="/pay/confirm" method="POST">
	<input type="hidden" name="productNo" value="${confirmVO.productNo}">
	<input type="hidden" name="quantity" value="${confirmVO.quantity}">
	<button type="submit" id="btn-submit" onclick="purchaseReservation()" class="wz primary button">결제하기</button>
</form>