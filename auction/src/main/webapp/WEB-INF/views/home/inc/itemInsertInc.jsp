<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../css/home/itemInsert.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

    
<main>
    <div id="container">
        <div class="main_box">
            <div id="container">
                <div class="main_location p_tb_20 clr_6">
                    <i class="fas fa-home "></i> <span class="clr_0">홈</span>
                    <i class="far fa-chevron-right margin_l10 margin_r10"></i><span class="clr_0 bold">물품등록</span>
                </div>
                <div class="main_title">
                    <h1 class="fw_400">온라인 물품 등록</h1>
                </div>
            </div>
        </div>

        <section>
            <!-- 카테고리 -->
            <h2 class="font_20 margin_t40">
                <i class="fad fa-angle-right"></i> 카테고리 선택
            </h2>
            <hr class="left_hr margin_t20 margin_b20" />

            <form method="post" action="/items/setItem" enctype="multipart/form-data">
                <table>

                    <tr class="h_60">
                        <td class="w_15p bg_f8 align">상품 코드</td>
                        <td class="w_35p p_lr_5">
                            <select name="mainCate" id="mainCate" class="mainCateSelected sel_150">
                                	<option value="">대분류 선택</option>
                            </select>

                            <select name="subCate" id="subCate" class="subCateSelected sel_150">
                                <option value="">소분류 선택</option>
                            </select>
                        </td>

                        <td class="w_15p bg_f8 align">상품 판매자</td>
                        <td class="w_35p p_lr_5">
                            <input type="text" name="item_Seller" id="item_Seller" autocomplete="off" value="${sessionScope.user_ID}" readonly
                                class="input_200 p_lr_5" />
                        </td>
                    </tr>

                    <!-- 물품정보 -->
                    <tr>
                        <td colspan="4" class="">
                            <h2 class="font_20 margin_t40">
                                <i class="fad fa-angle-right"></i> 물품 정보
                            </h2>
                            <hr class="left_hr margin_t20 margin_b20" />
                        </td>
                    </tr>
                    <tr class="h_60">
                        <td class="w_15p bg_f8 align ">상품명</td>
                        <td colspan="3" class="w_85p p_lr_5">
                            <input type="text" name="item_Name" id="item_Name" autocomplete="off"
                                class="input_full p_lr_5 font_14" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="tbl_line"></td>
                    </tr>
                    <tr>
                        <td colspan="" class="bg_f8 align">
                           	 상 품 상 세 설 명
                        </td>
                        <td colspan="4" class="p_a_5">
                            <textarea id="item_Detail" name="item_Detail" class="product_area kor"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="tbl_line"></td>
                    </tr>
                    <tr class="h_60">
                        <td rowspan="2" class="w_15p bg_f8 align ">상품 이미지</td>
                        <td colspan="3" class="w_85p p_lr_5">
                            <input multiple="multiple" type="file" name="item_img" id="item_img" class="p_lr_5" />
                        </td>
                    </tr>
                    <tr class="h_60">
                        <td colspan="4" class="w_85p p_lr_5">
                            <div class="imgs_wrap"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="tbl_line"></td>
                    </tr>

                    <!-- 경매설정 -->
                    <tr>
                        <td colspan="4" class="">
                            <h2 class="font_20 margin_t40">
                                <i class="fad fa-angle-right"></i> 경매 설정
                            </h2>
                            <hr class="left_hr margin_t20 margin_b20" />
                        </td>
                    </tr>
                    <tr class="h_60">
                        <td class="w_15p bg_f8 align ">시작가</td>
                        <td class="w_35p p_lr_5">
                            <input type="text" name="item_StartPrice" id="item_StartPrice" autocomplete="off"
                                class="input_100 ralign p_lr_5" value="0" /> 원
                        </td>

                        <td class="w_15p bg_f8 align ">입찰 단위</td>
                        <td class="w_35p p_lr_5">
                            <select name="item_BiddingUnit" id="item_BiddingUnit" class="sel_150">
                                <option value="1" selected>선택하세요</option>
                                <option value="100">100원</option>
                                <option value="200">200원</option>
                                <option value="500">500원</option>
                                <option value="1000">1,000원</option>
                                <option value="2000">2,000원</option>
                                <option value="5000">5,000원</option>
                                <option value="10000">10,000원</option>
                                <option value="20000">20,000원</option>
                                <option value="50000">50,000원</option>
                                <option value="100000">100,000원</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="tbl_line"></td>
                    </tr>
                    <tr class="h_60">
                        <td class="w_15p bg_f8 align ">경매 기간</td>
                        <td colspan="3" class="w_85p p_lr_5">
                            <span class="bold">시작일 : </span>
                            <input type="hidden" name="sDate" id="sDate">
                            <input type="text" name="startDate" id="startDate"
                                autocomplete="off" class="input_120 lalign p_lr_5" placeholder="시작일" disabled/> 일
                            <select name="sHour" id="sHour" class="sel_100">
                            	<option value="">선택하세요</option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                            </select> 시

                            <span class="bold margin_l30">마감일 : </span><input type="text" name="eDate" id="eDate"
                                autocomplete="off" class="input_120 lalign p_lr_5" placeholder="마감일" readonly /> 일
                            <select name="eHour" id="eHour" class="sel_100">
                            	<option value="">선택하세요</option>
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                            </select> 시
                        </td>
                    </tr>

                    <!-- 배송설정 -->
                    <tr>
                        <td colspan="4" class="">
                            <h2 class="font_20 margin_t40">
                                <i class="fad fa-angle-right"></i> 배송 설정
                            </h2>
                            <hr class="left_hr margin_t20 margin_b20" />
                        </td>
                    </tr>
                    <tr class="h_60">
                        <td class="w_15p bg_f8 align ">배송 방법</td>
                        <td colspan="3" class="w_35p p_lr_5">
                            <input type="radio" name="item_DeliveryWay" value="택배" class="" checked> 택배
                            <input type="radio" name="item_DeliveryWay" value="우편" class="margin_l20"> 우편
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="tbl_line"></td>
                    </tr>
                    <tr class="h_60">
                        <td class="w_15p bg_f8 align ">상품 배송비 여부</td>
                        <td class="w_35p p_lr_5">
                            <select name="item_DeliveryPrice" id="item_DeliveryPrice" class="sel_150">
                                <option value="free" selected>배송비 무료</option>
                                <option value="2000">배송비(2000원)</option>
                                <option value="3000">배송비(3000원)</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="tbl_line"></td>
                    </tr>


                </table>
                <div class="btn_grp margin_t20 align">
                    <button type="submit" id="btn" class="btn_150 bg_tomato clr_w font_12">상품등록</button>
                    <button type="button" onClick="location.href='/'" class="btn_150 font_12">등록취소</button>
                </div>
            </form>

        </section>
    </div>
</main>

<script src="../js/home/itemInsertInc.js"></script>


<script>
	$(function() {
		$('#sDate').click(function() {
			alert('시작일은 변경할 수 없습니다.');
			window.location.reload();
		});
	});
</script>