<%-- 
    Document   : index
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FORM LOGIN</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="template/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="template/js/bootstrap.min.js"></script>
        <script src="template/js/jquery.min.js"></script>
    </head>
    <body>
        <%  
//          String login_msg = (String)request.getAttribute("msg");  
//          if(login_msg!=null) out.print(login_msg);
        %>

        <!-- Mengambil cookies rememberMe -->
        <%
        Cookie[] cookies = request.getCookies();
        String username = "";
        String password = "";
        if(cookies!=null) {
          for(int i=0;i<cookies.length;i++) {
            Cookie cookie = cookies[i];
            if(cookie.getName().equals("username-cookie")) {
                username = cookie.getValue();
            } else if(cookie.getName().equals("password-cookie")) {
                password = cookie.getValue();
            }
          }
        }
       %>
        <div class="container" style="width: 500px;">
            <div id="menu"><center><h1>Halaman Login</h1></center></div><br><br>
            <form action="confirmlogin.jsp" method="post">
                <div class="form-group">
                  <label for="exampleInputUsername">Username</label>
                  <input type="text" name="username" value="<%=username%>" class="form-control" id="exampleInputEmail1" aria-describedby="usernameHelp" placeholder="input username anda">
                  <small id="emailHelp" class="form-text text-muted">Masukan Username.</small>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <div class="input-group">
                    <input type="password" name="password" value="<%=password%>" class="form-control pwd" id="exampleInputPassword1" placeholder="Masukan Password">
                    <span class="input-group-btn">
                      <button class="btn btn-default reveal" type="button"><i class="glyphicon glyphicon-eye-open"></i></button>
                    </span> 
                  </div>
                  <!--<small id="emailHelp" class="form-text text-muted"><a href="forgotpass.jsp">Lupa Password?</a></small>-->
                </div>
                <div class="form-check">
                  <input name="rememberMe" type="checkbox" class="form-check-input" id="exampleCheck1">
                  <label class="form-check-label" for="exampleCheck1">Remember Me</label>
                </div>
                <button type="submit" class="btn btn-primary">Log-In</button>
            </form>
        </div>
    </body>
    
    <!-- Untuk membuat visible password -->
    <script>
        $(".reveal").on('click',function() {
            var $pwd = $(".pwd");
            if ($pwd.attr('type') === 'password') {
                $pwd.attr('type', 'text');
            } else {
                $pwd.attr('type', 'password');
            }
        });
    </script>
</html>
