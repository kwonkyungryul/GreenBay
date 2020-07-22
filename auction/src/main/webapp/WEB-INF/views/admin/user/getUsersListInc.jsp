<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.user_Auth ne 'admin'}">
	<script>
		alert("접근 권한이 없습니다. 관리자에게 문의하세요.");
		window.location.replace('/');
	</script>
</c:if>

<main>
    <div class="main_bottom_box p_t20 p_lr_20">
        <div class="bx_sh2 bg_white p_a_20 margin_b20 br_3">
            <div class="title_wrap">
                <span class="font_16 bold">1. 회원목록</span>
                <c:if test="${words eq ''}">
                	<span>전체 회원은 <strong>${usersCount}명 </strong>입니다.</span>
                </c:if>
                
                <c:if test="${words ne ''}">
                	<span>검색된 회원은 <strong>${usersCount}명 </strong>입니다.</span>
                </c:if>
            </div>
            <div class="search_wrap margin_t20 ">
                <span class="">
                    <button type="button" id="selectDelete_btn" class="btn_80 clr_6 bo_green">선택삭제</button>
                </span>
                <span class="">
                    <form action="/users" method="post">
                        <select name="searchOpt" id="searchOpt" class="sel_120">
                            <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if> >전체보기</option>
                            <option value="user_ID" <c:if test="${searchOpt eq 'user_ID'}">selected</c:if> >아이디</option>
                            <option value="user_Name" <c:if test="${searchOpt eq 'user_Name'}">selected</c:if> >이름</option>
                        </select>
                        <input type="search" name="words" id="words" class="input_150 bo_blue" value="${words}" />
                        <button type="submit" id="search_btn" class="btn_50 clr_6 bo_blue">검색</button>
                        <button type="button" onClick="location.href='/users'" class="btn_80 clr_6 bo_gray">목록보기</button>
                    </form>
                </span>
            </div>
            <table class="margin_t10">
                <tr class="h_45 clr_w bg_userT"><!-- #114da5 -->
                    <th class="td_5">
                    	<input type="checkbox" id="chkAll" class="dp_in valign w_20 h_20" />
                    </th>
                    <th class="td_5">No.</th>
                    <th class="td_15">회원아이디</th>
                    <th class="td_15">회원이름</th>
                    <th class="td_10">권한</th>
                    <th class="td_20">이메일</th>
                    <th class="td_10">가입일</th>
                    <th class="td_20">-</th>
                </tr>
                <c:forEach items="${uvo}" var="uvo" varStatus="status">
	                <tr class="h_45 align">
	                    <td>
	                    	<input type="checkbox" class="chk dp_in valign w_20 h_20" data-useq="${uvo.useq}" />
	                    </td>
	                    <td>${(usersCount - status.index) - ( (num - 1) * end )}</td>
	                    <td class="bold">
	                    	<a href="/users/userView?useq=${uvo.useq}">
	                    		${uvo.user_ID}
	                    	</a>
	                    </td>
	                    <td>${uvo.user_Name}</td>
	                    <td>
	                        <select name="user_Auth" id="user_Auth" onchange="authUpdate(this.value, ${uvo.useq})" class="sel_100">
	                            <option value="new" <c:if test="${uvo.user_Auth eq 'new'}">selected</c:if> >NEW</option>
	                            <option value="general" <c:if test="${uvo.user_Auth eq 'general'}">selected</c:if> >GENERAL</option>
	                            <option value="admin" <c:if test="${uvo.user_Auth eq 'admin'}">selected</c:if> >ADMIN</option>
	                        </select>
	                    </td>
	                    <td>${uvo.user_Email}@${uvo.user_Domain}</td>
	                    <td>${uvo.regdate}</td>
	                    <td>
	                        <button type="button" onClick="userDelete('${uvo.useq}')" class="bo_green btn_50">삭제</button>
	                        <button type="button" onClick="location.href='/users/userModify?useq=${uvo.useq}'" class="bo_sky btn_50">수정</button>
	                    </td>
	                </tr>
	            </c:forEach>
	            <c:if test="${usersCount eq 0}">
	            	<tr class="h_50"><td colspan="8" class="align bold clr_6 font_16">검색된 회원이 없습니다.</td></tr>
	            </c:if>
            </table>
            <div class="margin_t20">
	            <c:if test="${prev}">
		        	<span>
		        		<a href="/users?num=${startPageNum - 1}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="w_40 h_40 dp_in align valign clr_w" style="border: 1px solid #17a2b8;">이전</a>
		        	</span>
		        </c:if>
		        <!-- //이전 -->
		        <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
		        	<c:if test="${select == num}">
			        	<span>
				            <a href="/users?num=${num}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="w_40 h_40 dp_in align valign clr_w bg_userT">${num}</a>
			        	</span>
			        </c:if>

			        <c:if test="${select != num}">
			        	<span>
				            <a href="/users?num=${num}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="w_40 h_40 dp_in align valign clr_6 bo_userT">${num}</a>
			        	</span>
			        </c:if>
			    </c:forEach>
			        <!-- 다음 -->
			    <c:if test="${next}">
			       	<span >
			       		<a href="/users?num=${endPageNum + 1}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="w_40 h_40 dp_in align valign clr_w" style="border: 1px solid #17a2b8;">다음</a>
			       	</span>
			    </c:if>
		        	<!-- //다음 -->
		    </div>
        </div>
    </div>
</main>

<script src="../js/admin/user/usersList.js"></script>