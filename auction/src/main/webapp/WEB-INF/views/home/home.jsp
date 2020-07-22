<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/head.jspf" %>
<jsp:useBean id="cutString" class="com.example.auction.util.CutString" />

	<header>
       <nav id="util_box" class="bg_clr_f8 p_tb_20 of-h bg_white">
           <div id="container">
				<c:if test="${sessionScope.user_Name == null && sessionScope.user_Auth == null}">
	               <div class="util_wrap">
	                   <div class="util_left clr_6">
	                   		<i class="fas fa-clock"></i> <span id="clock"></span>
	                        <span class="margin_l20">
							<i class="fas fa-user-lock"></i> <strong><a href="/login" class="clr_6">로그인</a></strong>을 하시면 다양한 정보를 보실 수 있습니다.</span>
	                   </div>
	
	                   <div class="util_right font_14">
	                       <ul id="util_bar" class="">
	                           <li class="p_lr_5"><a href="#" class="clr_6"><strong>그린베이</strong>가 처음이신가요?</a></li>
	                           <li class="p_lr_5"><a href="/login">로그인</a></li>
	                           <li class="p_lr_5"><a href="/users/register" class="clr_6">회원가입</a></li>
	                           <li class="p_lr_5"><a href="#" class="clr_6">마이페이지</a></li>
	                           <li class="p_lr_5"><a href="/article?boardCode=notice" class="clr_6">공지사항</a></li>
	                           <li class="p_lr_5"><a href="/article?boardCode=QnA" class="clr_6">QnA</a></li>
	                       </ul>
	                   </div>
	               </div>
	           </c:if>
	           
	           <c:if test="${sessionScope.user_Name != null && sessionScope.user_Auth != null}">
	               <div class="util_wrap">
	                   <div class="util_left clr_6">
	                   		<i class="fas fa-clock"></i> <span id="clock"></span>
	                        <span class="margin_l20"><a href="#"><strong>[구매] </strong> 입찰 중 0 건</a></span>
							<span class="margin_l10"><a href="#"><strong>[판매] </strong> 판매 중 0 건</a></span>
	                   </div>
	
	                   <div class="util_right font_14">
	                       <ul id="util_bar" class="">
	                           <li class="p_lr_10"><a href="#" class="clr_6"><strong>${sessionScope.user_Name}</strong>님(등급 : <strong class="clr_tomato">${sessionScope.user_Auth}</strong>)</a></li>
	                           <li class="p_lr_10"><a href="/items/setItem">물품등록</a></li>
	                           <li class="p_lr_10"><a href="#">관심물품</a></li>
	                           <li class="p_lr_10"><a href="/logout" class="clr_6">로그아웃</a></li>
	                           <li class="p_lr_5"><a href="/article?boardCode=notice" class="clr_6">공지사항</a></li>
	                           <li class="p_lr_5"><a href="/article?boardCode=QnA" class="clr_6 margin_r10">FAQ</a></li>
	                           <c:if test="${sessionScope.user_Auth eq 'admin'}">
	                   				<li><span><a href="/users" class="bold clr_tomato">관리자페이지</a></span></li>
							   </c:if>
							   <c:if test="${sessionScope.user_Auth ne 'admin'}">
							   	   <li class="p_l10"><a href="#" class="clr_6">마이페이지</a></li>
							   </c:if>							   
	                       </ul>
	                   </div>
	               </div>
	           </c:if>
           </div>
       </nav>

       <nav id="logo_box" class="bg_white p_tb_20">
           <div id="container">
               <div class="logo_wrap" style="align-items: center;">
                   <div class="logo">
                       <a href="/" class="font_30 bold">GREEN BAY</a>
                   </div>
					<div class="gnb_bar align">
               			<c:forEach items="${mainList}" var="mainList">
	                   		<a href="/categories?mainName=${mainList.mainName}&subName=${mainList.subName}" class="kor bold font_16 h_50 p_lr_50">
	                   			${mainList.mainName}
	                   		</a>
	                	</c:forEach>
               		</div>
