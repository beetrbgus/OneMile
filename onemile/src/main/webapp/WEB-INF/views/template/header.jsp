<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%-- 페이지에서 사용할 JSTL 변수 --%>
<c:set var="login" value="${logId != null}"></c:set>
<c:set var="admin" value="${grade == '관리자'}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>




text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%-- 페이지에서 사용할 JSTL 변수 --%>
<c:set var="login" value="${logId != null}"></c:set>
<c:set var="admin" value="${grade == '관리자'}"></c:set>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/commons.css">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/layout.css">
    <!-- 토스트 알림창 -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css">
	<style>
        .logo-wrapper {
            width:130px;
        }
        .logo-wrapper > img {
            width:100%;
            height:100%;
        }
        .title-wrapper {
            flex-grow: 1;
        }
	 </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b89479d3bf4f702a0c7b99d5edfb1391&libraries=services" charset="utf-8"></script> 
    <script type="text/javascript"src="${root}/resources/js/navigator.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
    <script type="text/javascript"src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/sha1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" ></script>


<!-- 여기서부턴 문토의 스크립트 -->
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async="" src="//www.googleadservices.com/pagead/conversion_async.js"></script>
    <script src="https://connect.facebook.net/signals/config/185351011952221?v=2.9.48&amp;r=stable" async=""></script>
    <script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-TFHCDQL"></script>
    <script>
        ! function (e, t, a, n, g) {
            e[n] = e[n] || [], e[n].push({
                "gtm.start": (new Date).getTime(),
                event: "gtm.js"
            });
            var m = t.getElementsByTagName(a)[0],
                r = t.createElement(a);
            r.async = !0, r.src = "https://www.googletagmanager.com/gtm.js?id=GTM-TFHCDQL", m.parentNode.insertBefore(r,
                m)
        }(window, document, "script", "dataLayer");
    </script>
    
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta property="og:url" content="https://www.munto.kr">
    <meta property="og:title" content="문토, 취향으로 만나는 우리">
    <meta property="og:type" content="website">
    <meta property="og:image" content="/meta.8729d45c.png">
    <meta property="og:image:secure_url" content="/meta.8729d45c.png">
    <meta property="og:image:type" content="image/png">
    <meta property="og:width" content="800">
    <meta property="og:height" content="800">
    <meta property="og:description" content="좋아하는 취향에서부터 좋아하게 될 사람들까지">
    <meta property="fb:app_id" content="254458262627432">
    <title>문토, 취향으로 만나는 우리</title>
    <link rel="icon shortcut" href="/favicon.8aba0c98.ico">
    <link rel="icon" href="/favicon.8aba0c98.ico">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="">
    <link rel="stylesheet" href="/header.fb32a8f1.css">
    <link rel="stylesheet" href="/common.63452003.css">
    <link rel="stylesheet" href="/common.7661d610.css">
    <link rel="stylesheet" href="/footer.ed9418ef.css">
    <link rel="stylesheet" href="/mypage.d9580360.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin=""></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin=""></script>
    <script src="/mypage.c7e33a46.js"></script>
    <script
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/823910537/?random=1640753540885&amp;cv=9&amp;fst=1640753540885&amp;num=1&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1440&amp;u_w=2560&amp;u_ah=1400&amp;u_aw=2560&amp;u_cd=24&amp;u_his=5&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2wgc10&amp;sendb=1&amp;ig=1&amp;frm=0&amp;url=https%3A%2F%2Fwww.munto.kr%2Faccounts%2Fmypage%2F&amp;ref=https%3A%2F%2Fwww.munto.kr%2Fsocialing%2F&amp;tiba=%EB%AC%B8%ED%86%A0%2C%20%EC%B7%A8%ED%96%A5%EC%9C%BC%EB%A1%9C%20%EB%A7%8C%EB%82%98%EB%8A%94%20%EC%9A%B0%EB%A6%AC&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4">
    </script>

</head>

<body> 

<noscript> <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TFHCDQL" height="0" width="0"
            style="display:none;visibility:hidden"></iframe> </noscript>
    

            <header>
        <div>
            <div class="my-btn pointer"></div> <a href="/">
                <div class="logo pointer"></div>
            </a> <a href="/purchase/cart/">
                <div class="cart-btn pointer"> <span class="cart-count">0</span> </div>
            </a>
            <div class="menu">
                <ul>
                    <li class="pointer socialing-btn"><a href="/socialing/">소셜링</a></li>
                    <li class="ongoing-btn pointer"><a href="/vod/">VOD</a></li>
                    <li class="magazine-btn pointer"><a href="/magazine/">매거진</a></li>
                    <li class="my-btn-wrapper pointer">
                        <div class="my-btn"></div>
                    </li>
                    <li class="cart-btn-wrapper pointer"> <a href="/purchase/cart/" style="height:0">
                            <div class="cart-btn"> <span class="cart-count">0</span> </div>
                        </a> </li>
                </ul>
            </div>
        </div>
    </header>


