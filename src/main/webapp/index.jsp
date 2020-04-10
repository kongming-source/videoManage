<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>跳转中</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
</head>
<body>
<script>

    $(document).ready(function(){
        window.location.href='${pageContext.request.contextPath}/video/indexQuery';
    });
</script>
</body>
</html>
