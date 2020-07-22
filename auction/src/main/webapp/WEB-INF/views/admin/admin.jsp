<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "../include/head.jspf" %>
<%@ include file = "adminInc/info.jspf" %>
<link rel="stylesheet" href="../css/admin/admin.css">



    <div class="all_wrap">
        <aside class="site_left">
            <h1 class="align h_60">
                <a href="/users" class="bold font_32 clr_wrgb">
                	GREEN BAY
                </a>
            </h1>
            <hr class="left_hr" />

            <div id="navbar" class="p_a_20">
                <div class="margin_t10 margin_b20">
                    <span class="eng clr_tomato font_18 bold clr_6">Navigation</span>
                </div>

                <!-- menu 회원 관리 -->
                <div id="nav_wrap" class="">
                    <div class="icon">
                        <i class="fas fa-male clr_wrgb"></i>
                    </div>

                    <div class="icon_title">
                        <a href="/users?template=users&mypage=list" class="roboto clr_wrgb font_16">Member Management
                            Page</a>
                    </div>

                    <div class="icon_arrow">
                        <i class="fas fa-angle-left clr_wrgb"></i>
                    </div>
                </div>
                <!-- // menu 회원 관리 -->

                <!-- menu 게시판 관리 -->
                <div id="nav_wrap" class="margin_t30">
                    <div class="icon">
                        <i class="fas fa-paper-plane clr_wrgb"></i>
                    </div>

                    <div class="icon_title">
                        <a href="/board?template=board&mypage=list" class="roboto clr_wrgb font_16">Board Management
                            Page</a>
                    </div>

                    <div class="icon_arrow">
                        <i class="fas fa-angle-left clr_wrgb"></i>
                    </div>
                </div>
                <!-- // menu 게시판 관리 -->

                <!-- menu 쇼핑몰 관리 -->
                <div id="nav_wrap" class="margin_t30">
                    <div class="icon">
                        <i class="fas fa-shopping-cart clr_wrgb"></i>
                    </div>

                    <div class="icon_title">
                        <a href="/items?template=item&mypage=list" class="roboto clr_wrgb font_16">ShopMall Management Page</a>
                    </div>

                    <div class="icon_arrow">
                        <i class="fas fa-angle-left clr_wrgb"></i>
                    </div>
                </div>
                <!-- // menu 쇼핑몰 관리 -->

                <!-- menu 스케쥴 관리 -->
                <div id="nav_wrap" class="margin_t30">
                    <div class="icon">
                        <i class="far fa-calendar-alt clr_wrgb"></i>
                    </div>

                    <div class="icon_title">
                        <a href="#" class="roboto clr_wrgb font_16">Scheduler Management Page</a>
                    </div>

                    <div class="icon_arrow">
                        <i class="fas fa-angle-left clr_wrgb"></i>
                    </div>
                </div>
                <!-- // menu 스케쥴 관리 -->

                <!-- menu 관리자 정보 관리 & 사이트 관리 -->
                <div id="nav_wrap" class="margin_t30">
                    <div class="icon">
                        <i class="fas fa-info-circle clr_wrgb"></i>
                    </div>

                    <div class="icon_title">
                        <a href="#" class="roboto clr_wrgb font_16">Admin Management Page</a>
                    </div>

                    <div class="icon_arrow">
                        <i class="fas fa-angle-left clr_wrgb"></i>
                    </div>
                </div>

                <div id="nav_wrap" class="margin_t30">
                    <div class="icon">
                        <i class="fas fa-syringe clr_wrgb"></i>
                    </div>

                    <div class="icon_title">
                        <a href="#" class="roboto clr_wrgb font_16">Site Management Page</a>
                    </div>

                    <div class="icon_arrow">
                        <i class="fas fa-angle-left clr_wrgb"></i>
                    </div>
                </div>
                <!-- // menu 관리자 정보 관리 & 사이트 관리 -->
            </div>
        </aside>
        <section class="site_right">
            <div class="right_top h_60 bg_white p_lr_20">
                <div class="right_top_wrap">
                    <div class="top_left">
                        <i class="far fa-bars font_24 clr_brgb dp_in valign"></i>
                        <a href="/" class="clr_6 margin_l30 dp_in valign">Home</a>
                        <a href="#" class="clr_6 margin_l30 dp_in valign">Contact</a>
                        <a href="/" class="clr_tomato bold margin_l30 dp_in valign">Go Shop</a>
                    </div>
                    <div class="top_right">
                        <a href="#"><i class="fal fa-comments font_20 clr_6 margin_r30 dp_in valign"></i></a>
                        <a href="#"><i class="fal fa-bell font_20 clr_6 dp_in valign margin_r30"></i></a>
                        <span class="session_Info margin_r10">
                            <img src="img/men.jpg" alt="" class="w_30 h_30 dp_in valign br_50p">
                            <span class="clr_6">${sessionScope.user_Name}(등급 : <span class="clr_tomato bold">${sessionScope.user_Auth}</span>)</span>
                        </span>
                        <span class="logout">
                        	<a href="/logout" class="bold">
                        		<i class="fal fa-sign-out-alt"></i> LOGOUT
                        	</a>
                        </span>
                    </div>
                </div>
            </div>
            <hr class="right_hr" />
            <div class="right_bottom">
                <div class="right_bottom_box">
                    <div class="right_bottom_box_wrap p_t20 p_lr_20">
                        <div class="one_box clr_w br_3 p_a_20 bx_sh2 pos_rel">
                            <div class="box_left">
                                <div class="box_count font_32 bold">
                                    150
                                </div>
                                <p class="p_tb_5">Member Reg.(Today)</p>
                                <i class="far fa-clock"></i> <span>Update 02:15</span>
                            </div>

                            <div class="box_right">
                                <i class="fal fa-user-plus dp_in valign font_40"></i>
                            </div>
                        </div>

                        <div class="two_box clr_w br_3 p_a_20 bx_sh2 pos_rel">
                            <div class="box_left">
                                <div class="box_count font_32 bold">
                                    66
                                </div>
                                <p class="p_tb_5">Board Reg.(Today)</p>
                                <i class="far fa-clock"></i> <span>Update 02:15</span>
                            </div>

                            <div class="box_right">
                                <i class="fal fa-signal dp_in valign font_40"></i>
                            </div>
                        </div>

                        <div class="three_box clr_w br_3 p_a_20 bx_sh2 pos_rel">
                            <div class="box_left">
                                <div class="box_count font_32 bold">
                                    2,396
                                </div>
                                <p class="p_tb_5">Article Reg.(Today)</p>
                                <i class="far fa-clock"></i> <span>Update 02:15</span>
                            </div>

                            <div class="box_right">
                                <i class="fas fa-chart-pie-alt dp_in valign font_40"></i>
                            </div>
                        </div>

                        <div class="four_box clr_w br_3 p_a_20 bx_sh2 pos_rel">
                            <div class="box_left">
                                <div class="box_count font_32 bold">
                                    44,613
                                </div>
                                <p class="p_tb_5">Item Reg.(Today)</p>
                                <i class="far fa-clock"></i> <span>Update 02:15</span>
                            </div>

                            <div class="box_right">
                                <i class="fal fa-shopping-bag dp_in valign font_40"></i>
                            </div>
                        </div>

                    </div>

				<c:if test="${template eq 'user' && mypage eq 'list'}">
					<%@ include file = "user/getUsersListInc.jsp" %>
				</c:if>
				
				<c:if test="${template eq 'user' && mypage eq 'view'}">
					<%@ include file = "user/getUserViewInc.jsp" %>
				</c:if>
				
				<c:if test="${template eq 'user' && mypage eq 'modify'}">
					<%@ include file = "user/getUserModifyInc.jsp" %>
				</c:if>
				
				<c:if test="${template eq 'board' && mypage eq 'list'}">
					<%@ include file = "board/getBoardListInc.jsp" %>
				</c:if>
				
				<c:if test="${template eq 'board' && mypage eq 'insert'}">
                    <%@ include file="board/setBoardInc.jsp" %>
                </c:if>
				
				<c:if test="${template eq 'item' && mypage eq 'list'}">
					<%@ include file = "item/getItemListInc.jsp" %>
				</c:if>
				
				<c:if test="${template eq 'item' && mypage eq 'view'}">
					<%@ include file = "item/getItemViewInc.jsp" %>
				</c:if>
				
				<c:if test="${template eq 'category' && mypage eq 'list'}">
					<%@ include file = "item/getCateListInc.jsp" %>
				</c:if>
				
				
				
				
				</div>
            </div>
        </section>
    </div>
    <footer></footer>
    
<script src="../js/admin/user/userCommon.js"></script>
<script src="../js/admin/adminCommon.js"></script>

<%@ include file = "../include/foot.jspf" %>