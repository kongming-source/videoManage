<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/my-login.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/my-login.js"></script>
</head>
<body  class="my-login-page">
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-md-center h-100">
            <div class="card-wrapper">
                <%--<div class="brand">
                    <img src="img/logo.jpg">
                </div>--%>
                <div class="card fat">
                    <div class="card-body">
                        <div style="margin-top: 20px;text-align: center">
                            <h4><c:out value="${msg}"/></h4>
                        </div>
                        <%--<h4 class="card-title">Login</h4>--%>
                        <form method="POST" action="${pageContext.request.contextPath}/user/login">

                            <div class="form-group">
                                <label for="uname">用户名</label>

                                <input id="uname" type="text" class="form-control" name="uname" value="" required autofocus>
                            </div>

                            <div class="form-group">
                                <label for="password">密码
                                    <%--<a href="forgot.html" class="float-right">
                                        Forgot Password?
                                    </a>--%>
                                </label>
                                <input id="password" type="password" class="form-control" name="password" required data-eye>
                            </div>

                            <div class="form-group">
                                <label>
                                    <input type="checkbox" name="remember"> 记住我
                                </label>
                            </div>

                            <div class="form-group no-margin">
                                <button type="submit" class="btn btn-primary btn-block">
                                    登录
                                </button>
                            </div>
                            <div class="margin-top20 text-center">
                                没有账号? <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
                            </div>
                        </form>
                    </div>
                </div>
               <%-- <div class="footer">
                    Copyright &copy; Your Company 2017 - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                </div>--%>
            </div>
        </div>
    </div>
</section>
</body>
</html>