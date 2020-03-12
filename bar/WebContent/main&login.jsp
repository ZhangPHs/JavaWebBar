<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="bar_work.db"
    import="java.sql.*"
    import ="entity.*"
    import = "servlet.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Login</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery.js">
	</script>
 <!-- 包括所有已编译的插件 -->
	<script src="js/bootstrap.min.js">
	</script>
      <style>
        body{
            margin: 0;
                        
        }  
        .container{
            width: 50%;
            text-align: center;
            margin: 0 auto;
            font-size: 60px;
            background-color: #eee;
        }

      	footer{
            width: 100%;
            height: 60px;
            line-height: 60px;
            background-color:rgb(34, 32, 32,0.8);
            position:absolute;
            bottom: 0;
            z-index:2;
        }
        .footer_left{
            float: left;
            font-size: 20px;
        }
        .footer_left input{
            border-radius: 14px;
            height: 40px;            
            margin-left: 20px;
            padding-left: 20px;
            
        } 
        .footer_left .btn{
            width: 50px;
            padding: 0;
        }
        .footer_right{
            float:right;
        }
        .footer_right a{
            color:#ccc;
            margin-right: 10px;
            text-decoration: none;
            font-size: 20px;
        }       
        
        .footer_right a:hover{
            color: white;
        }

      </style>
       
   </head>
   
<body>
<img id="bg" src="./image/main_bgt.jpg" style="position:fixed; left:0;top:0;bottom:60px;width:100%;height:950px;display:inline;">

<footer>
       <div class="footer_left">
            <form id="in" name="f" action="login"  method="Post">
                 <input type="text" name="username" placeholder="用户名" />
                 <input type="password" name="password" placeholder="密码"/>
                 <input class="btn btn-primary" type="submit" value="login" />
            </form>
       </div>
        <div class="footer_right">
            <a href="register.jsp">用户注册</a>  
           	<a  href="visitor.jsp" >游客模式</a>
        </div>
</footer>

        
</body>
</html>