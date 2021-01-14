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
import function.fpinjam;
import java.time.LocalDateTime;
public class pinjam {
    
    public static List<fpinjam> getAllRecords(){
	List<fpinjam> list = new ArrayList<fpinjam>();
	
	try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement (
                    "SELECT peminjaman.id_pinjam,peminjaman.id_user,peminjaman.status,peminjaman.ket_pinjam,"
                            + "peminjaman.nama_peminjam,peminjaman.kontak1,peminjaman.kontak2,"
                            + "users.nama_user,users.level,"
                            + "barang.id_barang,barang.nama_barang,barang.kondisi,barang.jumlah,"
                            + "peminjaman.tgl_pinjam,peminjaman.tgl_kembali "
                    + "FROM users INNER JOIN  (barang INNER JOIN peminjaman ON barang.id_barang=peminjaman.id_barang) "
                    + "ON users.id_user=peminjaman.id_user"
            );
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                fpinjam u = new fpinjam();
                u.setIdpinjam(rs.getInt("id_pinjam"));
                u.setIduser(rs.getString("id_user"));
                u.setIdbarang(rs.getInt("id_barang"));
                u.setNamabarang(rs.getString("nama_barang"));
                u.setKetpinjam(rs.getString("ket_pinjam"));
                u.setTglpinjam(rs.getString("tgl_pinjam"));
                u.setTglkembali(rs.getString("tgl_kembali"));
                u.setStatus(rs.getString("status"));
                u.setNamapeminjam(rs.getString("nama_peminjam"));
                u.setKontak1(rs.getString("kontak1"));
                u.setKontak2(rs.getString("kontak2"));
                list.add(u);
            }
	}catch(Exception e){System.out.println(e);}
	return list;
}
    
    public static int save(fpinjam gt) {
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO `peminjaman` ("
                            + "`id_pinjam`, `id_user`, `id_barang`, `tgl_pinjam`, `status`,"
                            + "`ket_pinjam`, `nama_peminjam`, `kontak1`, `kontak2`"
                    + ") "
                    + "VALUES (?,?,?,?,?,?,?,?,?);"
            );
            ps.setInt(1, gt.getIdpinjam());
            ps.setString(2, gt.getIduser());
            ps.setInt(3, gt.getIdbarang());
            if(gt.getTglpinjam()==null) ps.setString(4, LocalDateTime.now()+"");
            else  ps.setString(4, gt.getTglpinjam());
            ps.setString(5, gt.getStatus());
            ps.setString(6, gt.getKetpinjam());
            ps.setString(7, gt.getNamapeminjam());
            ps.setString(8, gt.getKontak1());
            ps.setString(9, gt.getKontak2());
            status = ps.executeUpdate();
            System.out.println(gt.getStatus());
        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    public static int idGenerator(){
        int id = 1;
        
        try{
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from peminjaman");
            ResultSet rs=ps.executeQuery();
            if(rs.last()){
                id=rs.getInt("id_pinjam")+1;
            }           
        }catch(Exception e){
            System.out.print(e);
        }
        
        return id;
    }
    
    public static int update(fpinjam u) {
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE `peminjaman` SET `status`=?, `tgl_kembali`=? " +
                    "WHERE `id_user`=? AND `id_barang`=? AND `id_pinjam`=?"
            );
            ps.setString(1, u.getStatus());
            if(u.getTglkembali()==null) ps.setString(2, LocalDateTime.now()+"");
            else  ps.setString(2, u.getTglkembali());
            ps.setString(3, u.getIduser());
            ps.setInt(4, u.getIdbarang());
            ps.setInt(5, u.getIdpinjam());
            status = ps.executeUpdate();
            
            System.out.println(u.getIdbarang()+" & "+u.getIduser()+" & "+u.getIdpinjam());
        } catch (Exception e) {
            System.err.println(e);
        }
        return status;
    }

    public static fpinjam getRecordById(int id) {
        fpinjam u = null;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("select * from peminjaman where id_pinjam=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new fpinjam();
                u.setIdpinjam(rs.getInt("id_pinjam"));
                u.setIduser(rs.getString("id_user"));
		u.setIdbarang(rs.getInt("id_barang"));
		u.setTglpinjam(rs.getString("tgl_pinjam"));
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return u;
    }
}
