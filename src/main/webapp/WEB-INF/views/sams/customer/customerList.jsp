<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/customer/customer/">客户列表</a></li>
		<shiro:hasPermission name="customer:customer:edit"><li><a href="${ctx}/customer/customer/form">客户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="customer" action="${ctx}/customer/customer/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>邮箱：</label>
				<form:input path="email" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>用户类型：</label>
				<form:input path="customerType" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>地址：</label>
				<form:input path="address" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li><label>年龄：</label>
				<form:input path="age" htmlEscape="false" maxlength="2" class="input-medium"/>
			</li>
			<li><label>已婚：</label>
				<form:input path="married" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>spouse_name：</label>
				<form:input path="spouseName" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>姓名</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="customer:customer:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="customer">
			<tr>
				<td><a href="${ctx}/customer/customer/form?id=${customer.id}">
					${customer.name}
				</a></td>
				<td>
					<fmt:formatDate value="${customer.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${customer.remarks}
				</td>
				<shiro:hasPermission name="customer:customer:edit"><td>
    				<a href="${ctx}/customer/customer/form?id=${customer.id}">修改</a>
					<a href="${ctx}/customer/customer/delete?id=${customer.id}" onclick="return confirmx('确认要删除该客户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>