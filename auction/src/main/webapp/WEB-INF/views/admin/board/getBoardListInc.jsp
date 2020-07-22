<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 분기문에 따라 바뀌는 부분 -->
<div id="main-board" class="p_a_20 br_3 margin_t20 bg_white margin_l20 margin_r20 bx_sh2">
    <div class="title_wrap">
        <span class="font_16 bold">2. 게시판 목록</span>
        <span class="kor font_14">
        	<c:if test="${words eq ''}">
        		전체 생성된 게시판은 <strong>${boardCount}개</strong>입니다.
        	</c:if>
        	
        	<c:if test="${words ne ''}">
        		검색된 게시판은 <strong>${boardCount}개</strong>입니다.
        	</c:if>
        </span>
    </div>

    <div class="search_wrap margin_t20">
        <span class="font_16 bold">
            <button type="button" id="selectDelete-btn" class="btn_80 bold bo_green">선택삭제</button>
            <button type="button" onClick="location.href='/board/setBoard'" class="btn_80 bold bo_green">게시판 생성</button>
        </span>
        <span class="">
            <form action="/board" method="post">
                <select name="searchOpt" id="searchOpt" class="sel_120">
                    <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if>>전체</option>
                    <option value="boardName" <c:if test="${searchOpt eq 'boardName'}">selected</c:if> >게시판이름</option>
                    <option value="boardCode" <c:if test="${searchOpt eq 'boardCode'}">selected</c:if> >게시판코드</option>
                </select>
                <input type="search" name="words" id="words" class="input_150 bo_blue" value="${words}" />
                <button type="submit" id="search-btn" class="btn_50 bold bo_blue">검색</button>
                <button type="button" onClick="location.href='/board'" class="btn_80 bold bo_gray">전체보기</button>
            </form>
        </span>
    </div>
    <div id="member-list" class="margin_t10">
        <table>
            <tr class="h_45 clr_w bg_boardT align eng font_14">
                <td class="td-5">
                    <input type="checkbox" id="chkAll" class="w_20 h_20 dp_in valign" data-bseq />
                </td>
                <td class="w_5p">No.</td>
                <td class="w_15p">Code</td>
                <td class="w_15p">Name</td>
                <td class="w_10p">Maker</td>
                <td class="w_15p">Color</td>
                <td class="w_15p">Regdate</td>
                <td class="w_20p">-</td>
            </tr>
            <c:if test="${boardCount == 0}">
	            <tr class="h_45 kor">
	            	<td class="align bold font_16" colspan="8">검색된 결과가 없습니다</td>
	            </tr>
	            <td colspan="8" class="tbl_line "></td>
	        </c:if>
            <c:forEach items="${boardList}" var="boardList">
	            <tr class="h_45 align">
	                <td><input type="checkbox" class="chk dp_in valign w_20 h_20" data-bseq="${boardList.bseq}" /></td>
	                <td>${boardList.bseq}</td>
	                <td><a href="/article?boardCode=${boardList.boardCode}" class="eng bold" target="_blank">${boardList.boardCode}</a></td>
	                <td><a href="/article?boardCode=${boardList.boardCode}" target="_blank">${boardList.boardName}</a></td>
	                <td>${boardList.boardMaker}</td>
	                <td>
	                	<span class="clrBox clr_w br_5 font_14" style="background-color: ${boardList.boardColor}; padding: 8px 12px;">${boardList.boardColor}</span>
	                </td>
	                <td>${boardList.boardRegdate}</td>
	                <td>
	                	<button type="button" onClick=""
	                        class="btn_50 bold bo_blue">수정</button>
						
		                <button type="button" onClick="location.href='/board/deleteBoard?boardCode=${boardList.boardCode}'"
		                	class="btn_50 bold bo_blue">삭제</button>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="8" class="tbl_line "></td>
	            </tr>
	        </c:forEach>
        </table>
        <div class="page-grp margin_t10">
        	<c:forEach begin="1" end="${pageNum}" var="num">
        	    <span class="">
	                <a href="/board?num=${num}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="page-number member-page-number">${num}</a>
            	</span>
	        </c:forEach>
        </div>
    </div>
</div>

</body>
<script src="../js/board/board.js"></script>

</html>