<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户列表</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.formjson.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div style="margin-left: 20px;margin-right: 20px">

    <div style="margin-top: 30px;float: left">
        <form action="${pageContext.request.contextPath}/admin/query" method="post" id="queryForm">
            <input type="text" value="${memoryName}" name="uname" id="queryText" placeholder="用户名"/>
            <input type="submit" value="查询">
            <input type="hidden" name="checkName" value="${memoryName}"/>
            <input type="hidden" name="pageNum" id="pageNum" value="${p.pageNum}" />
            <input type="hidden" name="pagSize" id="pageSize" value="${p.pageSize}"/>
        </form>
    </div>
    <div style="text-align: center;float: right">
        <button class="btn " data-toggle="modal" data-target="#addModal">添加用户</button>
    </div>
    <div>
        <table class="table table-striped"  width="100%" style="text-align: center">
            <div>
                <thead>
                <tr>
                    <td>编号</td>
                    <td>用户ID</td>
                    <td>用户名</td>
                    <td>性别</td>
                    <td>电话</td>
                    <td>邮箱</td>
                    <td>用户状态</td>
                    <%--<td>用户权限</td>
                    <td>开通时间</td>
                    <td>持续时长</td>
                    <td>权限状态</td>--%>
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
                        <td>${v.sex}</td>
                        <td>${v.phone}</td>
                        <td>${v.email}</td>
                        <td>
                            <c:if test="${v.state ==1}">正常</c:if>
                            <c:if test="${v.state ==2}">冻结</c:if>
                        </td>
                        <%--<td>${v.userPower.power.userPower_name}</td>
                        <td>${v.userPower.starttime}</td>
                        <td>${v.userPower.duration}</td>
                        <td>
                            <c:if test="${v.userPower.state==1}">可用</c:if>
                            <c:if test="${v.userPower.state!=1}">到期</c:if>
                        </td>--%>
                        <td>
                            <a class="btn" href="javascript:void(0);" onclick="get(${v.uid})">详情</a>
                            <c:if test="${v.state==1}">
                                <a class="btn" href="javascript:void(0);" onclick="forbidden(${v.uid})">禁用</a>
                            </c:if>
                            <c:if test="${v.state==2}">
                                <a class="btn" href="javascript:void(0);" onclick="unForbidden(${v.uid})">解禁</a>
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

        // 添加用户
        $("#addbut").click(function () {
            $("#addform").ajaxForm({
                dataType:"json",
                resetForm:true,
                success:function(res){
                    alert(res.msg);
                    $("#addModal").modal('hide')
                    window.location.href='${pageContext.request.contextPath}/admin/query';
                }
            });
            $("#addform").submit();

        });

        // 修改用户信息
        $("#modbut").click(function () {
            $("#modModal").modal('hide');
        });
    });

   /* 分页点击事件*/
    function getPage(pageNum){
        $("#pageNum").val(pageNum);
        $("#queryForm").submit();
    }

    //禁用用户
    function forbidden(uid){
        if(!confirm("你确定禁用该用户？"))
            return;
        $.ajax({
            url:'${pageContext.request.contextPath}/admin/forbidden',
            type:"POST",
            async:true,
            data:{"uid":uid},
            dataType:"JSON",
            success:function(res){
                alert(res.msg);
                window.location.href='${pageContext.request.contextPath}/admin/query';
            },
        });
    }

    //解除禁用
    function unForbidden(uid){
        if(!confirm("你确定解禁该用户？"))
            return;
        $.ajax({
            url:'${pageContext.request.contextPath}/admin/unForbidden',
            type:"POST",
            async:true,
            data:{"uid":uid},
            dataType:"JSON",
            success:function(res){
                alert(res.msg);
                window.location.href='${pageContext.request.contextPath}/admin/query';
            },
        });
    }

    // 用户详情
    function get(uid){
        $.ajax({
            url:'${pageContext.request.contextPath}/admin/get',
            type:"GET",
            async:true,
            data:{
                "uid":uid
            },
            dataType:"JSON",
            success:function(res){
                $("#uid_mod").val(res.uid);
                $("#uname_mod").val(res.uname);
                $("#phone_mod").val(res.phone);
                $("#email_mod").val(res.email);
                $("#state_mod").val(res.state==1?"正常":"冻结");
                $("#userPower_mod").val(res.userPower.power.userPower_name);
                $("#startTime_mod").val(res.userPower.startTime);
                $("#powerState_mod").val(res.userPower.upstate==1?"可用":"到期");
                $("#duration_mod").val(res.userPower.duration);
                $("#modModal").modal("show");
            },
        });
    }

</script>

<!--新加模态框开始-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="addModalLabel">
                    添加用户
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" id="addform" method="post" action="${pageContext.request.contextPath}/admin/add">
                    <div class="form-group">
                        <label for="uname" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="uname" class="form-control" id="uname" placeholder="用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="password" placeholder="密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="number" name="phone" class="form-control" id="phone" placeholder="电话">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email" placeholder="邮箱">
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="addbut">
                    添加
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!--修改模态框开始-->
<div class="modal fade" id="modModal" tabindex="-1" role="dialog" aria-labelledby="modModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="modModalLabel">
                    用户详情
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" id="modform" action="" method="post">
                    <div class="form-group">
                        <label for="uid_mod" class="col-sm-2 control-label">用户ID</label>
                        <div class="col-sm-10">
                            <input type="text" readonly name="uid" class="form-control" id="uid_mod" placeholder="用户ID">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="uname_mod" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" readonly name="uname" class="form-control" id="uname_mod" placeholder="用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone_mod" class="col-sm-2 control-label">电话</label>
                        <div class="col-sm-10">
                            <input type="number" readonly name="phone" class="form-control" id="phone_mod" placeholder="电话">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_mod" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" readonly name="email" class="form-control" id="email_mod" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="state_mod" class="col-sm-2 control-label">用户状态</label>
                        <div class="col-sm-10">
                            <input type="text" readonly name="state" class="form-control" id="state_mod" placeholder="用户状态">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userPower_mod" class="col-sm-2 control-label">用户权限</label>
                        <div class="col-sm-10">
                            <input type="text"  readonly name="userpower" class="form-control" id="userPower_mod" placeholder="用户权限">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="startTime_mod" class="col-sm-2 control-label">开通时间</label>
                        <div class="col-sm-10">
                            <input type="text" readonly name="starttime" class="form-control" id="startTime_mod" placeholder="开通时间">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="duration_mod" class="col-sm-2 control-label">持续时长</label>
                        <div class="col-sm-10">
                            <input type="text" readonly name="duration" class="form-control" id="duration_mod" placeholder="持续时长">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="powerState_mod" class="col-sm-2 control-label">权限状态</label>
                        <div class="col-sm-10">
                            <input type="text" readonly name="powerstate" class="form-control" id="powerState_mod" placeholder="权限状态">
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="modbut">
                    确定
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
