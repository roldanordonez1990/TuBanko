package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.geronimo.mail.util.Base64;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import Utils.SuperTipoServlet;
import model.Contrato;
import model.Imagen;
import model.Tipocontrato;
import model.Tipologiasexo;
import model.Usuario;
import model.controladores.TipoContratoControlador;
import model.controladores.TipologiaSexoControlador;
import model.controladores.UsuarioControlador;

/**
 * Comprueba que exista un usuario en la sesión de trabajo, una vez que lo
 * obtiene devolverá la información de este usuario, incorporando la imagen
 * del mismo. En caso de que se desee obtener una miniatura de la imagen, se
 * recibirá un JSON del tipo {"miniatura":true} En caso de que no se reciba el
 * json, o que este tenga el valor "false", se devolverá la imagen normal, no
 * la miniatura.
 * 
 * Servlet implementation class GetDatosUsuarioEnSesion
 */
@WebServlet("/GetFichaUsuarioGuardar")
public class GetFichaUsuarioGuardar extends SuperTipoServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LogManager.getLogger(GetFichaUsuarioGuardar.class);

	/**
	 * @see SuperTipoServlet#SuperTipoServlet()
	 */
	public GetFichaUsuarioGuardar() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
			
		HashMap<String, Object> dto = new HashMap<String, Object>(); // "dto" significa Data Transfer Object
		try {

			Imagen i = null;
			ObjectMapper mapper = new ObjectMapper();
			JsonNode rootNode = mapper.readTree(request.getInputStream());
			int id = rootNode.path("id").asInt();
			Usuario u = new Usuario();
			//u = (Usuario) request.getSession().getAttribute(Login.ID_USER_IN_SESSION);

			if (u != null) {
				u = (Usuario) UsuarioControlador.getControlador().find(id);
			}

			// Busco la acci�n que se quiere realizar
			String accion = rootNode.path("accion").asText();

			if (accion != null && accion.equals("almacenar")) {
				u.setNombreUsuario(rootNode.path("nombreUsuario").asText());
				u.setApellido(rootNode.path("apellido").asText());
				u.setEmail(rootNode.path("email").asText());
				u.setTipologiasexo((Tipologiasexo) TipologiaSexoControlador.getControlador()
						.find(rootNode.path("idTipologia").asInt()));
				u.setDni(rootNode.path("dni").asText());
				u.setDireccion(rootNode.path("direccion").asText());
				u.setTelefono(rootNode.path("telefono").asInt());
				//u.setContratos((List<Contrato>) TipoContratoControlador.getControlador().find(rootNode.path("idContrato").asInt()));

//				if (rootNode.path("image") != null) {
//					String strImagen = rootNode.path("image").asText();
//					if (strImagen.contains("base64,")) {
//						String imageData = strImagen.split("base64,")[1];
//						i.setMiniatura(Base64.decode(imageData));
//					}
//				}
//							
				UsuarioControlador.getControlador().save(u);
			}

			if (accion != null && accion.equals("eliminar")) {
				UsuarioControlador.getControlador().remove(u);
			}
			response.setContentType("application/json;charset=UTF-8"); // Codificación UTF-8 de los datos JSON que
																		// devuelve el Servlet
			mapper = new ObjectMapper();
			// Creo el JSON de salida y lo devuelvo al cliente
			response.getWriter().println(mapper.writeValueAsString(u));

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}