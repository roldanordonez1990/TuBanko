package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the usuario database table.
 * 
 */
@Entity
@NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u")
public class Usuario extends Entidad implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String apellido;

	private String direccion;

	private String dni;

	private String email;

	private String nombreUsuario;

	private String password;

	private int telefono;

	//bi-directional many-to-one association to Contrato
	@OneToMany(mappedBy="usuario")
	private List<Contrato> contratos;

	//bi-directional many-to-one association to Mensajeria
	@OneToMany(mappedBy="usuario1")
	private List<Mensajeria> mensajerias1;

	//bi-directional many-to-one association to Mensajeria
	@OneToMany(mappedBy="usuario2")
	private List<Mensajeria> mensajerias2;

	//bi-directional many-to-one association to Tipologiasexo
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idTipologia")
	private Tipologiasexo tipologiasexo;

	//bi-directional many-to-one association to Imagen
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idImagen")
	private Imagen imagen;

	public Usuario() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getApellido() {
		return this.apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getDireccion() {
		return this.direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getDni() {
		return this.dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNombreUsuario() {
		return this.nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getTelefono() {
		return this.telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public List<Contrato> getContratos() {
		return this.contratos;
	}

	public void setContratos(List<Contrato> contratos) {
		this.contratos = contratos;
	}

	public Contrato addContrato(Contrato contrato) {
		getContratos().add(contrato);
		contrato.setUsuario(this);

		return contrato;
	}

	public Contrato removeContrato(Contrato contrato) {
		getContratos().remove(contrato);
		contrato.setUsuario(null);

		return contrato;
	}

	public List<Mensajeria> getMensajerias1() {
		return this.mensajerias1;
	}

	public void setMensajerias1(List<Mensajeria> mensajerias1) {
		this.mensajerias1 = mensajerias1;
	}

	public Mensajeria addMensajerias1(Mensajeria mensajerias1) {
		getMensajerias1().add(mensajerias1);
		mensajerias1.setUsuario1(this);

		return mensajerias1;
	}

	public Mensajeria removeMensajerias1(Mensajeria mensajerias1) {
		getMensajerias1().remove(mensajerias1);
		mensajerias1.setUsuario1(null);

		return mensajerias1;
	}

	public List<Mensajeria> getMensajerias2() {
		return this.mensajerias2;
	}

	public void setMensajerias2(List<Mensajeria> mensajerias2) {
		this.mensajerias2 = mensajerias2;
	}

	public Mensajeria addMensajerias2(Mensajeria mensajerias2) {
		getMensajerias2().add(mensajerias2);
		mensajerias2.setUsuario2(this);

		return mensajerias2;
	}

	public Mensajeria removeMensajerias2(Mensajeria mensajerias2) {
		getMensajerias2().remove(mensajerias2);
		mensajerias2.setUsuario2(null);

		return mensajerias2;
	}

	public Tipologiasexo getTipologiasexo() {
		return this.tipologiasexo;
	}

	public void setTipologiasexo(Tipologiasexo tipologiasexo) {
		this.tipologiasexo = tipologiasexo;
	}

	public Imagen getImagen() {
		return this.imagen;
	}

	public void setImagen(Imagen imagen) {
		this.imagen = imagen;
	}

}