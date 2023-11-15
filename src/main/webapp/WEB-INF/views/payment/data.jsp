<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

	<style type="text/css">
	.tg  {border-collapse:collapse;border-spacing:0; background: white; table-layout: fixed; align-self: center;}
	.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:18px;
	  overflow:hidden;padding:10px 5px;word-break:normal;font-weight:bold;}
	.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
	  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
	.tg .tg-baqh{text-align:center;width:120px;}
	.tg .tg-text-r{text-align:right;width:120px;}
	.tg .tg-text-l{text-align:left;width:120px;}
	.tg .tg-d1le{border-color:inherit;font-size:26px;font-weight:bold;text-align:center;width:120px;}
	.tg .tg-baqh-b{border-bottom:none;}
	.tg .tg-baqh-t{border-top:none;}
	.tg .tg-baqh-l{border-left:none;}
	.tg .tg-baqh-r{border-right:none;}
	.tg .tg-height{height: 80px; table-layout: fixed;}
	.tg .tg-font-b{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:30px;
	  font-weight:bold;overflow:hidden;padding:10px 5px;word-break:normal;}
	</style>
	
		<table class="tg">
			<thead>
			  	<tr>
			    	<th class="tg-d1le tg-baqh-b tg-font-b" colspan="9">
			    		<h2>${paymentVO.epTitle}</h2>
			    	</th>
			  	</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tg-baqh-r tg-baqh" colspan="5">
						<h2>${paymentVO.documentFormVOs.dfKind}</h2>
				    </td>
				    
				    <td class="tg-baqh-l tg-baqh" colspan="4">
				    	<table align="right">
				    		<tr>
				    			<td class="tg-baqh">
									기안
								</td>
								<td class="tg-baqh 1stPayment">
									1차결재
								</td>
								<td class="tg-baqh 2ndPayment">
									2차결재
								</td>
								<td class="tg-baqh">
									최종결재
								</td>
				    		</tr>
				    		<tr>
				    			<td class="tg-baqh">
									${paymentVO.memberVOs.memName}
								</td>
								<td class="tg-baqh 1stPayment">
									
								</td>
								<td class="tg-baqh 2ndPayment">
									
								</td>
								<td class="tg-baqh">
									
								</td>
				    		</tr>
				    		<tr>
								<td class="tg-baqh tg-height">
									<img alt="" src="">
								</td>
								<td class="tg-baqh tg-height 1stPayment">
									<img alt="" src="">
								</td>
								<td class="tg-baqh tg-height 2ndPayment">
									<img alt="" src="">
								</td>
								<td class="tg-baqh tg-height">
									<img alt="" src="">
								</td>
							</tr>
				    	</table>
				    </td>
				</tr>

			  	<tr>
				    <td class="tg-baqh">소속</td>
				    <td class="tg-baqh" colspan="2">
				    	${paymentVO.departmentVOs.depName}
				    </td>
				    <td class="tg-baqh">직무</td>
				    <td class="tg-baqh" colspan="2">
				    	${paymentVO.memberVOs.jobCd}
				    </td>
				    <td class="tg-baqh">사번</td>
				    <td class="tg-baqh" colspan="2">
				    	${paymentVO.memberVOs.memCd}
				    </td>
			  	</tr>
			  	<tr>
			    	<td class="tg-baqh">이름</td>
				    <td class="tg-baqh" colspan="2">
				    	${paymentVO.memberVOs.memName}
				    </td>
				    <td class="tg-baqh">연락처</td>
				    <td class="tg-baqh tg-baqh-r" colspan="3">
				    	${paymentVO.memberVOs.memPnum}
				    </td>
				    <td class="tg-baqh-r tg-baqh-l tg-baqh"></td>
				    <td class="tg-baqh-l tg-baqh"></td>
			  	</tr>
			  	
			  	<c:if test="${paymentVO.documentFormVOs.dfVTab eq '1'}">
				  	<tr id="vTab">
					    <td class="tg-baqh">휴가종류</td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epVType}
					    </td>
				  	</tr>
				</c:if>
			  	
			  	<c:if test="${paymentVO.documentFormVOs.dfOTab  eq '1'}">
				  	<tr id="oTab">
					    <td class="tg-baqh">출타종류</td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epOType}
					    </td>
				  	</tr>
				</c:if>
			  	
			  	<c:if test="${paymentVO.documentFormVOs.dfDTab  eq '1'}">
				  	<tr id="dTab">
					    <td class="tg-baqh">
					    	<label>기간</label>
					    </td>
					    <td class="tg-baqh tg-baqh-r">
					    	<label>시작날짜</label>
					    </td>
					    <td class="tg-baqh tg-baqh-l" colspan="2">
					    	${paymentVO.epSDate}
					    </td>
					    <td class="tg-baqh tg-baqh-r">
					    	<label>종료날짜</label>
					    </td>
					    <td class="tg-baqh tg-baqh-l" colspan="2">
					    	${paymentVO.epEDate}
					    </td>
					    <td class="tg-baqh tg-baqh-r">
					    	${paymentVO.epDays}
					    </td>
					    <td class="tg-text-l tg-baqh-l" colspan="2">일</td>
				
				  	</tr>
				</c:if>
				  	
				<c:if test="${documentFormVO.dfPTab  eq '1'}">
				  	<tr id="pTab">
					    <td class="tg-baqh">금액</td>
					    <td class="tg-baqh-r tg-baqh" colspan="3">
					    	${paymentVO.epPrice}
					    </td>
					    <td class="tg-baqh-l tg-baqh tg-text-l">원</td>
					    <td class="tg-baqh" colspan="4">
					    	*금액은 '원'단위입니다.
					    </td>
				  	</tr>
				</c:if>

			  	<c:if test="${not empty documentFormVO.dfIn1Tab}">
				  	<tr id="i1Tab">
					    <td class="tg-baqh">
					    	${paymentVO.documentFormVOs.dfIn1Tab}
					    </td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epInput1}
					    </td>
				  	</tr>
			  	</c:if>
			  	
			  	<c:if test="${not empty documentFormVO.dfIn2Tab}">
				  	<tr id="i2Tab">
					    <td class="tg-baqh">
					    	${paymentVO.documentFormVOs.dfIn2Tab}
					    </td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epInput2}
					    </td>
				  	</tr>
			  	</c:if>
			  	
			  	<c:if test="${not empty documentFormVO.dfIn3Tab}">
				  	<tr id="i3Tab">
					    <td class="tg-baqh">
					    	${paymentVO.documentFormVOs.dfIn3Tab}
					    </td>
					    <td class="tg-baqh" colspan="8">
					    	${paymentVO.epInput3}
					    </td>
				  	</tr>
			  	</c:if>
			  	
			  	<tr>
				    <td class="tg-baqh">사유</td>
				    <td class="tg-baqh" colspan="8">
				    	${paymentVO.epReason}
				    </td>
			  	</tr>
			  	
			  	
			  	<tr>
					<td class="tg-baqh" colspan="9">
						<div class="html-editor pd-20 card-box mb-30">
							<ul class="wysihtml5-toolbar" style="">
								<li class="dropdown"><a class="btn dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-font"></i>&nbsp;<span class="current-font">Normal text</span>&nbsp;<b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="div" href="javascript:;" unselectable="on">Normal text</a></li>
										<li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h1" href="javascript:;" unselectable="on">Heading 1</a></li>
										<li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h2" href="javascript:;" unselectable="on">Heading 2</a></li>
										<li><a data-wysihtml5-command="formatBlock" data-wysihtml5-command-value="h3" href="javascript:;" unselectable="on">Heading 3</a></li>
									</ul>
								</li>
								<li>
									<div class="btn-group">
										<a class="btn" data-wysihtml5-command="bold" title="CTRL+B" href="javascript:;" unselectable="on">Bold</a>
										<a class="btn" data-wysihtml5-command="italic" title="CTRL+I" href="javascript:;" unselectable="on">Italic</a>
										<a class="btn" data-wysihtml5-command="underline" title="CTRL+U" href="javascript:;" unselectable="on">Underline</a>
									</div>
								</li>
								<li>
									<div class="btn-group">
										<a class="btn" data-wysihtml5-command="insertUnorderedList" title="Unordered list" href="javascript:;" unselectable="on"><i class="fa fa-list"></i></a>
										<a class="btn" data-wysihtml5-command="insertOrderedList" title="Ordered list" href="javascript:;" unselectable="on"><i class="fa fa-th-list"></i></a>
										<a class="btn" data-wysihtml5-command="Outdent" title="Outdent" href="javascript:;" unselectable="on"><i class="fa fa-outdent"></i></a>
										<a class="btn" data-wysihtml5-command="Indent" title="Indent" href="javascript:;" unselectable="on"><i class="fa fa-indent"></i></a>
									</div>
								</li>
								<li>
									<div class="btn-group">
										<a class="btn" data-wysihtml5-action="change_view" title="Edit HTML" href="javascript:;" unselectable="on"><i class="fa fa-pencil"></i></a>
									</div>
								</li>
								<li>
									<div class="bootstrap-wysihtml5-insert-link-modal modal fade bs-example-modal-lg">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<a class="close" data-dismiss="modal"></a>
													<h3>Insert link</h3>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<input value="http://" class="bootstrap-wysihtml5-insert-link-url form-control" type="text">
													</div>
												</div>
												<div class="modal-footer">
													<a href="#" class="btn btn-inverse" data-dismiss="modal">Cancel</a>
													<a href="#" class="btn btn-primary" data-dismiss="modal">Insert link</a>
												</div>
											</div>
										</div>
									</div>
									<a class="btn" data-wysihtml5-command="createLink" title="Insert link" href="javascript:;" unselectable="on"><i class="fa fa-link"></i></a>
								</li>
								<li>
									<div class="bootstrap-wysihtml5-insert-image-modal modal fade bs-example-modal-lg">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<a class="close" data-dismiss="modal"></a>
													<h3>Insert image</h3>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<input value="http://" class="bootstrap-wysihtml5-insert-image-url  m-wrap large form-control" type="text">
													</div>
												</div>
												<div class="modal-footer">
													<a href="#" class="btn" data-dismiss="modal">Cancel</a>
													<a href="#" class="btn  green btn-primary" data-dismiss="modal">Insert image</a>
												</div>
											</div>
										</div>
									</div>
									<a class="btn" data-wysihtml5-command="insertImage" title="Insert image" href="javascript:;" unselectable="on"><i class="fa fa-image "></i></a>
								</li>
							</ul>
							<textarea class="textarea_editor form-control border-radius-0" style="display: none;" placeholder="Enter text ..."></textarea>
							<input type="hidden" name="_wysihtml5_mode" value="1">
							<iframe class="wysihtml5-sandbox" security="restricted" allowtransparency="true" frameborder="0" width="0" height="0" marginwidth="0" marginheight="0" style="display: block; background-color: rgb(255, 255, 255); border-collapse: separate; border-color: rgb(212, 212, 212); border-style: solid; border-width: 0.8px; clear: none; float: none; margin: 0px; outline: rgb(19, 30, 34) none 0px; outline-offset: 0px; padding: 6px 12px; position: static; inset: auto; z-index: auto; vertical-align: baseline; text-align: start; box-sizing: border-box; box-shadow: none; border-radius: 0px; width: 1119.2px; height: 300px;"></iframe>
						</div>
					</td>
			  	</tr>
			  	
			  	<tr>
			    	<td class="tg-baqh" colspan="9">
			    		${paymentVO.documentFormVOs.dfContents}
			    	</td>
			  	</tr>
			  	
			  	<tr>
			    	<td class="tg-baqh tg-baqh-b" colspan="9">
						${paymentVO.epRDate}
			    	</td>
			  	</tr>
			  		
			  	<tr>
			    	<td class="tg-text-r tg-baqh-r tg-baqh-b tg-baqh-t" colspan="7">성명 : </td>
			    	<td class="tg-baqh-l tg-baqh-r tg-baqh tg-baqh-b tg-baqh-t" colspan="1">
			    		${paymentVO.memberVOs.memName}
			    	</td>
			    	<td class="tg-baqh-l tg-baqh-b tg-baqh-t tg-baqh" colspan="1">(인)</td>
			  	</tr>
			  	
			  	<tr>
			    	<td class="tg-baqh tg-font-b tg-baqh-t" colspan="9">구디병원 병원장 귀하</td>
			  	</tr>
			  	
			</tbody>
		</table>
		<div>
			<button type="submit" class="btn btn-danger" name="" value="2">반려</button>
			<button type="submit" class="btn btn-success" name="" value="0">승인</button>
		</div>



<script src="http://code.jquery.com/jquery-latest.min.js"></script>