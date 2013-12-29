<%@page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>준홍's Blog</title>
    <link href="/css/bootstrap.css" rel="stylesheet">    
    <style>body { padding-top: 50px;}</style>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">준홍 Blog</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.jsp">Home</a></li>
            <li><a href="about.html">About</a></li>
          </ul>
		<ul class="nav navbar-nav navbar-right">
				
			<%
				String id = (String)session.getAttribute("loginid");
				if(id!=null){
			%>
					<li><a href="write.jsp">새 글 작성</a></li>
					<li><a href="process_logout.jsp"><%= id+"님" %>로그아웃</a></li>
			<%} else{ %>
            		<li><a href="register.jsp">회원가입</a></li>
            		<li><a href="login.jsp">로그인</a></li>
            <%} %>
          	</ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>