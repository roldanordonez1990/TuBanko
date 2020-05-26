package model;

import java.io.Serializable;
import javax.persistence.*;


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

	private String email;

	private String nombreUsuario;

	private String password;

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

	public Imagen getImagen() {
		return this.imagen;
	}

	public void setImagen(Imagen imagen) {
		this.imagen = imagen;
	}

}