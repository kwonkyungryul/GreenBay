<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/home/itemInsert.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="main_bottom_box p_t20 p_lr_20">
	<div class="bx_sh2 bg_white p_a_20 margin_b20 br_3">
	    <div class="title_wrap">
	        <span class="font_16 bold margin_b10">3. 상품상세보기</span>
	    </div>
        
        <table>
        	<tr><td colspan="4" class="tbl_line"></td></tr>
            <tr class="h_60">
            	<td class="w_15p bg_itemT align clr_w">상품 분류</td>
            	<td class="w_35p p_lr_5 bold bold">
					${iView.mainCate}<i class="far fa-chevron-right margin_l10 margin_r10"></i>${iView.subCate}
            	</td>
            	
            	<td class="w_15p bg_itemT align clr_w">상품 판매자</td>
            	<td class="w_35p p_lr_5 bold">
            		${iView.item_Seller}
            	</td>
            </tr>
        	<tr><td colspan="4" class="tbl_line"></td></tr>
            <tr class="h_60">
            	<td class="w_15p bg_itemT align clr_w">상품명</td>
            	<td colspan="3" class="w_85p p_lr_5 bold">
            		${iView.item_Name}
            	</td>
            </tr>
        	<tr><td colspan="4" class="tbl_line"></td></tr>
        	<tr class="h_60">
            	<td class="w_15p bg_itemT align clr_w">경매 시작가</td>
            	<td class="w_35p p_lr_5 bold">
            		<fmt:formatNumber value="${iView.item_StartPrice}" pattern="#,##0" />원
            	</td>
            	
            	<td class="w_15p bg_itemT align clr_w">현재 최고가</td>
            	<td class="w_35p p_lr_5 bold">
            		<c:if test="${topBidder.bidPrice != null}">
            			<fmt:formatNumber value="${topBidder.bid_Price}" pattern="#,##0" />원
            		</c:if>
            		<c:if test="${topBidder.bidPrice == null}">
            			<fmt:formatNumber value="${iView.item_StartPrice}" pattern="#,##0" />원
            		</c:if>
            	</td>
            </tr>
        	<tr><td colspan="4" class="tbl_line"></td></tr>
        	<tr class="h_60">
            	<td class="w_15p bg_itemT align clr_w">경매 기간</td>
            	<td colspan="3" class="w_35p p_lr_5 bold">
					 ${iView.item_StartDate} ~ ${iView.item_EndDate}
            	</td>
            </tr>
        	<tr><td colspan="4" class="tbl_line"></td></tr>
        	
        	<tr class="h_60">
            	<td rowspan="" class="w_15p bg_itemT align clr_w">상품 이미지</td>
            	<td colspan="3" class="w_85p p_lr_5">
            		<c:forTokens items="${iView.safeFile}" delims=";" var="item">
						<img src="/img/item/${item}" alt="${item}" title="${item}" style="width: 200px; height: 221px " />
					</c:forTokens>
            	</td>
            </tr>
            <tr><td colspan="4" class="tbl_line"></td></tr>
            <tr class="h_60">
            	<td colspan="4" class="bg_itemT clr_w align">
            	상 품 상 세 설 명
            	</td>
            </tr>
            <tr><td colspan="4" class="tbl_line"></td></tr>
            <tr class="h_60">
            	<td colspan="4">
            		<textarea name="productDetail" class="product_area kor" readonly>${iView.item_Detail}</textarea>
            	</td>
            </tr>
            <tr><td colspan="4" class="tbl_line"></td></tr>
        </table>
        <div class="btn-grp margin_t20">
        	<div class="btn-left float_l">
        		<button type="button" onClick="location.href='/items'" class="btn_50 bo_blue font_12">목록</button>
        	</div>
        	
        	<div class="btn-left float_r">
        		<button type="button" onClick="checkDelete('${iView.item_seq}')" id="btn" class="btn_80 bo_blue font_12">상품삭제</button>
        	</div>
        	<div class="clearfix"></div>
        </div>
    </div>
</div>

<script>
	initSample();
</script>


<script src="../js/item/itemInsert.js"></script>