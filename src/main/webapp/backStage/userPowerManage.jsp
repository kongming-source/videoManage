<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户权限</title>
    <base href="${pageContext.request.contextPath}">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.formjson.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div style="margin-left: 20px;margin-right: 20px">

    <div style="margin-top: 30px;float: left">
        <form action="${pageContext.request.contextPath}/admin/queryPower" method="post" id="queryForm">
            <input type="text" value="${memoryName}" name="uname" id="queryText" placeholder="用户名"/>
            <input type="submit" value="查询">
            <input type="hidden" name="checkName" value="${memoryName}"/>
            <input type="hidden" name="pageNum" id="pageNum" value="${p.pageNum}" />
            <input type="hidden" name="pagSize" id="pageSize" value="${p.pageSize}"/>
        </form>
    </div>
    <div>
        <table class="table table-striped"  width="100%" style="text-align: center">
            <div>
                <thead>
                <tr>
                    <td>编号</td>
                    <td>用户ID</td>
                    <td>用户名</td>
                    <td>用户状态</td>
                    <td>用户权限</td>
                    <td>开通时间</td>
                    <td>持续时长</td>
                    <td>权限状态</td>
                    <td>操作</td>
                </tr>
                </thead>
            </div>
            <div>
                <tbody>
                <c:if test="${p.total == 0}">
                    <h3>神马都没有找到哦</h3>
                </c:if>
                <c:forEach items="${p.list}" var="v" varStatus="vs">
                    <tr>
                        <td>${vs.index+1}</td>
                        <td>${v.uid}</td>
                        <td>${v.uname}</td>
                        <td>
                            <c:if test="${v.state ==1}">正常</c:if>
                            <c:if test="${v.state ==2}">冻结</c:if>
                        </td>
                        <td>${v.userPower.power.userPower_name}</td>
                        <td>${v.userPower.startTime}</td>
                        <td>${v.userPower.duration}</td>
                        <td>
                            <c:if test="${v.userPower.upstate==1}">可用</c:if>
                            <c:if test="${v.userPower.upstate==2}">到期</c:if>
                        </td>
                        <td>
                            <a class="btn" href="${pageContext.request.contextPath}/admin/powerGet/${v.uid}">详情</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </div>
        </table>
    </div>
    <div style="text-align: center">
        共${p.total}条记录&nbsp&nbsp共${p.pages}页&nbsp&nbsp当前第${p.pageNum}页
    </div>
    <div style="text-align: center">
        <c:if test="${p.total!=0}">
            <ul class="pagination" id="page">
                <li ${p.pageNum==1 ? 'class="disabled"' :''}><a href="javascript:void(0);" onclick="getPage(1)">&laquo;</a></li>
                <c:forEach items="${p.navigatepageNums}" var="num">
                    <li ${num==p.pageNum ? 'class="active"' :''}><a href="javascript:void(0);" onclick="getPage(${num})">${num}</a></li>
                </c:forEach>
                <li ${p.pageNum==p.pages ? 'class="disabled"' :''}><a href="javascript:void(0);" onclick="getPage(${p.pages})">&raquo;</a></li>
            </ul>
        </c:if>
    </div>
</div>
<script>
    $(document).ready(function(){

        /*搜索栏的失焦事件*/
        $("#queryText").blur(function () {
            $("#queryForm").submit();
        });

    });

    /* 分页点击事件*/
    function getPage(pageNum){
        $("#pageNum").val(pageNum);
        $("#queryForm").submit();
    }

</script>

</body>
</html>
