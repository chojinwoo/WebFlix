<%--
  Created by IntelliJ IDEA.
  User: bangae1
  Date: 2016-07-03
  Time: 오전 1:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />

    <title>WebFlix - Free Movie - Error</title>
    <meta name="googlebot" content="index, follow" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta property="og:site_name" content="RSQ"/>
    <meta property="og:image" content="http://rsq.com/img/rsq-opengraph.jpg"/>

    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta property="og:type" content="website"/>

    <link rel="apple-touch-icon" sizes="57x57" href="http://rsq.com/img/rsq-touch-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="http://rsq.com/img/rsq-touch-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="http://rsq.com/img/rsq-touch-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="http://rsq.com/img/rsq-touch-144.png">

    <link rel="stylesheet" type="text/css" href="//cloud.typography.com/7185652/633682/css/fonts.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom/error.css"/>
    <script src="http://puffdaddy.rsq.com/js/lib/modernizr.min.js"></script>
</head>
<body>

<div id="main">
    <div class="spinner">
        <img src="/img/spinner1.gif" alt="">
    </div>
    <div id="app">


        <div id="error_view" class="custom-scroller">
            <div id="error_column" class="vertical_center scrollable-content">
                <div class="centered">
                    <div id="casket"></div>
                    <h1>We’re deeply sorry for your loss.</h1>
                    <p>
                        The link you’re looking for is dead.
                        <br/>
                        Condolences can be found at the <a href="/">RSQ homepage</a>.
                    </p>

                </div>
            </div>
        </div>
    </div>
    <nav>
        <div class="row">
            <div class="small-3 columns" id="rsq_logo_cont">
                <a href="/" id="rsq_logo">RSQ</a>
            </div>

            <div id="main_site_nav_cont" class="large-7 small-9 columns large-offset-2">
                <div id="mobile_menu">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div class="right" id="main-site-nav">
                    <a href="/about" id="nav-about">About</a>
                    <a href="/work" id="nav-work">Work</a>
                    <a href="/join" id="nav-join">Join Us</a>
                    <a href="/contact" id="nav-contact">Contact</a>
                </div>
            </div>
        </div>
    </nav>
</div>


<script data-main="http://pdiddy.rsq.com/js/config" src="http://pdiddy.rsq.com/build/js/app.built.js"></script>






<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-43526302-1', 'rsq.com');
    ga('send', 'pageview');

</script>


</body>
</html>
