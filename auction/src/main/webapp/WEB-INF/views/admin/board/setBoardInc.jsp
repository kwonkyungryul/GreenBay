<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="../css/board/board.css">

<div id="main-board" class="p_a_20 br_3 margin_t20 bg_white margin_l20 margin_r20 margin_b20 bx_sh2">

    <div id="board-view" class="margin_t10">
        <h1 class="font_16 margin_b20">
            <i class="fas fa-pen-alt"></i>
            	게시판 설정 상세보기
        </h1>
        <form method="post" action="/board/setBoard">
	        <table>
	            <tr class="tbl_line">
	                <td colspan="4"></td>
	            </tr>
	            <tr class="h_40">
	                <td class="bg_boardT clr_w w_15p p_a_10 font_16 align">게시판 코드</td>
	                <td class="w_35p p_lr_5">
	                	<input type="text" name="boardCode" id="boardCode" class="input_180 p_lr_5" >
	                	<span id="confirm" class="dp_in font_14 bold clr_tomato"></span>
	                </td>
	                <td class="bg_boardT clr_w w_15p p_a_10 font_16 align">게시판 이름</td>
	                <td class="w_35p p_lr_5">
	                	<input type="text" name="boardName" id="boardName" class="input_180 p_lr_5" >
	                </td>
	            </tr>
	            <tr class="tbl_line">
	                <td colspan="4"></td>
	            </tr>
	            <tr class="h_40">
	                <td class="bg_boardT clr_w w_15p p_a_10 font_16 align">게시판 색상</td>
	                <td class="w_35p p_lr_5">
	                	<select class="sel_180" name="boardColor" id="boardColor">
	                		<option value="1">선택</option>
	                		<option value="#5D1049">#5D1049</option>
	                		<option value="#B00020">#B00020</option>
	                		<option value="#1A237E">#1A237E</option>
	                		<option value="#2962FF" selected>#2962FF</option>
	                	</select>
	                	<span id="clrBox" class="clrBox margin_l10 valign"></span>
	                </td>
	                <td class="bg_boardT clr_w w_15p p_a_10 font_16 align">게시판 생성자</td>
	                <td class="w_35p p_lr_5">
	                	<input type="text" name="boardMaker" id="boardMaker" class="input_180 p_lr_5" value="${sessionScope.user_Name}" readonly />
	                </td>
	            </tr>
	            <tr class="tbl_line">
	                <td colspan="4"></td>
	            </tr>
	            <tr class="h_40">
	                <td class="bg_boardT clr_w w_15p p_a_10 font_16 align">게시판 타입</td>
	                <td class="w_85p p_lr_5" colspan="3">
	                	<input type="radio" name="boardType" id="boardType" class="radio_btn valign" value="일반 게시판" checked /> <span class="valign">일반 게시판</span>
	                	<input type="radio" name="boardType" id="boardType" class="radio_btn valign" value="갤러리 게시판" /> <span class="valign">갤러리 게시판</span>
	                </td>
	            </tr>
	            <tr class="tbl_line">
	                <td colspan="4"></td>
	            </tr>
	            <tr class="tbl_line">
	                <td colspan="4"></td>
	            </tr>
	        </table>
	        
	
	        <!-- btn -->
	        <div class="btn_grp margin_t20">
	            <div class="btn_left float_l">
	                <button type="button" onClick="location.href='/board?template=board&mypage=list'" class="btn_50 bo_gray bold font_12">목록</button>
	            </div>
	
	            <div class="btn_left float_r">
	                <div class="btn_left float_l">
	                    <button type="submit" id="board_btn" class="btn_80 bo_blue bold font_12 margin_r10">게시판 생성</button>
	                </div>
	
	                <div class="btn_left float_l">
	                    <button type="reset" onClick="" class="btn_50 bo_blue bold font_12">취소</button>
	                </div>
	            </div>
	            <div class="clearfix"></div>
	        </div>
	    </form>
    </div>
</div>

<script src="../js/board/board.js"></script>