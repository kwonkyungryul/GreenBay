<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/css/article/article.css">
<script src="/ckeditor/ckeditor.js"></script>


<body>
    <div id="container">
        <div id="article_top" class="margin_b20">
            <span class="float_l noto font_18 bold">게시물 작성 페이지 입니다.</span>
            <span class="float_r noto font_14"><strong>${boardConfig.boardName}</strong> 게시판입니다.</span>
            <div class="clearfix"></div>
        </div>
    	

		<!-- 글쓰기 -->
		<form method="post" action="/article/setArticle" enctype="multipart/form-data">
			<input type="hidden" name="boardCode" value="${boardCode}" />
			<table>
				<tr><td class="tbl_line" colspan="2"></td></tr>
				<tr class="h_50">
					<td class="w_15p align clr_w bold" style="background-color: #114da5;">게시물 제목</td>
					<td class="w_85p p_lr_5"><input type="text" class="input_full p_lr_10 font_14" name="subject" id="subject" autofocus></td>
				</tr>
				<tr><td class="tbl_line" colspan="2"></td></tr>
				<tr class="h_50">
					<td class="w_15p align clr_w bold" style="background-color: #114da5;">게시물 작성자</td>
					<td class="w_85p p_lr_5"><input type="text" class="input_150 p_lr_10" maxlength="5" value="${sessionScope.user_Name}" readonly name="writer" id="writer"></td>
				</tr>
				<tr><td class="tbl_line" colspan="2"></td></tr>
				<tr class="h_50">
					<td class="w_15p align clr_w bold" style="background-color: #114da5;">게시물 내용</td>
					<td class="w_85p p_lr_5"><textarea name="content" id="editor"></textarea></td>
					<script>
						CKEDITOR.replace('editor');
						CKEDITOR.config.height=200;
					</script>
				</tr>
				<tr><td class="tbl_line" colspan="2"></td></tr>
				<tr class="h_50">
					<td class="w_15p align clr_w bold" style="background-color: #114da5;">게시물 첨부파일</td>
					<td class="w_85p p_lr_5"><input type="file" name="files"></td>
				</tr>
				<tr><td class="tbl_line" colspan="2"></td></tr>
			</table>
			<div class="btn_grp margin_t10 margin_b20">
				<span class="float_l">
					<button type="button" onClick="location.href='/article?boardCode=${boardCode}'"class="btn_80 bo_gray">목록보기</button>
				</span>
				<span class="float_r">
					<span class="float_l">
						<button type="submit" id="reg_btn" class="btn_80 bo_blue">게시물 등록</button>
						<button type="reset" onClick="location.href='/article?boardCode=${boardCode}'" class="btn_80 bo_blue">등록 취소</button>
					</span>
				</span>
				<div class="clearfix"></div>
			</div>
		</form>
		<!-- //글쓰기 -->

    </div>
</body>

<script>
	initSample();
</script>

<script>
	$(function() {
		$('#reg_btn').click(function() {
			var str = CKEDITOR.instances.editor;
			if ( !str.getData() ) {
				alert("게시물 내용를 입력하세요.");
				str.focus();
				return false;
			}
		});
	});
</script>
