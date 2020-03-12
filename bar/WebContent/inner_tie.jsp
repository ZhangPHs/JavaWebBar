<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="entity.*,java.util.ArrayList,DAO.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
      <%
      Tie curr_tie=(Tie)session.getAttribute("curr_tie");
      User curr_user=(User)session.getAttribute("curr_user");
      %>
      <title><%=curr_tie.title%></title>
   </head>
<body>
   <div class="page-header">
    <h1>网络论坛系统</h1></div>
  
      <ul class="nav nav-tabs">
      <li><a href="main_show.jsp">主页面</a></li>
       <li  style="float:right"><a id="user_name" href="#" >用户名</a></li>
       <li  style="float:right"><a id="user_id" href="#" >用户ID</a></li>
      <li class="active" style="float:right;"><a href="personal.jsp">个人信息</a>
      <li class="active" style="float:right;"><a href="main_show.jsp">返回帖子列表</a>
      </li>
      </ul>


    <div class="panel panel-primary">
      <div class="panel-heading">
        <h3 class="panel-title"><%=curr_tie.title %></h3>
    	</div>
    	<div class="panel-body">
       <%=curr_tie.getRL().get(0).content%> 	
    	</div>
    	<div class="panel-footer" >
    <span onmouseover="script:getInfo()" id="0">发帖人:<%=curr_tie.username%></span> <span style="float:right">发帖时间:<%=curr_tie.create_time %></span>
    	</div>
    </div>
  
<%
	int i=1;
	String res="";
	ArrayList<Reply> AL=curr_tie.getRL();
	while(i<AL.size()){
		User xuser = UserDao_impl.GetUserByID(AL.get(i).user_ID);
		String str="";
		if(xuser.sex==true){
			str="男";
		}else{
			str="女";
		}
		res+="<body>"+
				"<div class=\"panel panel-default\">"+
				"<div class=\"panel-heading\"style=\"color:darkgrey\">"+"楼层："+
				AL.get(i).reply_floor+ "<div style=\"float:right\">"+"回复："+AL.get(i).target_floor+"楼"+"</div>"+
				"</div>"+
				"<div class=\"panel-body\">"+
				AL.get(i).content+
				"</div>"+
				"<div class=\"panel-footer\">"+
				"<button onmouseover=\"script:getInfo(this)\"   onmouseout=\"script:InfoDisplay(this)\" id=\""+AL.get(i).user_ID+"\">发表人:"+AL.get(i).publisher+
				"</button>"+
				"<button class=\"ban\" style=\"display:none;\" onclick=\"script:ban(this)\" id=\"ban"+AL.get(i).user_ID+"\">禁封用户</button>"+
				"<span style=\"float:right\">发帖时间:"+AL.get(i).create_time+"</span>"+
				"</div></div></div>"+
				"<div id=\"info"+AL.get(i).user_ID+"\" style=\"display:none; width:300px;word-wrap:break-word;border: 1px solid;padding:5px\" >"+
				"性别"+str+"<br>"+
				"email: "+xuser.email+"<br>"+
				"个人简介：<br>"+
				xuser.introduce+"</div>";
		i++;
	}

%>
<script>
	document.getElementById("user_name").innerHTML='<%=curr_user.username%>';
	document.getElementById("user_id").innerHTML='<%=curr_user.ID%>';

	
</script>

<div id="reply"><!-- fdsfa --></div>
        


    
    <!--reply--> 
    <div class="new-reply" style="padding-top:50px;">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">发表新回复</h3>
        </div>
        <form id="iform" role="form" action="newreply" method="Post">
        <div class="panel-body">
            
                <div class="form-group">
                    <label for="name"><small>回复层数</small></label>
                    <textarea id="target_floor"class="form-control" rows="1" name="reply-target" placeholder="回复楼主填1"></textarea>
                  </div>
                <div class="form-group">
                  <label for="name"><small>回复内容</small></label>
                  <textarea id="reply_content" class="form-control" rows="5" name="reply-content"></textarea>
                  

                </div>
        </div>
        <div class="panel-footer"><button type="button" class="btn btn-info" onclick="script:s()">发表</button></div>
      </form>
    </div>
    </div>
      
      
      
      <script>
      	document.getElementById("reply").innerHTML='<%=res%>';
      	
            function getInfo(obj){
      	  document.getElementById("info"+obj.id).style.display='block';}
      function InfoDisplay(obj){
      	  document.getElementById("info"+obj.id).style.display='none';}
      	  
      	
      	function s(){
      		if(document.getElementById("target_floor").value=="" || document.getElementById("reply_content").value=="" || document.getElementById("target_floor").value><%=AL.size()%> ||document.getElementById("target_floor").value<1){
      			alert("回复内容不符合规范");
      			return false;
      		}
      		else{
      			document.getElementById("iform").submit();
      			return true;
      		}
      		
      	}
      	function ban(obj){
      		var clicktag=obj.id.substring(3);
    		var temp = document.createElement("form");
    		temp.action = "ban_user";
    		temp.method = "post";
    		temp.style.display = "none";
    		var opt = document.createElement("textarea");
    		opt.name = "b_user_id";
    		opt.value = ""+clicktag;
    		temp.appendChild(opt);
    		document.body.appendChild(temp);
    		temp.submit();		
      	}
      	
      	
      	
    	if(<%=curr_user.level%>==false){
    		var i=0;
    		var len=document.getElementsByClassName("ban").length;
    		var list=document.getElementsByClassName("ban");
    		while(i<len){
    			list[i].style.display='inline-block';
    			i++;
    		}
    		
    	}
      	
      </script>
      
       <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
      <script src="https://code.jquery.com/jquery.js"></script>
       <!-- 包括所有已编译的插件 -->
      <script src="js/bootstrap.min.js"></script>
</body>
</html>