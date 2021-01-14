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
public class login {
    
    public static boolean validate(flogin gt){  
    boolean status = false;  
    try{  
        Connection con = koneksi.getKoneksi();

        PreparedStatement ps=con.prepareStatement(
                "select * from `users` where username=? AND password=?"
        );  

        ps.setString(1, gt.getUsername());  
        ps.setString(2, gt.getPassword());  

        ResultSet rs=ps.executeQuery();  
        status = rs.next();
        
        gt.setIduser(rs.getString("id_user"));
        gt.setNamauser(rs.getString("nama_user"));
        gt.setUsername(rs.getString("username"));
        gt.setPassword(rs.getString("password"));
        gt.setLevel(rs.getString("level"));
        
//        informasiLogin(gt.getNamauser);

    } catch(Exception e){ System.err.println(e); }  
    return status;  
    }  
    
}
