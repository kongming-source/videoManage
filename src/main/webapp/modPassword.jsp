<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.formjson.js" type="text/javascript"></script>
</head>
<body>
<div style="margin-top: 30px;margin-left:30px;margin-right: 30px">
    <form id="modform" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/modPassword">
        <table class="table table-hover" width="100%">
            <caption class="center" style="text-align: center">修改密码</caption>
            <tr>
                <td><label class="col-sm-4 control-label">原密码:</label></td>
                <td>
                    <input type="hidden" name="uid" value="${sessionScope.user.uid}">
                    <input type="password" class="form-control" name="password">
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">新密码:</label></td>
                <td>
                    <input class="form-control" type="password" name="newpassword" id="newpassword">
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">确认密码:</label></td>
                <td>
                    <input class="form-control" type="password" name="repassword" id="repassword">
                </td>
            </tr>
            <tr>
                <td colspan="4" >
                    <span id="tip" style="color: red"></span>
                </td>
            </tr>

            <tr>
                <td colspan="4" style="text-align: right">
                    <input class="btn btn-primary" type="button" id="modbut" value="修改" style="margin-right: 20px">
                </td>
            </tr>
        </table>
    </form>
</div>
<script>

    $(document).ready(function(){
        // 修改密码
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
        $("#repassword").blur(function () {
            var newpassword = $("#newpassword").val();
            var repassword = $("#repassword").val();
            if(newpassword!=repassword){
                $("#modbut").attr("disabled",true);
                $("#tip").text("前后密码不一致！");
            }else {
                $("#modbut").removeAttr("disabled");
                $("#tip").text("");
            }
        })

    });

</script>
</body>
</html>
