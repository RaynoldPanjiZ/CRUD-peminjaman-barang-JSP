<%-- 
    Document   : proseslogin
    Created on : Des 14, 2020, 11:47:28 PM
    Author     : Raynold Panji
--%>

<%@page import="function.login,function.user,function.fuser"%>  
<jsp:useBean id="obj" class="function.flogin"/>  
<jsp:setProperty property="*" name="obj"/>  
<%  
    boolean status=login.validate(obj);
    if(status){    
//        out.println("You r successfully logged in");  
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        
        session.setAttribute("session","TRUE");
        session.setAttribute("iduser",obj.getIduser());
        session.setAttribute("nama",obj.getNamauser());
        session.setAttribute("level",obj.getLevel());
        
        // Membuat cookies rememberMe
        String rememberMe = request.getParameter("rememberMe");
        if(rememberMe!=null)
        {
            Cookie usernameCookie = new Cookie("username-cookie", username);
            Cookie passwordCookie = new Cookie("password-cookie", username);
            usernameCookie.setMaxAge(24*60*60);
            passwordCookie.setMaxAge(24*60*60);
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
        }        
    
        String context = request.getContextPath() + "/halaman/menu.jsp";    
//        out.print(obj.getNamauser());
        response.sendRedirect(context); 
    } else  {    %>
        <div class="container">
            <div class="alert alert-danger ">
                <strong>GAGAL Login!</strong> Username atau password Tidak cocok
            </div>
        </div>    
        <jsp:include page="index.jsp"/>
<%  }  %>
