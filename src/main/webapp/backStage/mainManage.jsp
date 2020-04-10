<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<base href="${pageContext.request.contextPath}/">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyPlay后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <!-- 导入css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/common/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/adminstyle.css" media="all">
    <!-- 加载js文件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/common/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/larry.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/style/js/index.js"></script>

</head>
<body>
<c:if test="${empty sessionScope.admin}">
    <div style="text-align: center;margin-top: 30px">
        <h2 style="color:#663399">登录后查看</h2>
        <a href="${pageContext.request.contextPath}/backStage/login.jsp">
            <i class="iconfont icon-exit"></i>
            前往登录</a>

    </div>
</c:if>
<c:if test="${not empty sessionScope.admin}">
    <div class="layui-layout layui-layout-admin" id="layui_layout">
        <!-- 顶部区域 -->
        <div class="layui-header header header-demo">
            <div class="layui-main">
                <!-- logo区域 -->
                <div class="admin-logo-box">
                    <a class="logo" href="http://www.kuxuebao.net" title="logo">MyPlay 后台</a>
                    <div class="larry-side-menu">
                        <i class="fa fa-bars" aria-hidden="true"></i>
                    </div>
                </div>
                <!-- 右侧导航 -->
                <ul class="layui-nav larry-header-item">
                    <li class="layui-nav-item">
                        账户名：${sessionScope.admin.uname}
                    </li>
                    <li class="layui-nav-item">
                        <a href="${pageContext.request.contextPath}/admin/logout">
                            <i class="iconfont icon-exit"></i>
                            退出</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧侧边导航开始 -->
        <div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
            <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">

                <!-- 左侧菜单 -->
                <ul class="layui-nav layui-nav-tree">
                    <li class="layui-nav-item layui-this">
                        <a href="javascript:;" data-url="main.html">
                            <i class="iconfont icon-home1" data-icon='icon-home1'></i>
                            <span>后台首页</span>
                        </a>
                    </li>
                    <!-- 个人信息 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-jiaoseguanli" ></i>
                            <span>我的面板</span>
                            <em class="layui-nav-more"></em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:toPerson();" data-url="">
                                    <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                                    <span>个人信息</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:toModPassword();" data-url="">
                                    <i class="iconfont icon-geren1" data-icon='icon-geren1'></i>
                                    <span>修改密码</span>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <!-- 用户管理 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-jiaoseguanli2" ></i>
                            <span>用户管理</span>
                            <em class="layui-nav-more"></em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:toUserManage()" data-url="table.html">
                                    <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
                                    <span>用户列表</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:toUserPowerManage();" data-url="table.html">
                                    <i class="iconfont icon-m-members" data-icon='icon-m-members'></i>
                                    <span>用户权限</span>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <!-- 视频管理 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-m-members" ></i>
                            <span>视频管理</span>
                            <em class="layui-nav-more"></em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:toVideoManage();">
                                    <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
                                    <span>视频列表</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:unCheck();">
                                    <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
                                    <span>待审核视频</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:isForbidden();">
                                    <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
                                    <span>已封禁视频</span>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <!-- 系统设置 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-xitong" ></i>
                            <span>系统设置</span>
                            <em class="layui-nav-more"></em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd>
                                <a href="javascript:;">
                                    <i class="iconfont icon-zhandianpeizhi" data-icon='icon-zhandianpeizhi'></i>
                                    <span>基本参数设置</span>
                                </a>
                            </dd>
                            <dd>
                                <a href="javascript:;">
                                    <i class="iconfont icon-anquanshezhi" data-icon='icon-anquanshezhi'></i>
                                    <span>安全设置</span>
                                </a>
                            </dd>
                        </dl>
                    </li>
                    <!-- 友链设置 -->
                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="iconfont icon-youqinglianjie"  data-icon='icon-youqinglianjie'></i>
                            <span>友情链接</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 左侧侧边导航结束 -->
        <!-- 右侧主体内容 -->
        <div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
            <div style="height: 100%;" class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
                <div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
                <ul class="layui-tab-title">
                    <li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em> </em></li>
                </ul>
                <div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div>
                <ul class="layui-nav closeBox">
                    <li class="layui-nav-item">
                        <a href="javascript:;"><i class="iconfont icon-caozuo"></i> 页面操作</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
                            <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>
                            <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>
                        </dl>
                    </li>
                </ul>
                <div class="layui-tab-content" style="height: 100%; ">
                    <div class="layui-tab-item layui-show" style="height: 100%;">
                        <iframe class="larry-iframe" data-id='0' src="${pageContext.request.contextPath}/backStage/main.jsp"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        //个人信息
        function toPerson() {
            var str = "<iframe class=\"larry-iframe\" data-id='0' src=\"${pageContext.request.contextPath}/user/get/${sessionScope.admin.uid}\"></iframe>";
            $(".layui-tab-item").html(str);
        }
        //修改密码
        function toModPassword() {
            var str = "<iframe class=\"larry-iframe\" data-id='0' src=\"${pageContext.request.contextPath}/backStage/modPassword.jsp\"></iframe>";
            $(".layui-tab-item").html(str);
        }

        //用户管理
        function toUserManage() {
            var str = "<iframe class=\"larry-iframe\" data-id='0' src=\"${pageContext.request.contextPath}/admin/query\"></iframe>";
            $(".layui-tab-item").html(str);
        }
        //用户权限
        function toUserPowerManage() {
            var str = "<iframe class=\"larry-iframe\" data-id='0' src=\"${pageContext.request.contextPath}/admin/queryPower\"></iframe>";
            $(".layui-tab-item").html(str);
        }
        //视频列表
        function toVideoManage() {
            var str = "<iframe class=\"larry-iframe\" data-id='0' src=\"${pageContext.request.contextPath}/video/query\"></iframe>";
            $(".layui-tab-item").html(str);
        }
        //待审核视频
        function unCheck() {
            var str = "<iframe class=\"larry-iframe\" data-id='0' src=\"${pageContext.request.contextPath}/video/query?state=1\"></iframe>";
            $(".layui-tab-item").html(str);
        }
        //已封禁视频
        function isForbidden() {
            var str = "<iframe class=\"larry-iframe\" data-id='0' src=\"${pageContext.request.contextPath}/video/query?state=3\"></iframe>";
            $(".layui-tab-item").html(str);
        }

    </script>

</c:if>
</body>
</html>
