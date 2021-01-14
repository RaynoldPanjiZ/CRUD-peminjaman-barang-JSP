<%-- 
    Document   : editdatauser
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji
--%>

<title>Edit User</title>
<%@page import="function.user,function.fuser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String id = request.getParameter("id_user");
    fuser u = user.getRecordById(id);
%>                    
                    
                    

<c:choose>
    <c:when test="${level=='admin'}">        
        <div class="container my-4">    
            <h2>EDIT USER</h2>        
            <hr class="my-4">
            <form action="${pageContext.request.contextPath}/proses/updateuser.jsp" method="post">

            <h4 class="my-5 h2">Detail USER</h4>

            <div class="border border-danger p-4">
              <div class="form-group w-25">
                <label for="example1">Kode User</label>
                <input type="text" class="form-control" id="example1" name="iduser" readonly  value="<%=id%>" required>
              </div>

              <div class="form-group w-75">
                <label for="example5">Level User</label>
                <input type="text" class="form-control" id="example1" name="level" readonly  value="<%=u.getLevel()%>" required>
              </div>

              <div class="form-group w-25">
                <label for="example2">Nama Lengkap</label>
                <input type="text" class="form-control" id="example2" name="namauser"  value="<%= u.getNamauser()%>" required>
              </div>

              <div class="form-group w-50">
                <label for="example3">Username</label>
                <input type="text" class="form-control" id="example3" name="username" value="<%= u.getUsername()%>" required>
              </div>

              <div class="form-group w-50">
                <label for="example4">Password</label>
                <div class="input-group">
                    <input type="password" name="password" class="form-control pwd" id="exampleInputPassword1" value="<%= u.getPassword()%>">
                    <span class="input-group-btn">
                      <button class="btn btn-default reveal" type="button"><i class="glyphicon glyphicon-eye-open"></i></button>
                    </span> 
                </div>
              </div>

            </div>

              <!-- Grid row -->
              <input type="submit" class="btn btn-primary btn-md"name="simpan" value="Simpan" onclick="return confirm('Apakah Ingin Menyimpan data?')">      
            </form>
            <!-- Extended material form grid -->

        </div>
    </c:when> 
    <c:otherwise>
        <div class="alert alert-danger">
            <strong>Permission Error!</strong> Akses Ditolak.
        </div>
    </c:otherwise>    
</c:choose> 
        

<%@include file="footer.jsp" %>


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