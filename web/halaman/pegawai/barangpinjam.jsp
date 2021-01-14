<%-- 
    Document   : inputpinjam
    Created on : Des 14, 2020, 11:37:28 PM
    Author     : Raynold Panji
--%>

<%@page import="java.util.List"%>
<%@page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<%@page import="function.user,function.fuser,function.barang,function.fbarang,function.pinjam,function.fpinjam"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
    int id = pinjam.idGenerator();
%>

<title>INPUT PEMINJAMAN</title>


<c:choose>
    <c:when test="${level=='pegawai'}">        
        <div class="container my-4">    
            <h2>INPUT DATA PEMINJAMAN</h2>        
            <hr class="my-4">
            <form action="${pageContext.request.contextPath}/proses/simpanpinjam.jsp" method="post">

            <h4 class="my-5 h2">Pinjam Barang</h4>

            <div class="border border-danger p-4">
              <div class="form-group w-25">
                <label for="example1">Kode Pinjam</label>
                <input type="text" class="form-control" id="example1" name="idpinjam" readonly value="<%=id%>">
              </div>

              <div class="form-group w-25">
                <label for="example1">Kode Petugas Karyawan</label>
                <input type="text" class="form-control" id="example1" name="iduser" readonly value="${iduser}">
              </div>

              <div class="form-group w-50">
                <label for="example2">Status Pinjam</label>
                <input type="text" class="form-control" id="example2" name="status" readonly value="Dipinjam">
              </div>

              <div class="form-group w-50">
                <label for="example3">Kode Barang</label>
                <select name="idbarang" class="form-control" id="example3" required>
                    <option value="" disabled selected>-- Pilih Kode Barang --</option>
                    <%
                        List<fbarang> list2 = barang.getAllRecords();
                        request.setAttribute("list2", list2);
                    %>
                    <c:forEach items="${list2}" var="u">
                        <option ${u.getKondisi().equals('Rusak')?'style=font-style:italic;color:red disabled':''} value=${u.getIdbarang()}> ${u.getNamabarang()} (${u.getIdbarang()}) - Kondisi: ${u.getKondisi()}</option>
                    </c:forEach>
                </select>
              </div>

              <div class="form-group w-75">
                <label for="example4">Tanggal Peminjaman</label>
                <input type="date" class="form-control" id="example4" name="tglpinjam">
                <small id="emailHelp" class="form-text text-muted"><i>Note : Kosongkan Jika ingin mengisi hari ini (<%=LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd-MMMM-yyyy"))%>).</i></small>
              </div>

              <div class="form-group">
                <label for="example5">Keterangan peminjaman</label>
                <textarea class="form-control" id="example5" name="ketpinjam" required></textarea>
              </div>

            </div>


              <br>      
            <h4 class="my-5 h2">Detail Peminjam</h4>

            <div class="border border-danger p-4">

              <div class="md-form form-group w-25">
                <label for="example6">Nama Peminjam</label>
                <input type="text" class="form-control" id="example6" name="namapeminjam" required>
              </div>

              <div class="md-form form-group w-50">
                <label for="example7">Kontak Peminjam</label>
                <input type="text" class="form-control" id="example7" name="kontak1" required>
              </div>

              <div class="md-form form-group w-75">
                <label for="example8">Kontak lainnya (opsional)</label>
                <input type="text" class="form-control" id="example8" name="kontak2" value="">
              </div>

            </div>
              <!-- Grid row -->
              <input type="submit" id="simpan" class="btn btn-primary btn-md"name="simpan" value="Simpan" onclick="return confirm('Apakah Ingin Menyimpan data?')">      
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
    