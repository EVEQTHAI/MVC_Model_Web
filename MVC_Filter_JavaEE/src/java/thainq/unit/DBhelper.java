/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package thainq.unit;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author PC
 */
public class DBhelper implements Serializable {

    public static Connection makeConnection()
            throws NamingException, SQLException {
//        try{
//        //1.load Driver
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        //2.Create url connettion String --> DB address
//        String url ="jdbc:sqlserver://localhost:1433;databaseName=Sinhvien";
//        //3.open connection
//        Connection con = DriverManager.getConnection(url,"sa","2002");
//        return con;
//        }catch(ClassNotFoundException ex){
//            ex.printStackTrace();
//        }catch(SQLException ex){
//            ex.printStackTrace();
//        }
//        return null;

        //1.get current context 
        Context context = new InitialContext();
        //2.get tomcat context
        Context tomcat = (Context)context.lookup("java:comp/env");
        //3.look up DS
        DataSource ds = (DataSource)tomcat.lookup("thaiDS");
        //4.open connection
        Connection con =ds.getConnection();
        return con;
    }
}
