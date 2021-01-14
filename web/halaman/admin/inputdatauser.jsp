<%-- 
    Document   : inputdatauser
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji
--%>


    <%@page import="java.util.List"%>
    <%@page import="function.user,function.fuser"%>
    
    <% 
        
        String sel = request.getParameter("lvl");
        if(sel==null) sel="";
        List<fuser> list = user.getAllRecords();
        String id = user.idGenerator(list, sel);
        
    %>
    


<c:choose>
    <c:when test="${level=='admin'}">        
        <div class="container my-4">    
            <h2>TAMBAH USER</h2>        
            <hr class="my-4">
            <form action="${pageContext.request.contextPath}/proses/simpanuser.jsp" method="post">

            <h4 class="my-5 h2">Detail USER</h4>

            <div class="border border-danger p-4">
              <div class="form-group w-25">
                <label for="example1">ID User</label>
                <input type="text" class="form-control" id="example1" name="iduser" readonly  value="<%=id%>" required>
              </div>

              <div class="form-group w-75">
                <label for="example5">Level User</label>
                <select id="level" class="form-control" id="example5" name="level" required onchange="select(this)">
                    <option disabled selected value=''>--- Pilih Level User ---</option>
                    <option id='opadmin' <%=sel.equals("admin")?"selected":""%> value="admin">Admin</option>
                    <option id='oppegawai' <%=sel.equals("pegawai")?"selected":""%> value="pegawai">Pegawai</option>
                </select>
              </div>

              <div class="form-group w-25">
                <label for="example2">Nama Lengkap</label>
                <input type="text" class="form-control" id="example2" name="namauser" required>
              </div>

              <div class="form-group w-50">
                <label for="example3">Username</label>
                <input type="text" class="form-control" id="example3" name="username" required>
              </div>

              <div class="form-group w-50">
                <label for="example4">Password</label>
                <div class="input-group">
                    <input type="password" name="password" class="form-control pwd" id="exampleInputPassword1" placeholder="Masukan Password">
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
                            

<script>
    var pilih1 = document.getElementById("opadmin");
    var pilih2 = document.getElementById("oppegawai");
    function select(element){
        if(pilih1.selected){
            window.location.replace("${pageContext.request.contextPath}/halaman/menu.jsp?folder=admin&file=inputdatauser.jsp&lvl=admin");
        } else if(pilih2.selected) {
            window.location.replace("${pageContext.request.contextPath}/halaman/menu.jsp?folder=admin&file=inputdatauser.jsp&lvl=pegawai");
        } else {
            alert("kosong");
        }
    }
</script>
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