<!--                    <div class="search"> -->
<!--                        <input type="search" name="" id="" class="input_200 dp_in valign" /> -->
<!--                        <button type="button" class="btn_80 font_14 bg_e clr_w dp_in valign" style="background-color: #7daaff;">검색</button> -->
<!--                    </div> -->
               </div>
           </div>
       </nav>

       <nav id="gnb_box" class="bg_white">
           <div id="container">
               
           </div>
       </nav>

       <div class="hero_box margin_t40">
           <div id="container">
               <div class="owl-carousel owl-theme">
                   <div class="hero_img">
                       <img src="/img/hero/hero1.png" alt="" />
                   </div>

                   <div class="hero_img">
                       <img src="/img/hero/hero2.png" alt="" />
                   </div>

                   <div class="hero_img">
                       <img src="/img/hero/hero3.png" alt="" />
                   </div>

                   <div class="hero_img">
                       <img src="/img/hero/hero4.png" alt="" />
                   </div>

                   <div class="hero_img">
                       <img src="/img/hero/hero5.png" alt="" />
                   </div>

                   <div class="hero_img">
                       <img src="/img/hero/hero6.png" alt="" />
                   </div>
               </div>
           </div>
       </div>
	</header>
   
	<c:if test="${template eq 'main' && mypage eq 'view'}">
		<%@ include file ="inc/mainInc.jsp" %>
	</c:if>
	
	<c:if test="${template eq 'category' && mypage eq 'view'}">
		<%@ include file ="inc/categoryInc.jsp" %>
	</c:if>
	
	<c:if test="${template eq 'item' && mypage eq 'view'}">
		<%@ include file ="inc/itemDetailInc.jsp" %>
	</c:if>
	
	<c:if test="${template eq 'item' && mypage eq 'insert'}">
		<%@ include file ="inc/itemInsertInc.jsp" %>
	</c:if>
	
	<c:if test="${template eq 'article' && mypage eq 'list'}">
		<%@ include file ="article/getArticleListInc.jsp" %>
	</c:if>
	
	<c:if test="${template eq 'article' && mypage eq 'view'}">
		<%@ include file ="article/getArticleViewInc.jsp" %>
	</c:if>
	
	<c:if test="${template eq 'article' && mypage eq 'modify'}">
		<%@ include file ="article/setArticleModifyInc.jsp" %>
	</c:if>
	
	<c:if test="${template eq 'article' && mypage eq 'reply'}">
		<%@ include file ="article/getArticleReplyInc.jsp" %>
	</c:if>
	
	<c:if test="${template eq 'article' && mypage eq 'insert'}">
		<%@ include file ="article/setArticleInc.jsp" %>
	</c:if>
	
   

   
   <footer class="bg_f8">
        <div id="footer_box">
            <div id="container">
                <div class="footer_top">
                    <div class="footer_top_box p_tb_30">
                        <div class="text_top margin_b30">
                            <p class="bold">
                                <a href="#" class="p_r10">회사소개</a> | <a href="#" class="p_lr_10">이용약관</a> | <a href="#" class="p_lr_10">개인정보취급방침</a> | <a href="#" class="p_lr_10">이메일무단수집거부</a> | <a href="#" class="p_lr_10">고객센터</a> | <a href="#" class="p_l10">앱소개</a>
                            </p>
                        </div>

                        <div class="text_middle">
				                            상호명 : (주)그린베이옥션 / 대표이사: 권경렬 / 주소: 부산광역시 남구 73-18 1004호<br />
				             Tel: 02-123-5678 (정확한 상담을 위해 통화내용이 저장됩니다. ) Fax : 02-123-4567 메일 : master@greenbay.co.kr<br />
				                            사업자등록번호 : 123-45-67890 통신판매업 신고번호 : 제01 – 1234호<br /><br />
				                            그린베이옥션에서 등록된 오픈마켓 상품은 개별판매자가 시스템을 이용하여 등록한 것으로서 그린베이는 등록된 상품과 그 내용에 대하여 일체의 책임을 지지 않습니다<br /><br />
				             Copyright&copy; 1999, greenbayauction,lnc All rights reserved.
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer_bottom bg_white">
                <div id="container">
                    <div class="footer_img">
                        <img src="/img/bottom.jpg" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </footer>

<%@ include file="../include/foot.jspf" %>   