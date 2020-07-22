<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main>
    <div class="main_bottom_box p_t20 p_lr_20">
        <div class="bx_sh2 bg_white p_a_20 margin_b20 br_3">
            <div class="title_wrap">
                <span class="font_16 bold margin_b10">3. 상품 분류 등록</span>
            </div>
            <button type="button" onClick="location.href='/items'" class="btn_50 bo_sky">목록</button>
            <form method="post" action="/users/userModify">
            	<input type="hidden" id="useq" name="useq" value="${uView.useq}" />
	            <table class="margin_t10">
	                <tr class="h_50">
	                	<td rowspan="2" class="bg_itemT td_15 clr_w align font_16">상품 대분류</td>
	                	<td class="td_85 p_lr_10">
	                		<input type="text" id="mainCode" name="mainCode" autocomplete="off" class="input_180 margin_r10" placeholder="예) 대분류 코드 : 숫자 /영어" />
	            			<input type="text" name="mainName" id="mainName" autocomplete="off" class="input_180 p_lr_5 margin_r20" placeholder="예) 대분류 이름" />
	            			<button type="button" id="main_btn" class="btn_50 bo_gray clr_6">저장</button>
	                	</td>
	                	<td>
	                </tr>
	                <tr>
	                	<td colspan="2" class="p_lr_10">
	                		<div class="mainCateArea"></div>
	                	</td>
	                </tr>
	                <tr><td><hr class="left_hr"/></td></tr>
	                <tr class="h_50">
	                	<td rowspan="2" class="bg_itemT td_15 clr_w align font_16">상품 소분류</td>
	                	<td class="td_85 p_lr_10">
	                		<select class="sel_150 selected_mainCate">
	                			<option value="1">선택하세요</option>
	                		</select>
	                		<input type="text" id="subCode" name="subCode" autocomplete="off" class="input_180 margin_r10" placeholder="예) 소분류 코드 : 숫자 /영어" />
	            			<input type="text" name="subName" id="subName" autocomplete="off" class="input_180 p_lr_5 margin_r20" placeholder="예) 소분류 이름" />
	            			<button type="button" id="sub_btn" class="btn_50 bo_gray clr_6">저장</button>
	                	</td>
	                	<td>
	                </tr>
	                <tr>
	                	<td colspan="2" class="p_lr_10">
	                		<div class="subCateArea"></div>
	                	</td>
	                </tr>
	                <tr><td><hr class="left_hr"/></td></tr>
	            </table>
	            
	            <div class="btn_grp ralign margin_t20">
	            	<span class="left_btn float_l">
	            		
	            	</span>
	            	<span class="right_btn float_r">
			            <button type="button" onClick="location.href='/items'" class="btn_50 bo_sky">취소</button>
			        </span>
			        <div class="clearfix"></div>
		        </div>
		    </form>
        </div>
    </div>
</main>

<script src="/js/admin/item/cate.js"></script>

