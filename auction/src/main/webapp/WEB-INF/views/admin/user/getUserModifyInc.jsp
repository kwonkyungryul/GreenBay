<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main>
    <div class="main_bottom_box p_t20 p_lr_20">
        <div class="bx_sh2 bg_white p_a_20 margin_b20 br_3">
            <div class="title_wrap">
                <span class="font_16 bold margin_b10">1. 회원상세보기</span>
            </div>
            <form method="post" action="/users/userModify">
            	<input type="hidden" id="useq" name="useq" value="${uView.useq}" />
	            <table class="margin_t10">
	                <tr class="h_50">
	                	<td class="bg_userT td_15 clr_w align font_16">회원 아이디</td>
	                	<td class="td_35 p_lr_10">
	                		<input type="text" id="user_ID" name="user_ID" class="input_200 dp_bl" value="${uView.user_ID}" />
	                	</td>
	                	<td class="bg_userT td_15 clr_w align font_16">회원 비밀번호</td>
	                	<td class="td_35 p_lr_10">
	                		<input type="password" id="user_Passwd" name="user_Passwd" class="input_200 dp_bl" />
	                	</td>
	                </tr>
	                <tr><td><hr class="left_hr"/></td></tr>
	                <tr class="h_50">
	                	<td class="bg_userT td_15 clr_w align font_16">회원 이름</td>
	                	<td class="td_35 p_lr_10">
	                		<input type="text" id="user_Name" name="user_Name" value="${uView.user_Name}" class="input_200 dp_bl" />
	                	</td>
	                	<td class="bg_userT td_15 clr_w align font_16">회원 이메일</td>
	                	<td class="td_35 p_lr_10">
	                		<div class="h_50" style="display:flex; align-items: center;" >
		                		<input type="text" id="user_Email" name="user_Email" value="${uView.user_Email}" class="input_200" />
		                		<span class="margin_l10 margin_r10">@</span>
		                		<input type="text" id="user_Domain" name="user_Domain" value="${uView.user_Domain}" class="input_200" />
		                	</div>	
	                	</td>
	                </tr>
	                <tr><td><hr class="left_hr"/></td></tr>
	                <tr class="h_50">
	                	<td class="bg_userT td_15 clr_w align font_16">회원 주소</td>
	                	<td class="td_35 p_lr_10">
	                		<input type="text" id="user_Addr" name="user_Addr" value="${uView.user_Addr}" class="input_200 dp_bl" />
	                	</td>
	                	<td class="bg_userT td_15 clr_w align font_16">회원 연락처</td>
	                	<td class="td_35 p_lr_10">
	                		<input type="text" id="user_Phone" name="user_Phone" value="${uView.user_Phone}" class="input_200 dp_bl" />
	                	</td>
	                </tr>
	                <tr><td><hr class="left_hr"/></td></tr>
	                <tr class="h_50">
	                	<td class="bg_userT td_15 clr_w align font_16">회원 가입일</td>
	                	<td class="td_35 p_lr_10">${uView.regdate}</td>
	                	<td colspan="2"></td>
	                </tr>
	            </table>
	            
	            <div class="btn_grp ralign margin_t20">
	            	<span class="left_btn float_l">
	            		<button type="button" onClick="location.href='/users'" class="btn_50 bo_sky">목록</button>
	            	</span>
	            	<span class="right_btn float_r">
			            <button type="reset" class="btn_50 bo_sky">취소</button>
			            <button type="submit" class="btn_50 bo_green">수정</button>
			        </span>
			        <div class="clearfix"></div>
		        </div>
		    </form>
        </div>
    </div>
</main>

