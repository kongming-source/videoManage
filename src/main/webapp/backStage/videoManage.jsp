<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>视频列表</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <%--<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.formjson.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

<div style="margin-left: 20px;margin-right: 20px">

    <div style="margin-top: 30px;float: left">
        <form action="${pageContext.request.contextPath}/video/query" method="post" id="queryForm">
            <input type="text" value="${memoryName}" name="vname" id="queryText" placeholder="视频名"/>
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
                    <td>序号</td>
                    <td>视频编号</td>
                    <td>视频名称</td>
                    <td>图片</td>
                    <td>上线日期</td>
                    <td>作者</td>
                    <td>状态</td>
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
                        <td>${v.vid}</td>
                        <td>${v.vname}</td>
                        <td><img width="50px" height="50px" src="${pageContext.request.contextPath}/images/${v.pic}?did=+new Date().getTime()"/></td>
                        <td>${v.online}</td>
                        <td>${v.author}</td>
                        <td>
                            <c:if test="${v.state ==1}">待审核</c:if>
                            <c:if test="${v.state ==2}">已审核</c:if>
                            <c:if test="${v.state ==3}">已封禁</c:if>
                        </td>
                        <td>
                            <a class="btn" href="${pageContext.request.contextPath}/video/get/${v.vid}">详情</a>
                            <c:if test="${v.state==1}">
                                <a class="btn" href="${pageContext.request.contextPath}/video/get/${v.vid}">审核</a>
                            </c:if>
                            <c:if test="${v.state==2}">
                                <a class="btn" href="javascript:void(0);" onclick="forbidden(${v.vid})">封禁</a>
                            </c:if>
                            <c:if test="${v.state==3}">
                                <a class="btn" href="javascript:void(0);" onclick="unForbidden(${v.vid})">解禁</a>
                            </c:if>
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

    //封禁视频
    function forbidden(vid){
        if(!confirm("你确定封禁该视频？"))
            return;
        $.ajax({
            url:'${pageContext.request.contextPath}/video/forbidden',
            type:"POST",
            async:true,
            data:{"vid":vid},
            dataType:"JSON",
            success:function(res){
                alert(res.msg);
                window.location.href='${pageContext.request.contextPath}/video/query';
            },
        });
    }

    //解除禁用
    function unForbidden(vid){
        if(!confirm("你确定解除此视频的封禁？"))
            return;
        $.ajax({
            url:'${pageContext.request.contextPath}/video/unForbidden',
            type:"POST",
            async:true,
            data:{"vid":vid},
            dataType:"JSON",
            success:function(res){
                alert(res.msg);
                window.location.href='${pageContext.request.contextPath}/video/query';
            },
        });
    }

</script>
</div>
</body>
</html>
