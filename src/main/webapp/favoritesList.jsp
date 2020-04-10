<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的收藏</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript">
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>

    <script
            src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="//s3plus.meituan.net/v1/mss_e2821d7f0cfe4ac1bf9202ecf9590e67/cdn-prod/file:5788b470/common.0a548310.css" />
    <link rel="stylesheet"
          href="//s3plus.meituan.net/v1/mss_e2821d7f0cfe4ac1bf9202ecf9590e67/cdn-prod/file:5788b470/movie-detail.40d4116c.css" />
    <script crossorigin="anonymous"
            src="//s3plus.meituan.net/v1/mss_e2821d7f0cfe4ac1bf9202ecf9590e67/cdn-prod/file:5788b470/stat.88d57c80.js"></script>

    <!-- bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
    <!-- //bootstrap -->
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' media="all" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <!--start-smoth-scrolling-->
    <!-- fonts -->
    <link href='http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
    <!-- //fonts -->
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/video/indexQuery">
                <%-- 首页logo--%>
                <h1><img src="${pageContext.request.contextPath}/images/logo.png" alt="" /></h1></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <div class="top-search">
                <%--搜索表单--%>
                <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/video/seach">
                    <input type="text" name="vname" class="form-control" placeholder="Search...">
                    <input type="submit" value=" ">
                </form>
            </div>
            <c:if test="${empty sessionScope.user}">
                <div class="header-top-right">
                    <div class="signin">
                        <a href="${pageContext.request.contextPath}/register.jsp" class="play-icon popup-with-zoom-anim">注册</a>
                    </div>
                    <div class="signin">
                        <a href="${pageContext.request.contextPath}/login.jsp" class="play-icon popup-with-zoom-anim">登录</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.user}">
                <div class="header-top-right">
                    <div class="signin">
                        <a href="#" class="play-icon popup-with-zoom-anim">下载</a>
                    </div>
                    <div class="signin" style="margin-right: 20px">
                        <span>欢迎您，${sessionScope.user.uname}</span>
                    </div>
                    <div class="file">
                        <a href="${pageContext.request.contextPath}/user/logout" class="play-icon popup-with-zoom-anim">退出</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </c:if>

        </div>
        <div class="clearfix"> </div>
    </div>
