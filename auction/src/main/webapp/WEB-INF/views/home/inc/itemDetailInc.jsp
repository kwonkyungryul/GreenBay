<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../css/home/itemDetail.css">

<main>
        <section class="main_box">
            <div id="container">
                <div class="main_location p_tb_20 clr_6">
                    <i class="fas fa-home "></i> <span class="clr_0">홈</span>
                    <i class="far fa-chevron-right margin_l10 margin_r10"></i><span class="clr_0">${mainName}</span>
                    <i class="far fa-chevron-right margin_l10 margin_r10"></i><span class="clr_0 bold">${subName}</span>
                </div>
                <div class="main_title">
                    <h1 class="float_l font_28 margin_b20 margin_l10">${ivo.item_Name}</h1>
                    <div class="clearfix"></div>
                </div>

                <div class="product_wrap">
                    <div class="product_img_box p_tb_10">
                        <img src="img/item/${fn:split(ivo.safeFile, ';')[0]}" id="item_img"/>
                    </div>

                    <div class="product_info_box p_tb_10 font_16">
                        <table>
                            <tr class="bo_b1">
                                <th class="">현재가</th>
                                <td class="bold clr_sky">
                                	<c:if test="${topBidder.bid_Price == null}">
                                		<fmt:formatNumber value="${ivo.item_StartPrice}" pattern="#,##0" />
                                	</c:if>
                                	<c:if test="${topBidder.bid_Price != null}">
                                		<fmt:formatNumber value="${topBidder.bid_Price}" pattern="#,##0" />
                                	</c:if>
								원
								</td>
                            </tr>

                            <tr class="bo_b1">
                                <th class="">물품번호</th>
                                <td class="">${ivo.item_seq}</td>
                            </tr>

                            <tr class="bo_b1">
                                <th class="">경매기간</th>
                                <td class="">${ivo.item_StartDate} ~ ${ivo.item_EndDate}</td>
                            </tr>

                            <tr class="bo_b1">
                                <th class="">시작가</th>
                                <td class="">
                                	<span id="aa"><fmt:formatNumber value="${ivo.item_StartPrice}" pattern="#,##0" />원</span>
                                </td>
                            </tr>

                            <tr class="bo_b1">
                                <th class="">입찰단위</th>
                                <td class=""><fmt:formatNumber value="${ivo.item_BiddingUnit}" pattern="#,##0" />원</td>
                            </tr>

                            <tr class="bo_b1">
                                <th class="">최고입찰자</th>
                                <td class="">${topBidder.user_ID}</td>
                            </tr>

                            <tr class="bo_b1">
                                <th class="">입찰 수</th>
                                <td class="">${ivo.item_bidCnt}</td>
                            </tr>

                            <tr class="bo_b1">
                                <th class="">배송방법</th>
                                <td class="">${ivo.item_DeliveryWay}</td>
                            </tr>

                            <tr class="bo_b1">
                                <th class="">배송비용</th>
                                <td class="">${ivo.item_DeliveryPrice}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="product_info_bottom_wrap">
                    <div class="info_bottom_left">
                        <div class="min_photo_wrap">
                        	<c:forEach begin="0" end="4" varStatus="status">
	                            <div class="min_photo bo_gray p_a_5">
		                            <c:if test="${fn:split(ivo.safeFile, ';')[status.index] == null }">
			                        	<img src="img/noimg.png" class="w_90 h_100 dp_in valign">
			                        </c:if>
			                        <c:if test="${fn:split(ivo.safeFile, ';')[status.index] != null }">
			                        	<img src="img/item/${fn:split(ivo.safeFile, ';')[status.index]}" id="min_img" class="w_90 h_100 dp_in valign"/>
			                        </c:if>
	                            </div>
		                        
	                        </c:forEach>
                        </div>
                    </div>

                    <div class="info_bottom_right align p_a_20">
                        <button type="button" id="bid_modal" onClick="" class="w_200 h_60 cu_po font_16 bg_sky clr_w margin_r30">입찰하기</button>
                        <button type="button" id="" onClick="" class="w_200 h_60 cu_po font_16 clr_6">관심물품</button>
                    </div>
                    <div class="bid_box pos_fixed bg_overlay w_100p h_100vh z_in1 dp_no" id="bid_box">
                    	<div class="pos_cen bg_white w_35p">
                    		<div class="bg_blue p_a_20">
                    			<h1 class="clr_w float_l h_50 font_24">입찰하기</h1>
                    			<span class="float_r h_50">
									<span id="close">
										<i class="fal fa-times font_40 dp_in valign clr_w"></i>
									</span>
								</span>
								<div class="clearfix"></div>
                    		</div>
                    		<div class="item_info p_a_20">
                    			<h2>${ivo.item_Name}</h2>
                    			<hr class="left_hr margin_t20 margin_b20" />
                    			<form id="bidInfo" method="post">
                    				<input type="hidden" name="item_seq" value="${ivo.item_seq}" />
                    				<input type="hidden" name="user_ID" value="${sessionScope.user_ID}" />
                    				<input type="hidden" name="mainName" value="${mainName}" />
                    				<input type="hidden" name="subName" value="${subName}" />
                    				<input type="hidden" name="bid_Unit" value="${ivo.item_BiddingUnit}" />
	                    			<table class="">
	                    				<tr class="h_50">
	                    					<th class="bg_f8 w_35p font_16">
	                    						판매자
	                    					</th>
	                    					<td class="w_65p p_lr_10 font_16">
	                    						${ivo.item_Seller}
	                    					</td>
	                    				</tr>
	                    				<tr><td colspan="2" class="tbl_line"></td></tr>
	                    				
	                    				<tr class="h_50">
	                    					<th class="bg_f8 w_35p font_16">
	                    						배송방법
	                    					</th>
	                    					<td class="w_65p p_lr_10 font_16">
	                    						${ivo.item_DeliveryWay}
	                    					</td>
	                    				</tr>
	                    				<tr><td colspan="2" class="tbl_line"></td></tr>
	                    				
	                    				<tr class="h_50">
	                    					<th class="bg_f8 w_35p font_16">
	                    						입찰단위
	                    					</th>
	                    					<td class="w_65p p_lr_10 font_16">
	                    						<fmt:formatNumber value="${ivo.item_BiddingUnit}" pattern="#,##0" />원
	                    					</td>
	                    				</tr>
	                    				<tr><td colspan="2" class="tbl_line"></td></tr>
	                    				
	                    				<tr class="h_50">
	                    					<th class="bg_f8 w_35p font_16">
	                    						현재가
	                    					</th>
	                    					<td class="w_65p p_lr_10 font_16">
	                    						<c:if test="${topBidder.bid_Price == null}">
                                					<fmt:formatNumber value="${ivo.item_StartPrice}" pattern="#,##0" />
                                				</c:if>
                                				<c:if test="${topBidder.bid_Price != null}">
                                					<fmt:formatNumber value="${topBidder.bid_Price}" pattern="#,##0" />
                                				</c:if>
												원
	                    					</td>
	                    				</tr>
	                    				<tr><td colspan="2" class="tbl_line"></td></tr>
	                    				
	                    				<tr class="h_50">
	                    					<th class="bg_f8 w_35p font_16">
	                    						입찰금액
	                    					</th>
	                    					<td class="w_65p p_lr_10 font_16">
	                    						<input type="text" class="input_200" id="bid_Price" name="bid_Price" /> 원
	                    					</td>
	                    				</tr>
	                    				<tr><td colspan="2" class="tbl_line"></td></tr>
	                    				
	                    			</table>
	                    			
	                    			<div class="btn_grp align p_a_20">
	                    				<button type="button" id="bid_btn" onclick="isCheckedPrice(${ivo.item_StartPrice}, ${ivo.item_BiddingUnit}, ${topBidder.bid_Price})" class="w_150 h_50 cu_po font_16 bg_blue clr_w margin_r10">입찰하기</button>
	                    				<button type="button" id="cancel" onClick="" class="w_100 h_50 cu_po font_16 bg_blue clr_w margin_r30">취소</button>
	                    			</div>
	                    		</form>
	                    		<div class="bid_text p_a_20 bo_t1 bo_b1">
		                    		<i class="fas fa-asterisk"></i> <span class="bold font_16">알려드립니다.</span>
		                    		<br /><br />
		                    		<span class="bold">입찰 실수 및 허위 입찰</span>은 경매사고로 이어질 수 있으며,
		                    		<span class="bold">미정산(미입금, 구매거부, 반품실책 등) 2건이상 누적</span>시 그린베이 이용 제한 및 입찰수수료가 발생됩니다. 특히 홈페이지 상단 배너, 추천경매에
		                    		노출된 물품중 위와 같은 사고가 발생될 경우 1건 누적으로 코베이 이용 제한과 입찰수수료가 발생될 수 있으므로 신중한 입찰을 부탁드립니다.
		                    		<br /><br />
		                    		코베이에 등록된 판매물품의 내용 및 판매진행은 <span class="bold">판매자의 전적인 책임</span>으로 이루어지며, 거래 및 결제와 관련된 모든 책임은 판매자와 구매자에게 있습니다.
		                    	</div>
                    		</div>
                    	</div>
                    </div>
                </div>
            </div>
        </section>

    </main>
    
<script src="js/home/itemDetail.js"></script>