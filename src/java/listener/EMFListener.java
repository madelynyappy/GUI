/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package listener;

/**
 *
 * @author Madelyn Yap
 */

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class EMFListener implements ServletContextListener {

    // public static EntityManagerFactory emf;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // emf = Persistence.createEntityManagerFactory("FITHUB2PU");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // if (emf != null) {
        //     emf.close();
        // }
    }
}