</nav>
<div class="col-sm-3 col-md-2 sidebar">
    <div class="top-navigation">
        <%-- 菜单--%>
        <div class="t-menu">MENU</div>
        <div class="t-img">
            <img src="${pageContext.request.contextPath}/images/lines.png" alt="" />
        </div>
        <div class="clearfix"> </div>
    </div>
    <div class="drop-navigation drop-navigation">
        <ul class="nav nav-sidebar">
            <li>
                <a href="${pageContext.request.contextPath}/video/indexQuery" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>首页</a>
            </li>
            <c:if test="${not empty sessionScope.user}">
                <li id="person_list" class="active">
                    <a href="#" class="menu1 news-icon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>个人中心<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a>
                        <%-- <a href="#" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>个人中心<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a>--%>
                </li>
                <ul class="cl-effect-2" id="person_ul">
                    <li>
                        <a href="${pageContext.request.contextPath}/user/userget/${sessionScope.user.uid}">个人资料</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/modPassword.jsp">修改密码</a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/favorites/get/${sessionScope.user.uid}">我的视频</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/video/toadd">发布视频</a>
                    </li>
                    <li>
                        <a href="#">我的消息</a>
                    </li>
                </ul>
                <%--菜单栏个人资料栏点击事件--%>
                <script>
                    $("#person_list a.menu1").click(function() {
                        $("#person_ul.cl-effect-2").slideToggle(300, function() {
                        });
                    });
                </script>
            </c:if>
            <li id="video_list">
                <a href="#" class="menu1"><span class="glyphicon glyphicon-film" aria-hidden="true"></span>视频<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a>
            </li>
            <ul class="cl-effect-2" id="video_ul">
                <c:forEach items="${typelist}" var="t">
                    <li ${type==t.tid? "class='active'":""}>
                        <a href="${pageContext.request.contextPath}/video/queryByType/${t.tid}">${t.tname}</a>
                    </li>
                </c:forEach>
            </ul>
            <%-- 菜单栏视频栏点击事件--%>
            <script>
                $("#video_list a.menu1").click(function() {
                    $("#video_ul.cl-effect-2").slideToggle(300, function() {
                        // Animation complete.
                    });
                });
            </script>
            <!-- script-for-menu -->
            <script>
                $("li a.menu").click(function() {
                    $("ul.cl-effect-1").slideToggle(300, function() {
                        // Animation complete.
                    });
                });
            </script>
            <li>
                <a href="#" class="user-icon"><span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span>剧集</a>
            </li>
            <c:if test="${not empty sessionScope.user}">
                <li>
                    <a href="#" class="sub-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>记录</a>
                </li>
            </c:if>
        </ul>
        <!-- script-for-menu -->
        <script>
            $(".top-navigation").click(function() {
                $(".drop-navigation").slideToggle(300, function() {
                    // Animation complete.
                });
            });
        </script>
        <div class="side-bottom">
            <div class="side-bottom-icons">
                <ul class="nav2">
                    <li>
                        <a href="#" class="facebook"> </a>
                    </li>
                    <li>
                        <a href="#" class="facebook twitter"> </a>
                    </li>
                    <li>
                        <a href="#" class="facebook chrome"> </a>
                    </li>
                    <li>
                        <a href="#" class="facebook dribbble"> </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--菜单结束-->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <div class="show-top-grids">
        <c:forEach items="${list}" var="l">
            <div class="col-md-2 resent-grid recommended-grid show-video-grid">
                <div class="resent-grid-img recommended-grid-img">
                    <a href="${pageContext.request.contextPath}/video/frontGet/${l.video.vid}"><img height="200px" src="${pageContext.request.contextPath}/images/${l.video.pic}" alt="" /></a>
                    <div class="time small-time show-time">
                        <p>${l.video.duration}</p>
                    </div>
                    <div class="clck show-clock">
                        <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                    </div>
                </div>
                <div class="resent-grid-info recommended-grid-info">
                    <h5><a href="${pageContext.request.contextPath}/video/frontGet/${l.video.vid}" class="title">${l.video.vname}</a></h5>
                  <%--  <p class="author">
                        <a href="#" class="author">${l.video.author}</a>
                    </p>--%>
                    <p class="views"><a href="javascript:void(0);" onclick='del(${l.video.vid},${sessionScope.user.uid})' class="btn">取消收藏</a> </p>
                </div>
            </div>
        </c:forEach>
        <div class="clearfix"> </div>
    </div>

    <!-- footer -->
    <div class="footer">
        <div class="footer-grids">
            <div class="footer-top">
                <div class="footer-top-nav">
                    <ul>
                        <li>
                            <a href="#">About</a>
                        </li>
                        <li>
                            <a href="#">Press</a>
                        </li>
                        <li>
                            <a href="#">Copyright</a>
                        </li>
                        <li>
                            <a href="#">Creators</a>
                        </li>
                        <li>
                            <a href="#">Advertise</a>
                        </li>
                        <li>
                            <a href="#">Developers</a>
                        </li>
                    </ul>
                </div>
                <!--页脚菜单-->
                <div class="footer-bottom-nav">
                    <ul>
                        <li>
                            <a href="#">Terms</a>
                        </li>
                        <li>
                            <a href="#">Privacy</a>
                        </li>
                        <li>
                            <a href="#" class="play-icon popup-with-zoom-anim">Send feedback</a>
                        </li>
                        <li>
                            <a href="#">Policy & Safety </a>
                        </li>
                        <li>
                            <a href="#">Try something new!</a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <!-- //footer -->
</div>
<div class="clearfix"> </div>

<!-- 放在文档末尾，这样页面加载速度更快-->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script>
    function del(vid,uid) {
        $.ajax({
            url:'${pageContext.request.contextPath}/favorites/del',
            type:"POST",
            async:true,
            data:{
                "vid":vid,
                "uid":uid
            },
            dataType:"JSON",
            success:function(res){
                alert(res.msg);
                window.location.href='${pageContext.request.contextPath}/favorites/get/'+uid;
            },
        });
    }
</script>
</body>

</html>
