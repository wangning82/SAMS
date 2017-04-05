<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>订单管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/sams/order/">订单列表</a></li>
    <li class="active"><a
            href="${ctx}/act/task/form?procDefId=order:2:7b4a43c042354c2b9cd949a909182b2e">订单<shiro:hasPermission
            name="sams:order:order:edit">${not empty order.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="sams:order:order:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="order" action="${ctx}/sams/order/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <form:hidden path="act.taskId"/>
    <form:hidden path="act.taskName"/>
    <form:hidden path="act.taskDefKey"/>
    <form:hidden path="act.procInsId"/>
    <form:hidden path="act.procDefId"/>

    <form:hidden id="flag" path="act.flag"/>
    <sys:message content="${message}"/>
    <fieldset>
        <legend>审批申请</legend>
        <table class="table-form">
            <tr>

                <td class="tit">销售：</td>
                <td>
                    <form:input path="saler.name" htmlEscape="false" maxlength="64"
                                class="input-xlarge required"  readonly="true"/>
                    <form:hidden path="saler.id"/>
                </td>
                <td class="tit">部门：</td>
                <td>
                    <form:input path="saler.office.name" htmlEscape="false" maxlength="64"
                                class="input-xlarge"  readonly="true"/>
                </td>
            </tr>
            <tr>
                <td class="tit">合同编号：</td>
                <td>
                    <form:input path="code" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
                </td>
                <td class="tit">合同日期：</td>
                <td>
                    <input id="orderDate" name="createDate" type="text" readonly="readonly" maxlength="20"
                           class="input-xlarge Wdate"
                           value="<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
                </td>
            </tr>

            <tr>
                <td class="tit">客户</td>
                <td>
                    <form:input path="customer.name" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
                </td>
                <td class="tit">手机号：</td>
                <td>
                    <form:input path="customer.phone" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
                </td>

            </tr>

            <tr>
                <td class="tit">总金额：</td>
                <td colspan="3">
                    <form:input path="remark" htmlEscape="false" maxlength="500" class="input-xlarge"/>
                </td>

            </tr>
            <tr>
                <td class="tit">销售主管意见：</td>
                <td colspan="3">
                        ${textA}
                </td>
            </tr>
            <tr>
                <td class="tit">财务主管意见：</td>
                <td colspan="3">
                        ${textB}
                </td>
            </tr>
            <tr>
                <td class="tit">领导意见:</td>
                <td colspan="3">
                        ${textC}
                </td>
            </tr>
            <tr>
                <td class="tit">您的意见</td>
                <td colspan="5">
                    <form:textarea path="act.comment" class="required" rows="5" maxlength="20" cssStyle="width:500px"/>
                </td>
            </tr>

        </table>
    </fieldset>
    <div class="form-actions">
        <shiro:hasPermission name="oa:order:edit">
            <c:if test="${order.act.taskDefKey eq 'apply_end'}">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="兑 现" onclick="$('#flag').val('yes')"/>&nbsp;
            </c:if>
            <c:if test="${order.act.taskDefKey ne 'apply_end'}">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="同 意" onclick="$('#flag').val('yes')"/>&nbsp;
                <input id="btnSubmit" class="btn btn-inverse" type="submit" value="驳 回" onclick="$('#flag').val('no')"/>&nbsp;
            </c:if>
        </shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
    <act:histoicFlow procInsId="${order.act.procInsId}"/>
</form:form>
</body>
</html>