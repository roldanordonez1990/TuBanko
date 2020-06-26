package model.controladores;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import model.Controlador;
import model.Mensajeria;
import model.Usuario;

public class MensajesControlador extends Controlador {

	public MensajesControlador(Class entidadControlada, String unidadPersistencia) {
		super(entidadControlada, unidadPersistencia);
		// TODO Auto-generated constructor stub
	}

	private static MensajesControlador controlador = null;

	public MensajesControlador() {
		super(Mensajeria.class, "TuBanko");
	}

	/**
	 * 
	 * @return
	 */
	
	public static MensajesControlador getControlador() {
		if (controlador == null) {
			controlador = new MensajesControlador();
		}
		return controlador;
	}

	/**
	 *  
	 */
	
	public Mensajeria find(int id) {
		return (Mensajeria) super.find(id);
	}
	
	/**
	 * 
	 * @return
	 */
	
	public List<Mensajeria> findAll() {
		EntityManager em = getEntityManagerFactory().createEntityManager();
		Query q = em.createQuery("SELECT c FROM Mensajeria c", Mensajeria.class);
		List<Mensajeria> resultado = (List<Mensajeria>) q.getResultList();
		em.close();
		return resultado;
	}
}
