<%--
  Created by IntelliJ IDEA.
  User: bangae1
  Date: 2016-06-21
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <title>Spring Boot and Thymeleaf - Thymeleaf Layout Dialect</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Webflix - Streaming Media Theme - Homepage v1</title>
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png"/>

    <!--     Include UIKit CSS   -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/uikit.css"/>
    <!--     Theme CSS   -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css"/>
    <!--     Include Simplebar CSS   -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/simplebar.css"/>

    <style>
        .dropdown-menu>li>a {
            color:white;
        }

        .dropdown-menu {
            background-color:#191010;
        }

        #video-player {
            display:none;
            width:100%;
            height:100%;
            z-index:100;
        }

        .play-back {
            cursor: pointer;
            z-index: 300;
            padding-top: 20px;
            padding-left: 20px;
            position: absolute;
            color: white;
        }
    </style>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.js"></script>

    <script src="${pageContext.request.contextPath}/resources/js/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/uikit.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/components/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/components/grid.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/components/slideset.min.js"></script>
</head>
<body>
<tiles:insertAttribute name="header"/>
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>
</body>
</html>
