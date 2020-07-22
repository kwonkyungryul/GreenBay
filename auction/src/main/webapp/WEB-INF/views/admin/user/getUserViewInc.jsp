<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main>
    <div class="main_bottom_box p_t20 p_lr_20">
        <div class="bx_sh2 bg_white p_a_20 margin_b20 br_3">
            <div class="title_wrap">
                <span class="font_16 bold margin_b10">1. 회원상세보기</span>
            </div>
            
            <table class="margin_t10">
                <tr class="h_50">
                	<td class="bg_userT td_15 clr_w align font_16">회원 아이디</td>
                	<td class="td_35 p_lr_10">${uView.user_ID}</td>
                	<td class="bg_userT td_15 clr_w align font_16">회원 비밀번호</td>
                	<td class="td_35 p_lr_10">**********</td>
                </tr>
                <tr><td><hr class="left_hr"/></td></tr>
                <tr class="h_50">
                	<td class="bg_userT td_15 clr_w align font_16">회원 이름</td>
                	<td class="td_35 p_lr_10">${uView.user_Name}</td>
                	<td class="bg_userT td_15 clr_w align font_16">회원 이메일</td>
                	<td class="td_35 p_lr_10">${uView.user_Email} @ ${uView.user_Domain}</td>
                </tr>
                <tr><td><hr class="left_hr"/></td></tr>
                <tr class="h_50">
                	<td class="bg_userT td_15 clr_w align font_16">회원 주소</td>
                	<td class="td_35 p_lr_10">${uView.user_Addr}</td>
                	<td class="bg_userT td_15 clr_w align font_16">회원 연락처</td>
                	<td class="td_35 p_lr_10">${uView.user_Phone}</td>
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
		            <button type="button" onClick="userDelete('${uView.useq}')" class="btn_50 bo_sky">삭제</button>
		            <button type="button" onClick="location.href='/users/userModify?useq=${uView.useq}'" class="btn_50 bo_green">수정</button>
		        </span>
		        <div class="clearfix"></div>
	        </div>
        </div>
    </div>
</main>

