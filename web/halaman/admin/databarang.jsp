<%-- 
    Document   : databarang
    Created on : Des 15, 2020, 12:37:28 PM
    Author     : Raynold Panji
--%>

<title>DATA BARANG</title>       

<%@page import="function.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
    <c:when test="${level=='admin'}">
        <%
            List<fbarang> list = barang.getAllRecords();
            request.setAttribute("list", list);
        %>

        <div class="container">
        <h1>DATA BARANG</h1>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Kondisi</th>
                <th>Keterangan</th>
                <th>Jumlah</th>
                <th>Jenis</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="u">
                <tr>
                    <td>${u.getIdbarang()}</td>
                    <td>${u.getNamabarang()}</td>
                    <td>${u.getKondisi()}</td>
                    <td>${u.getKeterangan()}</td>
                    <td>${u.getJumlah()}</td>
                    <td>${u.getJenis()}</td>
                    <td><a href="menu.jsp?folder=admin&file=editdatabarang.jsp&id_barang=${u.getIdbarang()}"><button class="btn btn-warning">Edit</button></a></td>
                    <td><a href="${pageContext.request.contextPath}/proses/deletedatabarang.jsp?id_barang=${u.getIdbarang()}"><button class="btn btn-danger" onclick="return confirm('Are you sure you want to continue')">Delete</button></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <br>
        <% if(request.getParameter("alert")!=null) {
                if(request.getParameter("alert").equals("alert-success")) { %>
            <div class="alert alert-success">
                <strong>Success!</strong> <%=request.getParameter("message")%>.
            </div>
            <% } else if(request.getParameter("alert").equals("alert-danger")) { %>
            <div class="alert alert-danger">
                <strong>Danger!</strong> <%=request.getParameter("message")%>.
            </div>
            <% } else {
                out.print("");
            }} 
        %>
          
        <a href="menu.jsp?folder=admin&file=inputdatabarang.jsp"><button class="btn btn-info">Tambah Barang</button></a>
        </div>
    </c:when> 
    <c:otherwise>
        <div class="alert alert-danger">
            <strong>Permission Error!</strong> Akses Ditolak.
        </div>
    </c:otherwise>    
 </c:choose>
        
        
<%@include file="footer.jsp" %>
