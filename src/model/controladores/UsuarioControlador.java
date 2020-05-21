package model.controladores;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import model.Usuario;
import model.Controlador;


public class UsuarioControlador extends Controlador {

	public UsuarioControlador(Class entidadControlada, String unidadPersistencia) {
		super(entidadControlada, unidadPersistencia);
		// TODO Auto-generated constructor stub
	}

	private static UsuarioControlador controlador = null;

	

	public UsuarioControlador() {
		super(Usuario.class, "TuBanko");
	}

	public static UsuarioControlador getControlador() {
		if (controlador == null) {
			controlador = new UsuarioControlador();
		}
		return controlador;
	}

	/**
	 *  
	 */
	public Usuario find(int id) {
		return (Usuario) super.find(id);
	}

	/**
	 * 
	 * @return
	 */
	public Usuario findFirst() {
		try {
			EntityManager em = getEntityManagerFactory().createEntityManager();
			Query q = em.createQuery("SELECT c FROM Usuario c order by c.id", Usuario.class);
			Usuario resultado = (Usuario) q.setMaxResults(1).getSingleResult();
			// esto es una consulta en PSQL, con una consulta SQL de por medio
			em.close();
			return resultado;
		} catch (NoResultException nrEx) {
			return null;
		}
	}

	/**
	 * 
	 * @return
	 */
	public Usuario findLast() {
		try {
			EntityManager em = getEntityManagerFactory().createEntityManager();
			Query q = em.createQuery("SELECT c FROM Usuario c order by c.id desc", Usuario.class);
			Usuario resultado = (Usuario) q.setMaxResults(1).getSingleResult();
			em.close();
			return resultado;
		} catch (NoResultException nrEx) {
			return null;
		}
	}

	/**
	 * 
	 * @return
	 */
	public Usuario findNext(Usuario c) {
		try {
			EntityManager em = getEntityManagerFactory().createEntityManager();
			Query q = em.createQuery("SELECT c FROM Usuario c where c.id > :idActual order by c.id", Usuario.class);
			q.setParameter("idActual", c.getId());
			Usuario resultado = (Usuario) q.setMaxResults(1).getSingleResult();
			em.close();
			return resultado;
		} catch (NoResultException nrEx) {
			return null;
		}
	}

	/**
	 * 
	 * @return
	 */
	public Usuario findPrevious(Usuario c) {
		try {
			EntityManager em = getEntityManagerFactory().createEntityManager();
			Query q = em.createQuery("SELECT c FROM Usuario c where c.id < :idActual order by c.id desc",
					Usuario.class);
			q.setParameter("idActual", c.getId());
			Usuario resultado = (Usuario) q.setMaxResults(1).getSingleResult();
			em.close();
			return resultado;
		} catch (NoResultException nrEx) {
			return null;
		}
	}

	/**
	 * 
	 * @param coche
	 * @return
	 */
	public boolean exists(Usuario usuario) {
		EntityManager em = getEntityManagerFactory().createEntityManager();

		boolean ok = true;
		try {
			Query q = em.createNativeQuery("SELECT * FROM bankonter.usuario where id = ?", Usuario.class);
			q.setParameter(1, usuario.getId());
			usuario = (Usuario) q.getSingleResult();
		} catch (NoResultException ex) {
			ok = false;
		}
		em.close();
		return ok;
	}

	public List<Usuario> findAll() {
		EntityManager em = getEntityManagerFactory().createEntityManager();
		Query q = em.createQuery("SELECT c FROM Usuario c", Usuario.class);
		List<Usuario> resultado = (List<Usuario>) q.getResultList();
		em.close();
		return resultado;
	}
	
	/**
	 * 
	 * @param cliente Este método nos limitará los resultados con un límite
	 * @return
	 */
	
	public List<Usuario> findAllLimited (int limit, int offset) {
		EntityManager em = getEntityManagerFactory().createEntityManager();
		Query q = em.createQuery("SELECT c FROM Usuario c", Usuario.class);
		q.setMaxResults(limit);
		q.setFirstResult(offset);
		List<Usuario> resultado = (List<Usuario>) q.getResultList();
		em.close();
		return resultado;
	}
	
	/**
	 * 
	 * @param cliente
	 * @return Este método nos devuelve un entero con la cantidad total de registros
	 */
	
	public int numRegistros() {
		EntityManager em = getEntityManagerFactory().createEntityManager();
		Query q = em.createNativeQuery("SELECT count(*) FROM Usuario");
		Long cantidad = (Long) q.getSingleResult();
		em.close();
		return cantidad.intValue();
		
	}
	
	/**
	 * 
	 * @param cliente
	 * @return
	 */
	
	public static String toString(Usuario usuario) {
		return usuario.getNombreUsuario() + " " + usuario.getPassword() + " " + usuario.getEmail();
				
	}
	
	
	public Usuario findByPasswordAndUsernameOrMail (String userName, String mail, String password) {
		EntityManager em = getEntityManagerFactory().createEntityManager();
		Usuario u = null;
		try {
			
			Query q = em.createNativeQuery("SELECT * FROM usuario where (nombreUsuario = ? or email = ?) and password = ? limit 1;", Usuario.class);
			q.setParameter(1, userName);
			q.setParameter(2, mail);
			q.setParameter(3, password);
			u = (Usuario) q.getSingleResult();
		}
		catch (NoResultException nrEx) {
		}
		em.close();
		return u;
	}

}
