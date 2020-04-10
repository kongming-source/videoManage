<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>视频详情</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.formjson.js" type="text/javascript"></script>
</head>
<body>
<div style="margin-top: 30px;margin-left:30px;margin-right: 30px;margin-bottom: 50px;">
    <form id="modform" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/mod">
        <table class="table table-hover" width="100%">
            <caption class="center" style="text-align: center">视频详情</caption>
            <tr>
                <td><label class="col-sm-4 control-label">视频编号:</label></td>
                <td>
                    ${v.vid}
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">视频名称:</label></td>
                <td>
                    ${v.vname}
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">作者:</label></td>
                <td>
                    ${v.author}
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">上线时间:</label></td>
                <td>
                    ${v.online}
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">持续时长:</label></td>
                <td>
                    ${v.duration}
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">地区:</label></td>
                <td>
                    ${v.area}
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">状态:</label></td>
                <td>
                    <c:if test="${v.state ==1}">待审核</c:if>
                    <c:if test="${v.state ==2}">已审核</c:if>
                    <c:if test="${v.state ==3}">已封禁</c:if>
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">权限:</label></td>
                <td>
                    ${v.videoPower.videoPower_name}
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">类型:</label></td>
                <td>
                    <c:forEach items="${v.type}" var="t" varStatus="vs">
                        ${t.tname}
                        <c:if test="${!vs.last}">，</c:if>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td><label class="col-sm-4 control-label">封面图片:</label></td>
                <td>
                    <div >
                        <div style="float: left"><img src="${pageContext.request.contextPath}/images/${v.pic}" width="50px" height="50px"></div>
                        <%-- <div style="float: left;margin-left: 20px;align-items: center"><input type="file" name="pic" class="form-control"placeholder="封面图片"></div>--%>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right">
                    <a href="${pageContext.request.contextPath}/video/query"><input class="btn btn-primary" type="button" id="backbut" value="返回" style="margin-right: 20px"></a>
                    <a href="javascript:void(0);" onclick="pass(${v.vid})"><input class="btn btn-primary" type="button" id="modbut" value="审核通过" style="margin-right: 20px"></a>
                </td>
            </tr>
        </table>
    </form>
</div>
<script>

    function pass(vid) {
        $.ajax({
            url:'${pageContext.request.contextPath}/video/pass',
            type:"POST",
            async:true,
            data:{"vid":vid},
            dataType:"JSON",
            success:function(res){
                alert(res.msg);
                window.location.href='${pageContext.request.contextPath}/video/get/'+vid;
            },
        });
    }
</script>
</body>
</html>
