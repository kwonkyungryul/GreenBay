<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/home/main.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script>
    $(function () {
            $('.owl-carousel').owlCarousel({
                items: 1,
                loop: true,
                margin: 30,
                dots: true,
                nav: false,
                autoplay: true,
                autoplayTimeout: 2000,
                autoplayHoverPause: true
            });
        });
</script>

    <main>
        <section id="recommend">
            <div id="container">
                <h2 class="font_20 margin_t40">
                    <i class="fad fa-angle-right"></i> <span class="font_18 fw_400">그린베이</span> 추천경매
                </h2>
                <hr class="margin_t10 margin_b20" />
                <div class="recommend_box p_lr_20 p_b20 bo_gray">
                    <div class="item_wrap">
                    
                    	<c:forEach items="${recList}" var="recList">
	                        <div class="item_box bo_gray margin_t20">
                    			<input type="hidden" class="eDate" value="${recList.item_EndDate}">
	                            <div class="photo_box align p_a_10" style="border-bottom: 1px solid #ccc;">
	                            	<a href="/itemDetail?mainCate=${recList.mainCate}&subCate=${recList.subCate}&item_seq=${recList.item_seq}">
	                                	<img src="img/item/${fn:split(recList.safeFile, ';')[0]}"/>
	                                </a>
	                            </div>
	                            <div class="item_text_box">
	                                <div class="text_top h_90">
	                                    <div class="item_title p_a_10 h_60" style="line-height: 1.5;">
	                                    	<a href="/itemDetail?mainCate=${recList.mainCate}&subCate=${recList.subCate}&item_seq=${recList.item_seq}">
	                                        	<span class="bold clr_tomato"> <${recList.subCate}></span>
	                                        	${cutString.strCutBytes(recList.item_Name, 40, 2)}
	                                        </a>
	                                    </div>
	                                    <div class="photo_price align bold p_tb_5">
	                                        <fmt:formatNumber value="${recList.item_StartPrice}" pattern="#,##0" />원
	                                    </div>
	                                </div>
	
	                                <div class="text_bottom">
	                                    <div class="bidding float_l w_50p p_a_5 bo_gray" style="border-left: transparent;">
	                                        <span class="float_l">
	                                            	입찰
	                                        </span>
	
	                                        <span class="float_r">
	                                            	${recList.item_bidCnt}
	                                        </span>
	                                        <div class="clearfix"></div>
	                                    </div>
	
	                                    <div class="hit float_r w_50p bo_gray p_a_5" style="border-left: transparent; border-right: transparent;">
	                                        <span class="float_l">
	                                            	조회
	                                        </span>
	
	                                        <span class="float_r">
	                                            	${recList.item_hit}
	                                        </span>
	                                    </div>
	                                    <div class="clearfix"></div>
										<div class="p_a_5">
		                                    <div class="seller margin_b5">
		                                        	판매자 : ${recList.item_Seller}
		                                    </div>
		                                    
		                                    <div class="deadline">
		                                        <i class="fas fa-alarm-clock"></i>
		                                        <span class="font_14 deadline_chk" data-end-date="${recList.item_EndDate}">
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
        
        <section id="hot" class="bg_white">
		    <div id="container">
		        <h2 class="font_20">
		            <i class="fad fa-angle-right"></i> <span class="font_18 fw_400">그린베이</span> 인기경매
		        </h2>
		        <hr class="margin_t10 margin_b20" />
		        <div class="hot_box p_a_20 bo_gray">
		            <div class="item_wrap">
		            	<c:forEach items="${hotList}" var="hotList">
	                        <div class="item_box bo_gray margin_t20">
                    			<input type="hidden" class="eDate" value="${hotList.item_EndDate}">
	                            <div class="photo_box align p_a_10" style="border-bottom: 1px solid #ccc;">
	                            	<a href="/itemDetail?mainCate=${hotList.mainCate}&subCate=${hotList.subCate}&item_seq=${hotList.item_seq}">
	                                	<img src="img/item/${fn:split(hotList.safeFile, ';')[0]}"/>
	                                </a>
	                            </div>
	                            <div class="item_text_box">
	                                <div class="text_top h_90">
	                                    <div class="item_title p_a_10">
	                                    	<a href="/itemDetail?mainCate=${hotList.mainCate}&subCate=${hotList.subCate}&item_seq=${hotList.item_seq}">
	                                        	<span class="bold clr_tomato"> <${hotList.subCate}></span>
	                                        	${cutString.strCutBytes(hotList.item_Name, 50, 2)}
	                                        </a>
	                                    </div>
	                                    <div class="photo_price align bold p_tb_5">
	                                        <fmt:formatNumber value="${hotList.item_StartPrice}" pattern="#,##0" />원
	                                    </div>
	                                </div>
	
	                                <div class="text_bottom">
	                                    <div class="bidding float_l w_50p p_a_5 bo_gray" style="border-left: transparent;">
	                                        <span class="float_l">
	                                            	입찰
	                                        </span>
	
	                                        <span class="float_r">
	                                            	${hotList.item_bidCnt}
	                                        </span>
	                                        <div class="clearfix"></div>
	                                    </div>
	
	                                    <div class="hit float_r w_50p bo_gray p_a_5" style="border-left: transparent; border-right: transparent;">
	                                        <span class="float_l">
	                                            	조회
	                                        </span>
	
	                                        <span class="float_r">
	                                            	${hotList.item_hit}
	                                        </span>
	                                    </div>
	                                    <div class="clearfix"></div>
										<div class="p_a_5">
		                                    <div class="seller margin_b5">
		                                        	판매자 : ${hotList.item_Seller}
		                                    </div>
		                                    
		                                    <div class="deadline">
		                                        <i class="fas fa-alarm-clock"></i>
		                                        <span class="font_14 deadline_chk" data-end-date="${hotList.item_EndDate}">
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