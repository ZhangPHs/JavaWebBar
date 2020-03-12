<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
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
   <body>
   <div class="page-header">
    <h1>网络论坛系统<br>
      <small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;创建新用户</small>
    </h1></div>
    <form action="register" method="Post" onsubmit="return check()">
    <table class="table table-hover">
        <thead>
          <tr>
            <th>项目名称</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          <tr>
           <td>
             用户名
             <span style="color:rbg(0,0,0,0.4)"><small>(长度30以内)</small></span>
           </td>
           <td>
             <textarea id="newuser_name" name="newuser_name" cols="30" rows="1"></textarea>
           </td>
          </tr>
          <tr>
              <td id="pwd">
                密码
                <span style="color:rbg(0,0,0,0.4)"><small>(长度30以内)</small></span>
              </td>
              <td>
                <input type="password" name="newuser_password" onchange="script:f1()" id="pwd1">
                <br><br>
                <input type="password" name="newuser_password" onchange="script:f2()" id="pwd2">
                确认密码
              </td>
             </tr>
          <tr>
            <td>email</td>
            <td><textarea name="newuser_email" cols="30" rows="1"></textarea></td>
          </tr>
          <tr>
            <td>个人简介 <span style="color:rbg(0,0,0,0.4)"><small>(长度300以内）</small></span></td>
            <td><textarea name="newuser_info" cols="30" rows="10"></textarea></td>
          </tr>
          <tr>
              <td>性别</td>
              <td><label class="radio-inline"><input type="radio" name="newuser_sex"  value="true" checked>男<br>
                <input type="radio" name="newuser_sex"  value="false" >女</label></td>
            </tr>
        </tbody>
      
      </table>
      <input type="submit" class="btn btn-primary btn-lg btn-block" value="提交" >
      </form>
      <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
      <script src="https://code.jquery.com/jquery.js"></script>
       <!-- 包括所有已编译的插件 -->
      <script src="js/bootstrap.min.js"></script>
   </body>
   <script>
     var pw_input1=false;
     var pw_input2=false;
       function f1(){
         pw_input1=true;
         f();
       }
       function f2(){
        pw_input2=true;f();
       }
       function f(){
         if(pw_input1&&pw_input2){
           if(document.getElementById("pwd1").value!=document.getElementById("pwd2").value){
             alert("密码错误，请重置！");
             document.getElementById("pwd").className="alert alert-danger";
             return false;
           }else{
            document.getElementById("pwd").className="";
            return true;
           }
         }
         return false
       }
       
       function subcheck(){
    	   if(f()==true && document.getElementById("pwd1").value!="" &&document.getElementById("pwd2").value!=""){
    		   return true;
    	   }
    	   else{
    		   return false;
    	   }
       }
       
       function check(){
    	   if(subcheck()==true&&document.getElementById("newuser_name").value!=""){
            	alert("已成功提交");
    		   return true;
            }
    	   else{
    		   alert("表单不符合要求！");
    		   return false;
    	   }   
       }
       
   </script>
</html>