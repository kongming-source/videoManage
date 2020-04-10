<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户权限详情</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.formjson.js" type="text/javascript"></script>

    <style>
        tr{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div style="margin-top: 30px;margin-left:30px;margin-right: 30px">
    <form id="modform" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/admin/powerMod">
        <table class="table table-hover" width="100%">
            <caption class="center" style="text-align: center">用户权限详情</caption>
            <tr>
                <td><label class="col-sm-4 control-label">用户ID:</label></td>
                <td>
                    <input class="form-control" readonly name="uid" value="${v.uid}">
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">用户名:</label></td>
                <td>${v.uname}</td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">用户状态:</label></td>
                <td>
                    <c:if test="${v.state ==1}">正常</c:if>
                    <c:if test="${v.state ==2}">冻结</c:if>
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">用户权限:</label></td>
                <td>
                    <input type="hidden" name="old" value="${v.userPower.upid}">
                    <select name="upid">
                        <c:forEach items="${powerlist}" var="va">
                            <option value="${va.userPower_id}" ${v.userPower.upid==va.userPower_id ? "selected" :""}>${va.userPower_name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">开通时间:</label></td>
                <td>
                    <input class="form-control" name="startTime" value="${v.userPower.startTime}">
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">持续时长:</label></td>
                <td>
                    <input class="form-control" name="duration" value="${v.userPower.duration}">
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">权限状态:</label></td>
                <td>
                    <input type="radio" name="upstate" value="1" ${v.userPower.upstate==1?"checked":""}>可用
                    <input type="radio" name="upstate" value="2" ${v.userPower.upstate==2?"checked":""}>到期
                    <%--<c:if test="${v.userPower.upstate==1}">可用</c:if>
                    <c:if test="${v.userPower.upstate==2}">到期</c:if>--%>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right">
                    <a href="${pageContext.request.contextPath}/admin/queryPower"><input class="btn btn-primary" type="button" value="返回"></a>
                    <input class="btn btn-primary" type="button" id="modbut" value="修改" style="margin-right: 20px">
                </td>
            </tr>
        </table>
    </form>
</div>

<script>

    $(document).ready(function(){
        // 修改用户权限
        $("#modbut").click(function () {
            $("#modform").ajaxForm({
                dataType:"json",
                resetForm:true,
                success:function(res){
                    alert(res.msg);
                    window.location.href='${pageContext.request.contextPath}/admin/queryPower';
                }
            });
            $("#modform").submit();

        });
    });
</script>

</body>
</html>
