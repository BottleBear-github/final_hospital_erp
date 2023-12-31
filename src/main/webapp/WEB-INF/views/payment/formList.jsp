<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>전자결재</h1>
<h2>결재문서작성</h2>

<div>
	<a type="button" class="btn btn-danger" href="/payment/documentForm/insert">문서양식추가</a>
</div>

<div>
	<c:forEach items="${list}" var="vo">
		<input type="button" class="btn btn-success btn-formData" data-dfCd="${vo.dfCd}" id="${vo.dfCd}" value="${vo.dfKind}">
	</c:forEach>
</div>


<div id="ajaxResult">

</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function () {
		$(".btn-formData").on("click", function () {
			dfCodeResult=$(this).attr('id');
	        console.log(dfCodeResult);
			console.log($(this).attr('id'));
			console.log($(this).val());
			console.log(this);
			console.log($(this));
			$.ajax({
			    type : 'get', // 타입 (get, post, put 등등)
			    url : '/payment/insert?dfCd='+dfCodeResult, // 요청할 서버url
			    contentType : 'application/json; charset=utf-8',
			    success : function(result) { // 결과 성공 콜백함수
			        $('#ajaxResult').empty();
			    	$('#ajaxResult').append(result);
			    },
			    error : function(request, status, error) { // 결과 에러 콜백함수
			        console.log(error)
			    }
			})
		});
	});
</script>