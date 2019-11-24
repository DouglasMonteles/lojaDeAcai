package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseDAO {
    public Connection con;
    
    public void conectar() throws Exception{
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/db_good_acai";
        String user = "root";
        String psw = "";
        
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, psw);
    }
    
    public void desconectar() throws Exception {
        if (!con.isClosed()) {
            con.close();
        }
    }
}
