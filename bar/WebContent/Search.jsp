<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList,entity.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>
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
  <li ><a href="main_show.jsp">主页面</a></li>
  <li class="active"><a href="Search.jsp">检索</a></li>
  <li  style="float:right;"><a id="username" href='#'>用户名</a></li>
  <li  style="float:right;"><a id="userid" href='#'>用户ID</a></li>
  <li style="float:right;"><a href="personal.jsp">个人中心</a></li>
  <li style="float:right;"><a href="main&login.jsp">返回登陆页面</a></li>
</ul>

<div style="width:80%;margin:0 auto;">

<form id="search" method="Post" action="search_tie" style="margin-top:20px;margin-bottom:20px;">
	<input type="text" name="search_input"/>
	<button type="submit">搜索</button>
</form>

<div id="search_result"></div>

</div>
<%
      User curr_user=(User)session.getAttribute("curr_user");
     %>
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
	
</script>


<%
	ArrayList<Tie> t=(ArrayList<Tie>)request.getAttribute("tmp_tie_arr");
	String res="";
	if(t==null){}
	else{
	if(t.size()==0){
		res="没有搜索到任何内容";
	}else{
		int i=0;
		while(i<t.size()){
		res+="<div id=\""+t.get(i).ID+"\" onclick=\"script:func1(this)\"><div class=\"panel panel-info\"><div class=\"panel-heading\"><h3 class=\"panel-title\">"+t.get(i).title+"</h3></div><div class=\"panel-body\">发帖人"+t.get(i).username+"&nbsp;&nbsp;&nbsp;"+t.get(i).create_time+"&nbsp;&nbsp;&nbsp;回复数量:"+t.get(i).reply_num+"</div></div></div>";
		i++;
		}
	}
	}
%>
<script>
	document.getElementById("username").innerHTML='<%=curr_user.username%>';
	document.getElementById("userid").innerHTML='<%=curr_user.ID%>';
</script>
<script>
document.getElementById("search_result").innerHTML='<%=res %>';
</script>
</body>
</html>