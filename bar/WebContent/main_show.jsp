<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
        import="bar_work.db,java.sql.*,entity.*"
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
  <li class="active"><a href="main_show.jsp">主页面</a></li>
  <li ><a href="Search.jsp" >检索</a></li>
  <li  style="float:right;"><a id="username" href='#'>用户名</a></li>
  <li  style="float:right;"><a id="userid" href='#'>用户ID</a></li>
  <li style="float:right;"><a href="personal.jsp" >个人中心</a></li>
  <li style="float:right;"><a href="main&login.jsp">返回登陆页面</a></li>
</ul>


<div class="art" >
	<div class="inner" style="width:80%;;margin:0 auto;">
		<div class="list-group" id="ties"><!-- 在这里插入了那些语句 -->
		</div>	
		<footer class="bottom" style="margin:0 auto;">
		发布新帖：<br/>
		<form role="form" action="newtie" method="Post">
			<div class="form-group">
    			<label for="name">标题:</label>
    			<input name="newtie_title" type="text" class="form-control" placeholder="请输入帖标题">
 			</div>	

  			<div class="form-group">
    			<label for="name">内容:</label>
    			<textarea name="newtie_content" class="form-control" rows="8" placeholder="请输入帖子内容" id="test2"></textarea>
  			</div>
  			<button type="submit" class="btn btn-default" onclick="script:test()">发布帖子</button>
		</form>
		</footer>
	</div>
</div>





<%
	User curr_user=(User)session.getAttribute("curr_user");

	String sql="select * from tie order by ID desc";
	ResultSet rs=db.executeQuery(sql);
	String res="";
	int i=0;
	while(rs.next()){
		//res+="<a id=\""+(rs.getInt(1))+"\"  class=\"list-group-item active\" onclick=\"script:func1(this)\"><h4 class=\"list-group-item-heading\">"+rs.getString(5)+"</h4></a><a href=\"#\" class=\"list-group-item\"><p class=\"list-group-item-text\">发帖人"+rs.getString(2)+"&nbsp;&nbsp;&nbsp;"+rs.getDate(4)+"</p></a>";
	res+="<div id=\""+(rs.getInt(1))+"\" onclick=\"script:func1(this)\"><div class=\"panel panel-info\"><div class=\"panel-heading\"><h3 class=\"panel-title\">"+rs.getString(5)+"</h3></div><div class=\"panel-body\">发帖人"+rs.getString(2)+"&nbsp;&nbsp;&nbsp;"+rs.getDate(4)+"&nbsp;&nbsp;&nbsp;回复数量:"+rs.getInt(3)+"</div></div></div>";
	}
	

%>


<script>
	document.getElementById("username").innerHTML='<%=curr_user.username%>';
	document.getElementById("userid").innerHTML='<%=curr_user.ID%>';
</script>

<script>
	var clickNum=0;
	function func1(obj){		
			clickNum = obj.id;
			var temp = document.createElement("form");
			temp.action = "enter_tie";
			temp.method = "post";
			temp.style.display = "none";
			var opt = document.createElement("textarea");
			opt.name = "tie_id";
			opt.value = ""+clickNum;
			temp.appendChild(opt);
			document.body.appendChild(temp);
			temp.submit();	
	}
	document.getElementById("ties").innerHTML='<%=res %>';
</script>

</body>
</html>