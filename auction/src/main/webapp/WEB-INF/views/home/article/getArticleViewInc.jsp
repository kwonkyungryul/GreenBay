<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/css/article/article.css">
<script src="/ckeditor/ckeditor.js"></script>
<script src="/js/article/comment.js"></script>

<body>
	<div id="container">
		<div class="main_location p_b_20 clr_6 margin_b20">
            <i class="fas fa-home "></i> <span class="clr_0">홈</span>
            <i class="far fa-chevron-right margin_l10 margin_r10"></i><span class="clr_0">고객센터</span>
            <i class="far fa-chevron-right margin_l10 margin_r10"></i><span class="clr_0 bold">${boardConfig.boardName}</span>
        </div>
        <div id="article_top" class="margin_b20">
            <span class="float_l noto font_18 bold">게시물 상세 보기 페이지 입니다.</span>
            <span class="float_r noto font_14"><strong>${boardConfig.boardName}</strong> 게시판입니다.</span>
            <div class="clearfix"></div>
        </div>
        
		<!-- 글쓰기 -->

		<table>
			<tr><td class="tbl_line" colspan="2"></td></tr>
			<tr class="h_50">
				<td class="w_15p align clr_w bold" style="background-color: #114da5;">게시물 제목</td>
				<td class="w-85p p_lr_5">${articleView.subject}</td>
			</tr>
			<tr><td class="tbl_line" colspan="2"></td></tr>
			<tr class="h_50">
				<td class="w_15p align clr_w bold" style="background-color: #114da5;">게시물 작성자</td>
				<td class="w-85p p_lr_5">${articleView.writer}</td>
			</tr>
			<tr><td class="tbl_line" colspan="2"></td></tr>
			<tr class="h_50">
				<td class="w_15p align clr_w bold" style="background-color: #114da5;">게시물 내용</td>
				<td class="w-85p p_lr_5"><textarea name="content" id="editor" readonly>${articleView.content}</textarea></td>
				<script>
					CKEDITOR.replace('editor');
					CKEDITOR.config.height=200;
				</script>
			</tr>
			<tr><td class="tbl_line" colspan="2"></td></tr>
			<tr class="h_50">
				<td class="w_15p align clr_w bold" style="background-color: #114da5;">게시물 첨부파일</td>
				<td class="w-85p p_lr_5">
					<c:if test="${articleView.fileOriName == null}">
						<span class="bold">첨부하신 파일이 없습니다.</span>
					</c:if>
					
					<c:if test="${articleView.fileOriName ne ''}">
						<span class="bold">
							<a href="/article/fileDown?boardCode=${boardCode}&aseq=${articleView.aseq}" class="">${articleView.fileOriName}</a>
						</span>
					</c:if>
				</td>
			</tr>
			<tr><td class="tbl_line" colspan="2"></td></tr>
			<tr class="h_50">
				<td class="w_15p align clr_w bold" style="background-color: #114da5;">게시물 조회수</td>
				<td class="w-85p p_lr_5">${articleView.hit}회</td>
			</tr>
		</table>
		<div class="btn_grp margin_t10">
			<span class="float_l">
				<button type="button" onClick="location.href='/article?boardCode=${boardCode}'"class="btn_80 bo_gray">목록보기</button>
			</span>
			<span class="float_r">
			${SessionScope.user_Auth}
				<c:if test="${sessionScope.user_Auth == 'admin'}">
					<button type="button" onClick="location.href='/article/getArticleReply?boardCode=${boardCode}&aseq=${articleView.aseq}'" class="btn_80 bo_blue">답글달기</button>
				</c:if>
				<c:if test="${sessionScope.user_Auth == 'admin' || sessionScope.user_Name == articleView.writer}">
					<button type="reset" onClick="location.href='/article/setArticleModify?boardCode=${boardCode}&aseq=${articleView.aseq}'" class="btn_80 bo_blue">게시물 수정</button>
					<button type="button" onClick="selectedDelete('${boardCode}', '${articleView.aseq}')" class="btn_80 bo_blue">게시물 삭제</button>
				</c:if>
			</span>
			<div class="clearfix"></div>
		</div>

		<!-- //글쓰기 -->

		<!-- 댓글달기 : 입력 & 출력 -->
		<div class="margin_t30">
			<form name="" id="commentSet" action="">
				<div class="comment_wrap">
					<div class="comment_left">
						<input type="hidden" id="who" name="who" value="${sessionScope.user_Name}" />
						<input type="hidden" id="boardCode" name="boardCode" value="${boardCode}" />
						<input type="hidden" id="aseq" name="aseq" value="${articleView.aseq}" />
						<textarea class="bo_gray p_a_10 font_14 kor" id="comment" name="comment"></textarea>
					</div>
					
					<div class="comment_right">
						<button type="button" id="commentSetBtn" class="font_14 bold bo_gray">댓글달기</button>
					</div>
				</div>
			</form>
		</div>
		
		<div class="comment-list">
			<div class="commentList"></div>
		</div>
    </div>
</body>

<script>

</script>

<script>
	initSample();
</script>

