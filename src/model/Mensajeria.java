package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the mensajeria database table.
 * 
 */
@Entity
@NamedQuery(name="Mensajeria.findAll", query="SELECT m FROM Mensajeria m")
public class Mensajeria extends Entidad implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String asunto;

	@Column(name="email_emisor")
	private String emailEmisor;

	@Column(name="email_receptor")
	private String emailReceptor;

	private boolean leido;

	private String mensaje;

	//bi-directional many-to-one association to Usuario
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_emisor")
	private Usuario usuario1;

	//bi-directional many-to-one association to Usuario
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="id_receptor")
	private Usuario usuario2;

	public Mensajeria() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAsunto() {
		return this.asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}

	public String getEmailEmisor() {
		return this.emailEmisor;
	}

	public void setEmailEmisor(String emailEmisor) {
		this.emailEmisor = emailEmisor;
	}

	public String getEmailReceptor() {
		return this.emailReceptor;
	}

	public void setEmailReceptor(String emailReceptor) {
		this.emailReceptor = emailReceptor;
	}

	public boolean getLeido() {
		return this.leido;
	}

	public void setLeido(boolean leido) {
		this.leido = leido;
	}

	public String getMensaje() {
		return this.mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public Usuario getUsuario1() {
		return this.usuario1;
	}

	public void setUsuario1(Usuario usuario1) {
		this.usuario1 = usuario1;
	}

	public Usuario getUsuario2() {
		return this.usuario2;
	}

	public void setUsuario2(Usuario usuario2) {
		this.usuario2 = usuario2;
	}

}