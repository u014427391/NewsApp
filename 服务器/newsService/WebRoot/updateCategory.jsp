<%@page import="com.newsService.po.Category"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/index.js"></script>
    <script src="js/respond.js"></script>
    <script src="js/admin.js"></script>
    <link type="image/x-icon" href="/favicon.ico" rel="shortcut icon" />
    <link href="/favicon.ico" rel="bookmark icon" />
</head>

<body>
<%
	Category c = (Category)session.getAttribute("categoryInfo");
 %>
<div class="lefter">
    <div class="logo"><a href="#" target="_blank"><img src="images/logo.png" alt="后台管理系统" /></a></div>
</div>
<div class="righter nav-navicon" id="admin-nav">
    <div class="mainer">
        <div class="admin-navbar">
            <span class="float-right">
            	<a class="button button-little bg-main" href="#">前台首页</a>
                <a class="button button-little bg-yellow" href="login.jsp">注销登录</a>
            </span>
            <ul class="nav nav-inline admin-nav">
                <li><a href="index.jsp" class="icon-home"> 开始</a>
                </li>
                <li><a href="systemManager.jsp" class="icon-cog"> 系统</a>
                </li>
                <li><a href="<%=basePath %>servlet/GetCategorysByIdServlet"class="icon-file-text"> 修改信息</a>
                </li>
                <li><a href="#" class="icon-file"> 文件</a></li>
                <li><a href="#" class="icon-th-list"> 栏目</a></li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，admin，欢迎您的光临。</span>
        </div>
    </div>
</div>

<div class="admin">
	<form action="<%=basePath %>servlet/UpdateCategoryServlet" method="post" >
    <div class="panel admin-panel">
    	<div class="panel-head"><strong>修改信息</strong></div>
        <table class="table table-hover">
        	<tr><th width="120">ID编号</th><td><%=c.getCid() %><input type="hidden" name="cid" value="<%=c.getCid() %>"/></td></tr>
        	<tr><th width="120">频道</th><td><input type="text" name="title" value=<%=c.getTitle() %> /></td></tr>
        	<tr><th width="120">新闻数量</th><td><%=c.getSequnce() %></td></tr>
        	<tr><th width="100">操作</th>
        		<td>
            		<button type="submit" class="button border-blue button-little" onclick="{if(confirm('修改成功')){return true;}return false;}">修改</button> 
            		<a class="button border-green button-little" href="<%=basePath %>servlet/GetNewsCategoryServlet">返回</a> 
            	</td>
            </tr>
        </table>
        <!--  
        <div class="panel-foot text-center">
            <ul class="pagination"><li><a href="#">上一页</a></li></ul>
            <ul class="pagination pagination-group">
                <li><a href="#">1</a></li>
                <li class="active"><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
            </ul>
            <ul class="pagination"><li><a href="#">下一页</a></li></ul>
        </div>
        -->
    </div>
    </form>
    <br />
</div>

</body>
</html>