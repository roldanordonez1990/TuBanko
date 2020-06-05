package model.controladores;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import model.Controlador;
import model.Tipologiasexo;


public class TipologiaSexoControlador extends Controlador {

	// instancia del singleton
	private static TipologiaSexoControlador controlador = null;

	/**
	 * 
	 */
	public TipologiaSexoControlador() {
		super(Tipologiasexo.class, "TuBanko");
	}

	/**
	 * 
	 * @return
	 */
	public static TipologiaSexoControlador getControlador() {
		if (controlador == null) {
			controlador= new TipologiaSexoControlador();
		}
		return controlador;
	}

	
	/**
	 * 
	 * @return
	 */
	public List<Tipologiasexo> findAllTipologiasSexo () {
		List<Tipologiasexo> entities = new ArrayList<Tipologiasexo>();
		EntityManager em = getEntityManagerFactory().createEntityManager();
		try {			
			Query q = em.createNativeQuery("SELECT * FROM tipologiasexo", Tipologiasexo.class);
			entities = (List<Tipologiasexo>) q.getResultList();
		}
		catch (NoResultException nrEx) {
		}
		em.close();
		return entities;
	}
		
}
