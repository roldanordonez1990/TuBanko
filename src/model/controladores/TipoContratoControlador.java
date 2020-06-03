package model.controladores;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import model.Controlador;
import model.Tipocontrato;

public class TipoContratoControlador extends Controlador {

	private static TipoContratoControlador controller = null;

	// Definición de las constantes asociadas
	public static Tipocontrato CUENTA_CORRIENTE = getControlador().find(1);
	public static Tipocontrato TARJETA_DEBITO = getControlador().find(3);
	public static Tipocontrato TARJETA_CREDITO = getControlador().find(2);
	public static Tipocontrato PRESTAMOS = getControlador().find(4);

	/**
	 * 
	 */

	public TipoContratoControlador() {
		super(Tipocontrato.class, "TuBanko");
	}

	/**
	 * 
	 */

	public static TipoContratoControlador getControlador() {
		if (controller == null) {
			controller = new TipoContratoControlador();
		}
		return controller;
	}

	/**
	 * 
	 */
	public Tipocontrato find(int id) {
		return (Tipocontrato) super.find(id);
	}

	/**
	 * 
	 * @return
	 * @throws NoResultException
	 */
	@SuppressWarnings("unchecked")
	public List<Tipocontrato> findAllTiposContrato() {
		List<Tipocontrato> entities = new ArrayList<Tipocontrato>();
		EntityManager em = getEntityManagerFactory().createEntityManager();
		try {
			Query q = em.createNamedQuery("SELECT * FROM tipocontrato", Tipocontrato.class);
			entities = (List<Tipocontrato>) q.getResultList();
		} catch (NoResultException nrEx) {
		}
		em.close();
		return entities;
	}

}
