package Persistencia;

import Modelo.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class HibernetConfig {
    private static SessionFactory sessionFactory;

    public static void load(){

        try {
            Configuration config = new Configuration();
            config.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/persona?useTimezone=true&serverTimezone=UTC");
            config.setProperty("hibernate.connection.driver_class", "com.mysql.cj.jdbc.Driver");
            config.setProperty("hibernate.connection.username", "root");
            config.setProperty("hibernate.connection.password", "");
            config.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
            config.setProperty("hibernate.show_sql", "true");
            config.setProperty("hibernate.hbm2ddl.auto", "update" );


            // Propiedades C3P0 (asegúrate de tener c3p0 en tu classpath)
            config.setProperty("hibernate.c3p0.min_size","0");
            config.setProperty("hibernate.c3p0.max_size","7");
            config.setProperty("hibernate.c3p0.timeout","100");
            config.setProperty("hibernate.c3p0.max_statements","100");
            config.setProperty("hibernate.c3p0.idle_test_period","100");
            config.setProperty("hibernate.c3p0.autoCommitOnClose","true");
            config.setProperty("hibernate.show_sql", "true");
            config.setProperty("hibernate.format_sql", "true");
            config.setProperty("hibernate.use_sql_comments", "true");
           
            config.addPackage("Modelo");  // Agregar paquete de entidades

            // Agregar clases anotadas
            config.addAnnotatedClass(Persona.class);

            sessionFactory = config.buildSessionFactory();
        } catch (HibernateException e) {
            System.out.println("Error: HibernateException: " + e.getMessage());
        }
    }
    
    public synchronized static Session openSession() {
        return getSessionFactory().openSession();
    }

    public static void closeSession(Session session) {
        if (session != null && session.isOpen()) {
            session.close();
        }
    }

    public synchronized static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            load();
        }
        return sessionFactory;
    }

    public synchronized static void closeSessionFactory() {
        if (sessionFactory != null) {
            sessionFactory.close();
            sessionFactory = null;
        }
    }
}