<%-- 
    Document   : editpinjam
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji
--%>

<%@page import="java.util.List"%>
<%@page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<%@page import="function.user,function.fuser,function.barang,function.fbarang"%>
<%@page import="function.pinjam,function.fpinjam"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>Edit Peminjaman</title>

<%
    int id = Integer.parseInt(request.getParameter("id_pinjam"));
    fpinjam x = pinjam.getRecordById(id);
%>
                
   

<c:choose>
    <c:when test="${level=='pegawai'}">        
        <div class="container my-4">    
            <h2>EDIT DATA PEMINJAMAN</h2>        
            <hr class="my-4">
            <form action="${pageContext.request.contextPath}/proses/updatepinjam.jsp" method="post">

            <h4 class="my-5 h2">Pinjam Barang</h4>

            <div class="border border-danger p-4">
              <div class="form-group w-25">
                <label for="example1">Kode Pinjam</label>
                <input type="text" class="form-control" id="example1" name="idpinjam" readonly value="<%=x.getIdpinjam()%>">
              </div>

              <div class="form-group w-25">
                <label for="example1">Kode Petugas Karyawan</label>
                <input type="text" class="form-control" id="example1" name="iduser" readonly value="${iduser}">
              </div>

              <div class="form-group w-50">
                <label for="example3">Kode Barang</label>
                <input type="text" class="form-control" id="example3" name="idbarang" readonly value="<%=x.getIdbarang()%>">
              </div>

              <div class="form-group w-50">
                <label for="example2">Status Pinjam</label>
                <input type="text" class="form-control" id="example2" name="status" readonly value="Kembali">
              </div>

              <div class="form-group w-75">
                <label for="example4">Tanggal Pengembalian</label>
                <input type="date" class="form-control" id="example4"  name="tglkembali" value="<%= x.getTglkembali()%>">
                <small id="emailHelp" class="form-text text-muted"><i>Note : Kosongkan Jika ingin mengisi hari ini (<%=LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd-MMMM-yyyy"))%>).</i></small>
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