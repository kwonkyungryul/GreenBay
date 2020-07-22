<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <jsp:useBean id="cutString" class="com.example.auction.util.CutString" /> --%>

<main>
    <div id="container" class="p_b30">
        <div class="main_location p_b_20 clr_6 margin_b20">
            <i class="fas fa-home "></i> <span class="clr_0">홈</span>
            <i class="far fa-chevron-right margin_l10 margin_r10"></i><span class="clr_0">고객센터</span>
            <i class="far fa-chevron-right margin_l10 margin_r10"></i><span class="clr_0 bold">${boardConfig.boardName}</span>
        </div>
		<div class="title_wrap p_t20">
	        <h2 class="font_20">
	            <i class="fad fa-angle-right"></i> ${boardConfig.boardName}
	        </h2>
	        <span class="">
		        <form action="/article?boardCode=${boardCode}" method="post">
		            <select name="searchOpt" id="searchOpt" class="sel_120">
		                <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if>>전체</option>
		                <option value="subject" <c:if test="${searchOpt eq 'subject'}">selected</c:if> >게시물제목</option>
		                <option value="writer" <c:if test="${searchOpt eq 'writer'}">selected</c:if> >작성자</option>
		                <option value="content" <c:if test="${searchOpt eq 'content'}">selected</c:if> >내용</option>
		            </select>
		            <input type="search" name="words" id="words" class="input_150 bo_blue" value="${words}" />
		            <button type="submit" id="search-btn" class="btn_50 bold bo_blue">검색</button>
		            <button type="button" onClick="location.href='/article?boardCode=${boardCode}'" class="btn_80 bold bo_gray">전체보기</button>
		            <c:if test="${boardConfig.boardName eq '질문과 답변'}">
		            	<button type="button" onClick="location.href='/article/setArticle?boardCode=${boardCode}'" class="btn_80 bold bo_gray">글쓰기</button>
		            </c:if>
		            <c:if test="${boardConfig.boardName eq '공지사항' && sessionScope.user_Auth eq 'admin' }">
		            	<button type="button" onClick="location.href='/article/setArticle?boardCode=${boardCode}'" class="btn_80 bold bo_gray">글쓰기</button>
		            </c:if>
		        </form>
		    </span>
	        
		</div>
		<hr class="left_hr margin_t20 margin_b20" />
        <!-- search_wrap 부분 -->

        <!-- // search_wrap 부분 -->

        <table>
            <tr class="h_50 bg_sy clr_w" style="background-color: #114da5;">
                <th class="w_5p">번호</th>
                <th class="w_40p">제목</th>
                <th class="w_10p">글쓴이.</th>
                <th class="w_10p">조회.</th>
                <th class="w_10p">날짜.</th>
                <th class="w_20p">Etc</th>
            </tr>
            <c:forEach items="${articleList}" var="articleList" varStatus="status">
	            <tr>
	                <td colspan="6" class="tbl_line"></td>
	            </tr>
	            <tr class="h_50">
	                <td class="align">${(articleCount - status.index) - ( (num - 1) * end )}</td>
	                <td class="lalign">
	                	<c:forEach begin="0" end="${articleList.re_level}">
							&nbsp;&nbsp;&nbsp;
			            </c:forEach>
	                	<a href="/article/getArticleView?boardCode=${boardCode}&aseq=${articleList.aseq}">
<%-- 		                	${cutString.strCutBytes(articleList.subject, 30, 2)} --%>
							${articleList.subject}
		                	<span class="font_12 clr_tomato valign">(${articleList.cnt})</span>
		                </a>
	                </td>
	                <td class="align">${articleList.writer}</td>
	                <td class="align">${articleList.hit}</td>
	                <td class="align">
<%-- 	                ${articleList.regdate} --%>
						<fmt:parseDate value="${articleList.regdate}" var="regdate" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate value="${regdate}" var="articleRegdate" pattern="yyyy.MM.dd"/>
						${articleRegdate}
	                </td>
	                <td class="align">-</td>
	            </tr>
	            <tr>
	                <td colspan="6" class="tbl_line"></td>
	            </tr>
            </c:forEach>
        </table>
        <div class="btn_grp align margin_t20 margin_b20">
		    <!-- 이전 -->
	        <c:if test="${prev}">
	        	<span class="margin_r10 dp_in align" style="border: 1px solid #114da5;">
	        		<a href="/article?boardCode=${boardCode}&num=${startPageNum - 1}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="dp_in w_40 h_40 clr_6">이전</a>
	        	</span>
	        </c:if>
	        <!-- //이전 -->
	        <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
	        	<c:if test="${select == num}">
		        	<span class="margin_r10 dp_in align" style="background-color: #114da5; border: 1px solid #114da5;">
			            <a href="/article?boardCode=${boardCode}&num=${num}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="page-number member-page-number dp_in w_40 h_40 clr_w">${num}</a>
		        	</span>
		        </c:if>
	
		        
		        <c:if test="${select != num}">
		        	<span class="margin_r10 dp_in align" style="border: 1px solid #114da5;">
			            <a href="/article?boardCode=${boardCode}&num=${num}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="page-number member-page-number dp_in w_40 h_40">${num}</a>
		        	</span>
		        </c:if>
		    </c:forEach>
		    
		    <!-- 다음 -->
		    <c:if test="${next}">
		       	<span class="dp_in align" style="border: 1px solid #114da5;">
		       		<a href="/article?boardCode=${boardCode}&num=${endPageNum + 1}&searchOpt=${searchOpt}&words=${words}&template=${template}&mypage=${mypage}" class="dp_in w_40 h_40 clr_6">다음</a>
		       	</span>
		    </c:if>
        	<!-- //다음 -->
		</div>
    </div>
</main>