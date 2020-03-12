<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="bar_work.*,java.sql.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main_show</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery.js">
</script>
 <!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js">
</script>

</head>
<body>

<div class="page-header">
<h1>网络论坛系统</h1>
 </div>
<ul class="nav nav-pills" >
  <li class="active"><a href="#">主页面</a></li>
  <li  style="float:right;"><a href='#'>游客模式</a></li>
  <li style="float:right;"><a href="main&login.jsp">返回登陆页面</a></li>
</ul>

<div class="list-group" id="ties"><!-- 在这里插入了那些语句 --></div>	
<%
	String sql="select * from tie order by ID desc";
	ResultSet rs=db.executeQuery(sql);
	String res="";
	int i=0;
	while(rs.next()){
		//res+="<a id=\""+(rs.getInt(1))+"\"  class=\"list-group-item active\" onclick=\"script:func1(this)\"><h4 class=\"list-group-item-heading\">"+rs.getString(5)+"</h4></a><a href=\"#\" class=\"list-group-item\"><p class=\"list-group-item-text\">发帖人"+rs.getString(2)+"&nbsp;&nbsp;&nbsp;"+rs.getDate(4)+"</p></a>";
	res+="<div id=\""+(rs.getInt(1))+"\" onclick=\"script:func1(this)\"><div class=\"panel panel-info\"><div class=\"panel-heading\"><h3 class=\"panel-title\">"+rs.getString(5)+"</h3></div><div class=\"panel-body\">发帖人"+rs.getString(2)+"&nbsp;&nbsp;&nbsp;"+rs.getDate(4)+"</div></div></div>";
	}
%>


<script>
document.getElementById("ties").innerHTML='<%=res %>';
</script>
</body>
</html>