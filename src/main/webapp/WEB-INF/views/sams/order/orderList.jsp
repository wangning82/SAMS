<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单管理</title>
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
	</ul>
	<form:form id="searchForm" modelAttribute="order" action="${ctx}/sams/order/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>编号：</label>
			<form:input path="code" htmlEscape="false" maxlength="64" class="input-medium"/>
		</li>
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>签订时间：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>合同日期：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>编号</th>
				<th>签订日期</th>
				<th>客户</th>
				<th>手机号</th>
				<th>总金额</th>
				<th>创建时间</th>
				<th>创建人</th>
				<shiro:hasPermission name="sams:order:order:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="order">
			<tr>
				<td><a href="${ctx}/sams/order/order/form?id=${order.id}">
					${order.code}
				</a></td>

				<td>
					<fmt:formatDate value="${order.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
						${order.customer.name}
				</td>
				<td>
						${order.customer.phone}
				</td>
				<td>
						${order.total}
				</td>
				<td>
					<fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
						${order.createBy.name}
				</td>
				<shiro:hasPermission name="sams:order:order:edit"><td>
    				<a href="${ctx}/sams/order/form?id=${order.id}">修改</a>
					<a href="${ctx}/sams/order/delete?id=${order.id}" onclick="return confirmx('确认要删除该订单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>