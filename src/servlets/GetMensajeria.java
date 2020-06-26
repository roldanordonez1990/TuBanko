package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import Utils.SuperTipoServlet;
import model.Mensajeria;
import model.Usuario;
import model.controladores.MensajesControlador;

/**
 * Servlet implementation class GetMensajeria
 */
@WebServlet("/GetMensajeria")
public class GetMensajeria extends SuperTipoServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LogManager.getLogger(GetMensajeria.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetMensajeria() {
		super();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Obtengo el usuario guardado en la sesión
		Usuario u = null;

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> dto = new HashMap<String, Object>(); // "dto" significa Data Transfer Object

		try {
			// Obtengo los datos recibidos en el JSON
			JsonNode rootNode = mapper.readTree(request.getInputStream());
			// El usuario guardado en sesiÃ³n puede no tener la imagen u otros datos,
			// primero recuperarÃ© el usuario
			// de la sesiÃ³n y despuÃ©s lo buscarÃ© en la BBDD.
			u = (Usuario) request.getSession().getAttribute(Login.ID_USER_IN_SESSION);

			// Declaro la acción que se quiere realizar
			//String accion = rootNode.path("accion").asText();

			if (u != null ) { // Si existe un usuario guardado en la sesión, obtenemos todos sus mensajes si los tuviera

				// obtengo todos los mensajes que ha recibido el usuario
				List<Mensajeria> mensajes = MensajesControlador.getControlador().findAll();

				List<HashMap<String, Object>> mensajesLeidos = new ArrayList<HashMap<String, Object>>();
				// List<HashMap<String, Object>> mensajesNoLeidos = new ArrayList<HashMap<String, Object>>();

				for (Mensajeria m : mensajes) {

					HashMap<String, Object> hm = new HashMap<String, Object>();

					hm.put("id", m.getId());
					hm.put("id_emisor_nombre", m.getUsuario1().getNombreUsuario());
					hm.put("id_emisor_apellido", m.getUsuario1().getApellido());
					hm.put("id_receptor_nombre", m.getUsuario2().getNombreUsuario());
					hm.put("id_receptor_apellido", m.getUsuario2().getApellido());
					hm.put("email_emisor", m.getEmailEmisor());
					hm.put("email_receptor", m.getEmailReceptor());
					hm.put("asunto", m.getAsunto());
					hm.put("mensaje", m.getMensaje());
					hm.put("leido", m.getLeido());

					mensajesLeidos.add(hm);
				}

				dto.put("idMensajes", mensajesLeidos);
			}

		} catch (

		Exception e) {
			logger.error("Excepción al localizar los datos del usuario en sesión.", e);
		}

		response.setContentType("application/json;charset=UTF-8"); // Codificación UTF-8 de los datos JSON que devuelve el Servlet
		// Creo el JSON de salida y lo devuelvo al cliente
		response.getWriter().println(mapper.writeValueAsString(dto));
	}

}
