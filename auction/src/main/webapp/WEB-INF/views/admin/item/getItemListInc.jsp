<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="cutString" class="com.example.auction.util.CutString" />



<main>
    <div class="main_bottom_box p_t20 p_lr_20">
        <div class="bx_sh2 bg_white p_a_20 margin_b20 br_3">
            <div class="title_wrap">
                <span class="font_16 bold">3. 상품 목록</span>
                <c:if test="${words eq ''}">
                	<span>전체 상품은 <strong>${itemCount}개 </strong>입니다.</span>
                </c:if>
                
                <c:if test="${words ne ''}">
                	<span>검색된 상품은 <strong>${itemCount}개 </strong>입니다.</span>
                </c:if>
            </div>
            <div class="search_wrap margin_t20 ">
                <span class="">
                    <button type="button" id="selectDelete_btn" class="btn_80 clr_6 bo_green">선택삭제</button>
                    <button type="button" onClick="location.href='/cate'" class="btn_100 clr_6 bo_green">상품분류등록</button>
                </span>
                <span class="">
                    <form action="/items" method="post">
                        <select name="searchOpt" id="searchOpt" class="sel_120">
                            <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if> >전체보기</option>
                            <option value="item_Name" <c:if test="${searchOpt eq 'item_Name'}">selected</c:if> >상품명</option>
                            <option value="subCate" <c:if test="${searchOpt eq 'subCate'}">selected</c:if> >소분류</option>
                        </select>
                        <input type="search" name="words" id="words" class="input_150 bo_blue" value="${words}" />
                        <button type="submit" id="search_btn" class="btn_50 clr_6 bo_blue">검색</button>
                        <button type="button" onClick="location.href='/items'" class="btn_80 clr_6 bo_gray">목록보기</button>
                    </form>
                </span>
            </div>
            <table class="margin_t10">
                <tr class="h_45 clr_w bg_itemT"><!-- #114da5 -->
                    <th class="td_5">
                    	<input type="checkbox" id="chkAll" class="dp_in valign w_20 h_20" />
                    </th>
                    <th class="td_5">No.</th>
                    <th class="td_10">소분류 이름</th>
                    <th class="td_25">상품명</th>
                    <th class="td_10">상품 판매자</th>
                    <th class="td_15">시작가</th>
                    <th class="td_10">입찰단위</th>
                    <th class="td_20">-</th>
                </tr>
               	<c:forEach items="${iList}" var="iList" varStatus="status">
	                <tr class="h_45 align">
	                	<td><input type="checkbox" id="" class="chk dp_in valign w_20 h_20" data-iseq="${iList.item_seq}" /></td>
	                	<td>
	                		${(itemCount - status.index) - ( (num - 1) * end )}
	                	</td>
	                	<td><span class="bold">${iList.subCate}</span></td>
	                	<td class="lalign bold">
	                		<a href="items/getItemView?item_seq=${iList.item_seq}">
	                			${cutString.strCutBytes(iList.item_Name, 30, 2)}
	                		</a>
	                	</td>
	                	<td>${iList.item_Seller}</td>
	                	<td>
	                		<fmt:formatNumber value="${iList.item_StartPrice}" pattern="#,##0" />원
	                	</td>
	                	<td>
	                		<fmt:formatNumber value="${iList.item_BiddingUnit}" pattern="#,##0" />원
	                	</td>
	                	<td>
	                		<button type="button" onClick="checkDelete(${iList.item_seq})" class="bo_green btn_50">삭제</button>
		                    <button type="button" onClick="" class="bo_sky btn_50">수정</button>
		                </td>
	                </tr>
                </c:forEach>
	            <c:if test="${itemCount eq 0}">
	            	<tr class="h_50"><td colspan="8" class="align bold clr_6 font_16">검색된 상품이 없습니다.</td></tr>
	            </c:if>
            </table>
            <div class="margin_t20">
	            <c:if test="${prev}">
		        	<span>
		        		<a href="/items?num=${startPageNum - 1}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="w_40 h_40 dp_in align valign clr_w" style="border: 1px solid #28a745" >이전</a>
		        	</span>
		        </c:if>
		        <!-- //이전 -->
		        <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
		        	<c:if test="${select == num}">
			        	<span>
				            <a href="/items?num=${num}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="w_40 h_40 dp_in align valign clr_w bg_itemT">${num}</a>
			        	</span>
			        </c:if>
	
			        <c:if test="${select != num}">
			        	<span>
				            <a href="/items?num=${num}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="w_40 h_40 dp_in align valign clr_6 bo_itemT">${num}</a>
			        	</span>
			        </c:if>
			    </c:forEach>
			        <!-- 다음 -->
			    <c:if test="${next}">
			       	<span >
			       		<a href="/items?num=${endPageNum + 1}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="w_40 h_40 dp_in align valign clr_w" style="border: 1px solid #28a745">다음</a>
			       	</span>
			    </c:if>
		        	<!-- //다음 -->
		    </div>
        </div>
    </div>
</main>

<script src="../js/admin/item/itemList.js"></script>