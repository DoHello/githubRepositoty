<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.derbysoft.enums.*"%>
<%@ page language="java" import="dy.hrtworkframe.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>

<link rel="stylesheet" type="text/css" href="css/imgView.css"/>
<link rel="stylesheet" type="text/css" href="js/webuploader/style.css"/>
<link rel="stylesheet" type="text/css" href="js/webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="js/webuploader/webuploadcontoller.css"/>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file://-->
<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<body>
	<base href="<%=basePath%>">
	<%@ include file="../../top.jsp"%>
	<%@ include file="../../head.jsp"%>

	<div id="page" style='top:${model.direct==1?0:'60px'}'>
		<div id="pageBody" class="scrollbar-hover">
			<!-- sidebar start -->
			<%@ include file="../../left.jsp"%>
			<!-- sidebar end -->
			
			<!-- content start -->
			<div class="admin-content am-animation-slide-right clearfix">
				<div style="padding:20px; ">
					<h2 style="color:#353535; display:inline;">模块管理 » 新增</h2>
					<button data-toggle="tooltip" type="button" class="btn btn-link path-close-btn path-btn" id="pageCloseBtn" data-original-title="关闭（ESC）"><i class="path-1"></i></button>
				</div>
				<hr style="margin:0 10px;">
				
				<div style="padding:10px; ">
				<div class="panel">
				<div class="panel-body">
					<form id="mainForm" class="form-horizontal" role="form" method='post'>
 						<div class="form-group">
							<label class="col-md-2 control-label">模块编码</label>
							<div class="col-md-3" >
								<input type="text" name="moduleID" id="moduleID" value="${model.entity.searchText}" class="form-control">
							</div>
							
							<label class="col-md-1 control-label">模块名称</label>
							<div class="col-md-3" >
								<input type="text" name="moduleName" id="moduleName" value="${model.entity.moduleName}" class="form-control">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-2 control-label">路径</label>
							<div class="col-md-3" >
								<input type="text" name="modulePath" id="modulePath" value="${model.entity.modulePath}" class="form-control">
							</div>
							<label class="col-md-1 control-label">上级模块</label>
							<div class="col-md-3" >
								<input type="text" name="parentID" id="parentID" value="${model.entity.operatInfo}" class="form-control">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-2 control-label">是否有子菜单</label>
							<div class="col-md-3" >
								<input type="text" name="isMenu" id="isMenu" value="${model.entity.isMenu}" class="form-control">
							</div>
							
							<label class="col-md-1 control-label">显示顺序</label>
							<div class="col-md-3" >
								<input type="text" name="showIndex" id="showIndex" value="${model.entity.showIndex}" class="form-control">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-2 control-label">状态</label>
							<div class="col-md-3" >
								<input type="text" name="status" id="status" value="${model.entity.status}" class="form-control">
							</div>
							
							<label class="col-md-1 control-label">描述</label>
							<div class="col-md-3" >
								<input type="text" name="description" id="description" value="${model.entity.description}" class="form-control">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-2 control-label">应用平台</label>
							<div class="col-md-3" >
								<input type="text" name="appPlatform" id="appPlatform" value="${model.entity.appPlatform}" class="form-control">
							</div>
							
							<label class="col-md-1 control-label">菜单图标</label>
							<div class="col-md-3" >
								<input type="text" name="iconClass" id="iconClass" value="${model.entity.iconClass}" class="form-control">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-2 control-label">链接地址</label>
							<div class="col-md-3" >
								<input type="text" name="url" id="url" value="${model.entity.url}" class="form-control">
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-md-3" >
								<button type="button" id="btnCommit" class="btn btn-primary">提交</button>
							</div>
						</div>
					</form>
				</div>
				</div>
				</div>
			</div>
			<!-- content end -->
		
		</div>
	</div>
	<div id="append_parent" style="z-index: 10000"></div>
	
	<%@ include file="../../footer.jsp"%>
</body>

<script type="text/javascript">
	window.onload = function() {
		$('#page').css('display', 'block');
		
		if ($.fn.chosen) {
			$('#pageBody .chosen-select').chosen();
		}
	
		if ($.fn.datetimepicker) {
			$('#pageBody .form-date').datetimepicker({
				language: 'zh-CN',
				weekStart: 1,
				todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0,
				format: 'yyyy-mm-dd'
			});
		}
		
		// Chosen联动
		$('#companyID').change(function() {
			var s = $('#companyID').val();
			var t = "";
			$('#companyID option').each(function(idx) {
				var txt = $(this).text(); //获取单个text
				var val = $(this).val(); //获取单个value
				
				if (s == null) {
					t = "";
				} else if (s.indexOf(val) >= 0 && t.indexOf(txt) < 0) {
					//t += "," + txt;
					t = txt;
				}
			});
			$('#companyName').attr('value', t);
		})
		
		$('#companyID').trigger('change');
	}
	
	
	$("#btnCommit").click(function() {
		$('#loading-waiting-modal').modal({closeViaDimmer:false});
		$.ajax({
			type : 'POST',
			url : "systemmodule.do?p=add",
			data : $("#mainForm").serialize(),
			cache : false,
			dataType : 'json',
			
			success: function(data) {
				handsuc(data, 'insert', 'role.do?p=showmoduleview&moduleID=${model.chooseModuleID}&parentID=${model.chooseParentID}&direct=${model.direct}');	
			},
			
			error:function(data) {
				handerr(data, 'insert')
			}
		});
	});
	
	
	$('#pageCloseBtn').click(function() {
		window.location.href = "role.do?p=showmoduleview&moduleID=${model.chooseModuleID}&parentID=${model.chooseParentID}&direct=${model.direct}";
	});
</script>
<!-- 
<script type="text/javascript" src="js/pinYinCode.js"></script>
<script type="text/javascript" src="js/myjs/pageList.js"></script>
<script type="text/javascript" src="js/webuploader/webuploader.js"></script>
<script type="text/javascript" src="js/webuploader/webuploadcontoller.js"></script>
-->
</html>

	
