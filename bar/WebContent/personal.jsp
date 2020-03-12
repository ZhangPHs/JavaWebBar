<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="entity.*,java.sql.*,bar_work.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
td{
width:400px;
}
</style>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
      <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
      <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
      <!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->
      <title>主界面</title>
   </head>
   
   
<body >
   

   
   <div class="page-header">
    <h1>网络论坛系统</h1></div>
  
      <ul class="nav nav-tabs">
      <li><a href="main_show.jsp">主页面</a></li>
       <li  style="float:right"><a id="user_name" href="#">用户名</a></li>
       <li  style="float:right"><a id="user_id" href="#">用户ID</a></li>
      <li class="active" style="float:right;"><a href="#">个人中心</a>
      </li>
      </ul>
      
<div style="width:80%;margin:0 auto;">
       <table class="table table-striped">
  <thead>
    <tr>
      <th>名称</th>
      <th>内容</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>用户名称</td>
      <td id="username"></td>
      <td></td>
    </tr>
    <tr>
      <td>用户ID</td>
      <td id="userid"></td>
      <td></td>
    </tr>
    <tr>
      <td>积分</td>
      <td id="credit"></td>
      <td></td>
    </tr>
    <tr>
        <td>用户级别</td>
        <td id="level"></td>
        <td></td>
      </tr>
    <tr>
        <td>email</td>
        
        <td id="mail"></td>
        <td id="btnmail"><input type="button"style="color:grey;" onclick="script:changemail()" value="更改"></td>
        
    </tr>
     <tr>
      <td>创建时间</td>
      <td id="create_time"></td>
      <td></td>
    </tr>
    <tr>
      <td>性别</td>
      <td id="sex"></td>
      <td id="btnSex"></td>
    </tr>
    <tr style="height:100px;padding:0px;border:0">
      <td>个人简介</td>
      <td id="intro"></td>
      <td id="btninfo"><input type="button"style="color:grey;" onclick="script:changeinfo()" value="更改"></td>
    </tr>
    
  </tbody>
</table>
    <form id="delete" action="delete_user" method="Post" style="disply:none;">
    	<input id="textid" type="hidden" name="judge_value" style="disply:none;"/>
    </form>
    <button name="delete_user" onclick="script:fun1()" type="button" class="btn btn-primary btn-lg btn-block" style="margin-bottom:20px;">账号注销</button>
  
  	<h3>用户发表的主题帖：</h3>
  	<div id="ties"></div>
<%
	User curr_user=(User)session.getAttribute("curr_user");

	String sql="select * from tie where user_ID="+curr_user.ID+" order by ID desc";
	ResultSet rs=db.executeQuery(sql);
	String res="";
	int i=0;
	while(rs.next()){
		//res+="<a id=\""+(rs.getInt(1))+"\"  class=\"list-group-item active\" onclick=\"script:func1(this)\"><h4 class=\"list-group-item-heading\">"+rs.getString(5)+"</h4></a><a href=\"#\" class=\"list-group-item\"><p class=\"list-group-item-text\">发帖人"+rs.getString(2)+"&nbsp;&nbsp;&nbsp;"+rs.getDate(4)+"</p></a>";
	res+="<div ><div  class=\"panel panel-info\"><div class=\"panel-heading\"><h3 id=\""+(rs.getInt(1))+"\" onclick=\"script:func1(this)\" class=\"panel-title\">"+rs.getString(5)+"</h3></div><div class=\"panel-body\"><button class=\"btn btn-primary \" id=\"tie"+rs.getInt(1)+"\"onclick=\"script:deletetie(this)\">删除帖子</button>"+"&nbsp;&nbsp;&nbsp;"+rs.getDate(4)+"&nbsp;&nbsp;&nbsp;回复数量："+rs.getInt(3)+"</div></div></div>";
	}
	

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
	document.getElementById("ties").innerHTML='<%=res %>';
	
	var clicktag;
	function deletetie(obj){
		clicktag=obj.id.substring(3);
		var temp = document.createElement("form");
		temp.action = "delete_tie";
		temp.method = "post";
		temp.style.display = "none";
		var opt = document.createElement("textarea");
		opt.name = "d_tie_id";
		opt.value = ""+clicktag;
		temp.appendChild(opt);
		document.body.appendChild(temp);
		temp.submit();	
		
	}
</script> 
    
    
    
    <script>
    	function fun1(){
    		var t=confirm("是否确认？");
    		if(t==true){
    			document.getElementById("textid").value=true;
        		document.getElementById("delete").submit();
    		}
    	}	
    </script>
    
 <%

 	String str1="普通用户";
 	String str2="管理员";
 	String str;
 	if(curr_user.level==true){
 		str=str1;
 	}else{
 		str=str2;
 	}
 	
 	String str3="男";
 	String str4="女";
 	String sex;
 	if(curr_user.sex==true){
 		sex=str3;
 	}else{
 		sex=str4;
 	}
   %>
<script>
document.getElementById("user_name").innerHTML='<%=curr_user.username%>';
document.getElementById("user_id").innerHTML='<%=curr_user.ID%>';

document.getElementById("username").innerHTML='<%=curr_user.username%>';
document.getElementById("userid").innerHTML='<%=curr_user.ID%>';
document.getElementById("credit").innerHTML='<%=curr_user.credits%>';
document.getElementById("level").innerHTML='<%=str%>';

document.getElementById("mail").innerHTML='<%=curr_user.email%>';
document.getElementById("create_time").innerHTML='<%=curr_user.create_time%>';
document.getElementById("sex").innerHTML='<%=sex%>';
document.getElementById("intro").innerHTML='<%=curr_user.introduce%>';
</script>
      
      
      <Script>
          var submitmail=false;
          function changemail(){
            if(submitmail==false){
            	document.getElementById("mail").innerHTML='<form action="update_info" method="Post" id="email_"> <textarea name="new_email" rows="1"></textarea> </form>';
                document.getElementById("btnmail").innerHTML="<input type='button'style='color:grey;' onclick='script:changemail()' value='提交'>";
                submitmail=true;
 //               alert(document.getElementById("email1").innerHTML);
           }else{
        	   document.getElementById("email_").submit();
           }
        }
          var submitinfo=false;
          function changeinfo(){
            if(submitinfo==false){
            	document.getElementById("intro").innerHTML='<form action="update_info" method="Post" id="intro_"> <textarea name="new_info" rows="5" cols="40"></textarea> </form>';
                document.getElementById("btninfo").innerHTML="<input type='button'style='color:grey;' onclick='script:changeinfo()' value='提交'>";
                submitinfo=true;         }
            else{
            	document.getElementById("intro_").submit();
            }
        }
      </Script>
      <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
      <script src="https://code.jquery.com/jquery.js"></script>
       <!-- 包括所有已编译的插件 -->
      <script src="js/bootstrap.min.js"></script>
      </div> 
   </body>
</html>