/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package function;

/**
 *
 * @author Raynold Panji
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import function.fbarang;
public class barang {

    public static List<fbarang> getAllRecords(){
	List<fbarang> list = new ArrayList<fbarang>();
	
	try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from barang");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                    fbarang u=new fbarang();
                    u.setIdbarang(rs.getString("id_barang"));
                    u.setNamabarang(rs.getString("nama_barang"));
                    u.setKondisi(rs.getString("kondisi"));
                    u.setKeterangan(rs.getString("keterangan"));
                    u.setJumlah(rs.getString("jumlah"));
                    u.setJenis(rs.getString("jenis"));
                    list.add(u);
            }
	} catch(Exception e){System.err.println(e);}
	return list;
    }
    
    public static int idGenerator(){
        int id = 110;
        
        try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from barang");
            ResultSet rs=ps.executeQuery();
            if(rs.last()){
                id=rs.getInt("id_barang")+1;
            }           
        }catch(Exception e){
            System.out.print(e);
        }
        
        return id;
    }
    
    public static int save(fbarang gt) {
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "insert into `barang` "
                        + "(id_barang,nama_barang,kondisi,keterangan,jumlah,jenis)"
                        + " values (?,?,?,?,?,?)"
            );
            ps.setString(1, gt.getIdbarang());
            ps.setString(2, gt.getNamabarang());
            ps.setString(3, gt.getKondisi());
            ps.setString(4, gt.getKeterangan());
            ps.setString(5, gt.getJumlah());
            ps.setString(6, gt.getJenis());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
            System.err.println(status);
        return status;
    }
    
     public static int update(fbarang u) {
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "update barang set "
                        + "nama_barang=?,kondisi=?,keterangan=?,jumlah=?,jenis=?"
                            + "where id_barang=?"
            );
            ps.setString(1, u.getNamabarang());
            ps.setString(2, u.getKondisi());
            ps.setString(3, u.getKeterangan());
            ps.setString(4, u.getJumlah());
            ps.setString(5, u.getJenis());
            ps.setString(6, u.getIdbarang());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
            System.out.println(u.getIdbarang()+status);
        return status;
    }

    public static fbarang getRecordById(String id) {
        fbarang u = null;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "select * from barang where id_barang=?"
            );
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new fbarang();
                u.setIdbarang(rs.getString("id_barang"));
                u.setNamabarang(rs.getString("nama_barang"));
                u.setKondisi(rs.getString("kondisi"));
                u.setKeterangan(rs.getString("keterangan"));
                u.setJumlah(rs.getString("jumlah"));
                u.setJenis(rs.getString("jenis"));
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return u;
    }
    
    public static int delete(fbarang u) {
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "delete from barang where id_barang=?"
            );
            ps.setString(1, u.getIdbarang());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
        return status;
    } 
}
