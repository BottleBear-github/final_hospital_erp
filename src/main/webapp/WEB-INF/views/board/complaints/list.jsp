<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- Datatable start -->
<div class="card-box mb-30">
    <div class="pd-20">
        <h4 class="text-blue h4">민원게시판</h4>
    </div>
    <div class="pb-20">
        <table class="datatable table nowrap">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>민원종류</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>조치여부</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${data}" var="complaints">
                    <tr>
                        <td>${complaints.compCd}</td>
                        <td>
                            <c:choose>
                                <c:when test="${complaints.compSecret == 1}">
                                    <i class="icon-copy fa fa-lock" aria-hidden="true"></i>비공개글입니다
                                </c:when>
                                <c:otherwise>
                                    ${complaints.codeTypeName}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${complaints.compSecret == 1}">
                                    <i class="icon-copy fa fa-lock" aria-hidden="true"></i>비공개글입니다
                                </c:when>
                                <c:otherwise>
                                    ${complaints.compTitle}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${complaints.compSecret == 1}">
                                    <i class="icon-copy fa fa-lock" aria-hidden="true"></i>비공개글입니다
                                </c:when>
                                <c:otherwise>
                                    ${complaints.memCd}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                        
                        
                            <c:choose>
                                <c:when test="${complaints.compSecret == 1}">
                                    <i class="icon-copy fa fa-lock" aria-hidden="true"></i>비공개글입니다
                                </c:when>
                                <c:otherwise>
                                    ${complaints.compRdate}
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            ${complaints.actionTypeName}
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div>
            <button class="my btn btn-primary" type="button">
                <a href="./insert" style="color: white;">글쓰기</a>
            </button>
        </div>
    </div>
</div>
<!-- Datatable End -->
