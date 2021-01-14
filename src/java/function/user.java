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
import function.fuser;

public class user {
    public static List<fuser> getAllRecords(){
	List<fuser> list = new ArrayList<fuser>();
	
	try {
            Connection con=koneksi.getKoneksi();
            PreparedStatement ps=con.prepareStatement("select * from users");
            ResultSet rs=ps.executeQuery();
            while(rs.next()) {
                    fuser u=new fuser();
                    u.setIduser(rs.getString("id_user"));
                    u.setNamauser(rs.getString("nama_user"));
                    u.setUsername(rs.getString("username"));
                    u.setPassword(rs.getString("password"));
                    u.setLevel(rs.getString("level"));
                    list.add(u);
            }
	} catch(Exception e) {System.err.println("getall: "+e);}
	return list;
    }
    
    public static String idGenerator(List<fuser> datauser, String level){
        String id = "110";
        try{
            for(fuser data : datauser){
                if(level.equals(data.getLevel())){
                    id=data.getIduser();
                } 
            }
            int incr = Integer.parseInt(id.substring(1,3)) + 1;
            if(level.equals("admin")){
                id = "a"+incr;
            } else if(level.equals("pegawai")){
                id = "u"+incr;
            }     
        }catch(Exception e){
            System.out.print(e);
        }
        return id;
    }
    
    public static int save(fuser gt) {
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "insert into `users` (id_user,nama_user,username,password,level) values (?,?,?,?,?)"
            );
            ps.setString(1, gt.getIduser());
            ps.setString(2, gt.getNamauser());
            ps.setString(3, gt.getUsername());
            ps.setString(4, gt.getPassword());
            ps.setString(5, gt.getLevel());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
        return status;
    }
    
    public static int update(fuser u) {
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement(
                    "update users set nama_user=?,username=?,password=?,level=? where id_user=?"
            );
            ps.setString(1, u.getNamauser());
            ps.setString(2, u.getUsername());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getLevel());
            ps.setString(5, u.getIduser());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
        return status;
    }

    public static fuser getRecordById(String id) {
        fuser u = null;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("select * from users where id_user=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new fuser();
                u.setIduser(rs.getString("id_user"));
                u.setNamauser(rs.getString("nama_user"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setLevel(rs.getString("level"));
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return u;
    }

    public static int delete(fuser u) {
        int status = 0;
        try {
            Connection con = koneksi.getKoneksi();
            PreparedStatement ps = con.prepareStatement("delete from users where id_user=?");
            ps.setString(1, u.getIduser());
            status = ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e);
        }
        return status;
    } 


}
