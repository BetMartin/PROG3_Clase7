package Controllers;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import Persistencia.HibernetConfig;

import java.util.List;

public class Gestor {

    protected String message = null;
    protected int firstResult;
    protected int maxResult = 50;
    protected long totalResult;
    protected int activePage;
    protected String order = "asc";
    private static HibernetConfig configHibernate;
    protected List<String> packages;
    protected List<Class> clases;
    protected Session sesion;

    public Gestor() {
        configHibernate = new HibernetConfig();
        sesion = configHibernate.getSessionFactory().openSession();
    }

    public void guardar(Object o) throws Exception {

        boolean guardar = false;
        Transaction tx = null;
        try {
            if (!sesion.getTransaction().isActive()) {
                tx = sesion.beginTransaction();
                guardar = true;
            }
            sesion.saveOrUpdate(o);
            if (guardar) {
                tx.commit();
                System.out.println("objeto persistido.");
            }
        } catch (Exception e) {
            if (guardar && tx != null) {
                tx.rollback();
                System.out.println("Transacción revertida.");
            }
            throw new Exception(e.getMessage());
        }finally {
            
            if (sesion != null && sesion.isOpen()) {
                sesion.close();
            }
        }
    }

  

    public List listar(Class clase) throws Exception {

        Query consulta = sesion.createQuery("from " + clase.getSimpleName() + " a");
        List<Object> lista;
        try {
            lista = consulta.list();
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new Exception();
        }
        if (lista == null) {
            throw new Exception();
        }
        return lista;
    }
 
}
