<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/views/layout/summernote.jsp"></c:import>
<script src="/vendors/scripts/board/file.js"></script>



<div class="container-fluid">
    <div class="row justify-content-center my-4">
        <h1 class="col-md-7 text-center">공지사항 등록</h1>
    </div>

    <div class="row justify-content-center my-4">
        <form class="col-md-7" action="insert" method="post" id="frm" enctype="multipart/form-data">
            <!-- 로그인 상태 확인 -->
           <%--  <c:if test="${empty member}">
                <div class="alert alert-danger">관리자만 등록가능합니다.</div>
            </c:if> --%>
           <div class="form-check form-check-inline mb-3">
			    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="notImportant" value="1">
			    <label class="form-check-label" for="inlineCheckbox1">중요공지여부</label>
			    <input type="hidden" name="notImportant" value="0"> <!-- 기본값으로 0을 설정 -->
			</div>

            
            <div class="pull-right">
                <span class="input-group-text">${depName} : ${memName}</span>
            </div>
               
			        <input class="form-control" name="memCd" value="${memCd}" style="display: none;">
		
           <div class="mb-3">
			    <label for="notTile" class="form-label">제목 (필수)</label>
			    <div class="input-group">
			        <input type="text" class="form-control" id="notTitle" name="notTitle" placeholder="제목 입력">
			    </div>
		   </div>
			
			<!-- 썸머노트 에디터를 사용할 textarea -->
			<div class="mb-3">
			    <label for="notContents" class="form-label">내용 (필수)</label>
			    <div class="input-group">
			        <textarea name="notContents" class="summernote form-control"></textarea>
			    </div>
			</div>

 			<div class="mb-3">
			    <button type="button" class="btn btn-primary" id="insert">파일 추가 <i class="icon-copy fi-upload"></i></button>
			</div>
			<div id="fileList" class="my-5">
			    <!-- 초기에는 아무 파일 입력 상자도 없습니다. -->
			</div>

         
            <div class="mb-3">
                <input class="my btn btn-primary" type="submit" id="btn" value="글쓰기">
            </div>
        </form>
    </div>
</div>

<script>
    // 썸머노트 초기화
    $('.summernote').summernote({
        height: 300
    });
</script>
<script src="/vendors/scripts/board/NoticeInsert.js"></script>

