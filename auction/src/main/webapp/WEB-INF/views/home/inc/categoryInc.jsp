<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../css/home/category.css">

	<main>
        <div class="main_box">
            <div id="container">
                <div class="main_location p_tb_20 clr_6">
                    <i class="fas fa-home "></i> <span class="clr_0">홈</span>
                    <i class="far fa-chevron-right margin_l10 margin_r10"></i><span class="clr_0 bold">${mainName}</span>
                </div>
                <div class="main_title">
                    <h1 class="fw_400 float_l">온라인 경매</h1>
                    <input type="text" class="input_200 float_r" />
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <div id="item_list">
            <div id="container">
                <div class="list_title">
                    <h2 class="font_24 margin_t40 margin_b20 align">
                       	 ${mainName}
                    </h2>
                </div>
                <div class="cate_box font_14 bo_t1 bo_b1 w_100p">
	                <div class="cate_wrap bg_f8 p_a_10">
	                	<c:forEach items="${subList}" var="subList">
	                        <span class="subName p_a_10">
	                        	<a href="/categories?mainName=${subList.mainName}&subName=${subList.subName}" class="clr_6">
	                        		${subList.subName}
	                        	</a>
	                        </span>
	                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <section id="item_list">
            <div id="container">
                <h2 class="font_20 margin_t40">
                    <i class="fad fa-angle-right"></i> ${subName}
                </h2>
                <hr class="margin_t10 margin_b20" />
                <div class="list_box p_lr_20 p_b20 bo_gray">
                    <div class="item_wrap">
                    	<c:forEach items="${iList}" var="iList">
	                        <div class="item_box bo_gray margin_t20">
	                            <div class="photo_box align p_a_10" style="border-bottom: 1px solid #ccc;">
	                                <a href="/itemDetail?mainCate=${iList.mainCate}&subCate=${iList.subCate}&item_seq=${iList.item_seq}">
	                                	<img src="img/item/${fn:split(iList.safeFile, ';')[0]}"/>
	                                </a>
	                            </div>
	                            <div class="item_text_box">
	                                <div class="text_top h_90">
	                                    <div class="item_title p_a_10 h_60" style="line-height: 1.5;">
	                                        <a href="/itemDetail?mainCate=${iList.mainCate}&subCate=${iList.subCate}&item_seq=${iList.item_seq}">
	                                        	<span class="bold clr_tomato"> <${iList.subCate}></span>
	                                        	${cutString.strCutBytes(iList.item_Name, 40, 2)}
	                                        </a>
	                                    </div>
	                                    <div class="photo_price align bold p_tb_5">
	                                        <fmt:formatNumber value="${iList.item_StartPrice}" pattern="#,##0" />원
	                                    </div>
	                                </div>
	
	                                <div class="text_bottom">
	                                    <div class="bidding float_l w_50p p_a_5 bo_gray" style="border-left: transparent;">
	                                        <span class="float_l">
												입찰
	                                        </span>
	
	                                        <span class="float_r">
	                                            ${iList.item_bidCnt}
	                                        </span>
	                                        <div class="clearfix"></div>
	                                    </div>
	                                    
	                                    <div class="hit float_r w_50p bo_gray p_a_5" style="border-left: transparent; border-right: transparent;">
	                                        <span class="float_l">
	                                           	 조회
	                                        </span>
	
	                                        <span class="float_r">
	                                            ${iList.item_hit}
	                                        </span>
	                                    </div>
	                                    <div class="clearfix"></div>
	
	                                    <div class="seller p_lr_5">
	                                        	판매자 : ${iList.item_Seller}
	                                    </div>
	                                    <div class="p_a_5">
		                                    <div class="deadline">
		                                        <i class="fas fa-alarm-clock"></i>
		                                        <span class="font_14 deadline_chk" data-end-date="${iList.item_EndDate}">
		                                        	<span class="deadDate"></span>
		                                        	<span class="deadTime"></span>
		                                        </span>
			                                </div>
			                            </div>
	                                </div>
	                            </div>
	                        </div>
	                    </c:forEach>
                        
                    </div>
                </div>
            </div>
        </section>
    </main>
    
<script src="js/home/main.js"></script>