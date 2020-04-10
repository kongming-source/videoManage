<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户详情</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.formjson.js" type="text/javascript"></script>
</head>
<body>
<div style="margin-top: 30px;margin-left:30px;margin-right: 30px">
    <form id="modform" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/mod">
        <table class="table table-hover" width="100%">
            <caption class="center" style="text-align: center">用户详情</caption>
            <tr>
                <td><label class="col-sm-4 control-label">用户ID:</label></td>
                <td>
                    <input class="form-control" readonly name="uid" value="${u.uid}">
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">用户名:</label></td>
                <td>
                    <input class="form-control"  name="uname" value="${u.uname}">
                    <input class="form-control" type="hidden" readonly name="password" value="${u.password}">
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">性别:</label></td>
                <td>
                    <input type="radio" name="sex" value="男" ${u.sex=="男"?"checked":""}>男
                    <input type="radio" name="sex" value="女" ${u.sex=="女"?"checked":""}>女
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">电话:</label></td>
                <td>
                    <input class="form-control" type="number" name="phone" value="${u.phone}">
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">邮箱:</label></td>
                <td>
                    <input class="form-control" type="email" name="email" value="${u.email}">
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">用户权限:</label></td>
                <td>
                    ${u.userPower.power.userPower_name}
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">权限状态:</label></td>
                <td>
                    <c:if test="${u.userPower.upstate==1}">可用</c:if>
                    <c:if test="${u.userPower.upstate==2}">到期</c:if>
                </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: right">
                    <a href="${pageContext.request.contextPath}/video/indexQuery"><input class="btn btn-primary" type="button" value="返回" style="margin-right: 20px"></a>
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
                    window.location.href='${pageContext.request.contextPath}/user/userget/${sessionScope.user.uid}'
                }
            });
            $("#modform").submit();

        });
    });
</script>
</body>
</html>
