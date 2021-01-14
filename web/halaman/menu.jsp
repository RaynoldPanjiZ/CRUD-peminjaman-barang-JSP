<%-- 
    Document   : header
    Created on : Dec 5, 2020, 8:47:29 PM
    Author     : Raynold Panji
--%>
<%@page import="function.fuser"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/template/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/template/css/bootstrap.css">
        <!--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
        <script type="text/javascript" src="${pageContext.request.contextPath}/template/js/bootstrap.js"></script>
    </head>
    <body>
        <!--Cek session login-->
    <%
        if (session.getAttribute("session") != "TRUE") {
            String contextpath = request.getContextPath();
            response.sendRedirect(contextpath + "/index.jsp");        
        } else {
            String id_user = (String)session.getAttribute("iduser");
            String nama_user = (String)session.getAttribute("nama");
            String level_user = (String)session.getAttribute("level");
            int result_content = 1;
    %>
            <!--Kode Navbar-->
        <nav class="navbar navbar-default">            
            <!--Navbar untuk Halaman Admin-->
        <% if(level_user.equals("admin")) { %> 
            <div class="container-fluid">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="menu.jsp?folder=admin&file=dasboard.jsp">Home</a>
              </div>
              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="menu.jsp?folder=admin&file=databarang.jsp">Data Barang</a></li>
                    <li><a href="menu.jsp?folder=admin&file=datauser.jsp">Data User</a></li>
                    <li><a href="menu.jsp?folder=admin&file=peminjaman.jsp">PEMINJAMAN</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="disabled"><b class="navbar-brand">Halaman Admin</b></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin<br>-<%=nama_user%> <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <!--<li><a href="menu.jsp?folder=admin&file=admin.jsp">Profile</a></li>-->
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                </ul>
              </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->


            <!--Navbar Untuk Halaman User Pegawai-->
            <% } else if(level_user.equals("pegawai")) { %>
            <div class="container-fluid">
              <!-- Brand and toggle get grouped for better mobile display -->
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="menu.jsp?folder=pegawai&file=dasboard.jsp">Home</a>
              </div>
              <!-- Collect the nav links, forms, and other content for toggling -->
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="menu.jsp?folder=pegawai&file=peminjaman.jsp">PEMINJAMAN</a></li>
                    <li><a href="menu.jsp?folder=pegawai&file=databarang.jsp">Data Barang</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="disabled"><b class="navbar-brand">Halaman User Pegawai</b></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle navbar-brand" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            User<br>-<%=nama_user%> <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <!--<li><a href="menu.jsp?folder=pegawai&file=admin.jsp">Profile</a></li>-->
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/logout.jsp">Logout</a></li>
                        </ul>
                    </li>
                </ul>
              </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->

            <!--Jika Bukan Admin dan Pegawai-->
        <% } else { result_content = 0; %>
            <div class="container-fluid">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.request.contextPath}/logout.jsp">Logout</a></li>        
                </ul>
            </div><!-- /.container-fluid -->                
        <% } %>
        </nav>
        <!--Akhir Navbar-->


        <!--Isi Konten-->
        <div id="konten">
        <%   
            if(result_content == 1){
                if (request.getParameter("folder")!=null) {
                    String dataFile = request.getParameter("folder")+"/"+request.getParameter("file");
                    File file = new File(request.getServletContext().getRealPath("/halaman/"+dataFile));
                    if (file.exists()) {    %>
                        <jsp:include page="<%=dataFile%>" />
                <%  } else {    %>
                        <jsp:include page="${level}/dasboard.jsp" />	
            <%      }
                } else {    %>
                    <jsp:include page="${level}/dasboard.jsp" />		
            <%  }   
            } else {
                out.print(level_user+"<center>Maaf Konten Belum Tersedia</center>");
            } %>

        </div>
    <% } %>
        
       
