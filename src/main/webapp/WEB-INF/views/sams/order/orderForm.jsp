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
                                class="input-xlarge required" value="${fns:getUser().name}" readonly="true"/>
                    <form:hidden path="saler.id" value="${fns:getUser().id}"/>


                </td>
                <td class="tit">部门：</td>
                <td>

                    <form:input path="saler.office.name" htmlEscape="false" maxlength="64"
                                class="input-xlarge" value="${fns:getUser().office.name}" readonly="true"/>

                </td>
            </tr>
            <tr>
                <td class="tit">合同编号：</td>
                <td>
                    <form:input path="code" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
                </td>
                <td class="tit">合同日期：</td>
                <td>
                    <input id="orderDate" name="orderDate" type="text" readonly="readonly" maxlength="20"
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
                    <form:input path="total" htmlEscape="false" maxlength="500" class="input-xlarge"/>
                </td>

            </tr>
            <tr>
                <td class="tit">备注：</td>
                <td colspan="3">
                    <form:textarea path="remark" htmlEscape="false" maxlength="500" class="input-xlarge"/>
                </td>
            </tr>
            <tr>
                <td class="tit">销售主管意见：</td>
                <td colspan="3">
                        ${order.textA}
                </td>
            </tr>
            <tr>
                <td class="tit">财务主管意见：</td>
                <td colspan="3">
                        ${order.textB}
                </td>
            </tr>
            <tr>
                <td class="tit">领导意见:</td>
                <td colspan="3">
                        ${order.textC}
                </td>
            </tr>

        </table>
    </fieldset>
    <div class="form-actions">
        <shiro:hasPermission name="oa:testAudit:edit">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value="提交申请" onclick="$('#flag').val('yes')"/>&nbsp;
            <c:if test="${not empty order.id}">
                <input id="btnSubmit2" class="btn btn-inverse" type="submit" value="销毁申请"
                       onclick="$('#flag').val('no')"/>&nbsp;
            </c:if>
        </shiro:hasPermission>
        <%--<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>--%>
    </div>
    <c:if test="${not empty order.id}">
        <act:histoicFlow procInsId="${order.act.procInsId}"/>
    </c:if>
</form:form>
</body>
</html>