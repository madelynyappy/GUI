/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Madelyn Yap
 * will not be using jdbc afterwards 
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
            return DriverManager.getConnection(
                "jdbc:derby://localhost:1527/fithubdb",
                "app",  
                "app"   
            );
        } catch (ClassNotFoundException e) {
            throw new SQLException("Derby Driver not found", e);
        }
    }
}

