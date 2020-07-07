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
import model.controladores.UsuarioControlador;

/**
 * Servlet implementation class GetEnviarMensaje
 */
@WebServlet("/GetEnviarMensaje")
public class GetEnviarMensaje extends SuperTipoServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LogManager.getLogger(GetMensajeria.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetEnviarMensaje() {
		super();
		// TODO Auto-generated constructor stub
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
			u = (Usuario) request.getSession().getAttribute(Login.ID_USER_IN_SESSION);
			
			//Si el usuario existe, obtenemos los datos introducidos por el cliente como JSON y serán guardados
			// Busco la acción que se quiere realizar
			String accion = rootNode.path("accion").asText();
			System.out.println(accion);
			if (u != null && accion != null && accion.equals("enviar")) {
				
				
				String asunto = rootNode.path("asunto").asText();
				int destinatario = rootNode.path("destinatario").asInt();
				int emisor = rootNode.path("emisor").asInt();
				
				String email_receptor = rootNode.path("email_receptor").asText();
				String email_emisor = rootNode.path("email_emisor").asText();
				String mensaje = rootNode.path("mensaje").asText();
				
				Mensajeria m = new Mensajeria();
				
				m.setAsunto(asunto);
				m.setUsuario2(UsuarioControlador.getControlador().find(destinatario));
				m.setUsuario1(UsuarioControlador.getControlador().find(emisor));
				m.setEmailReceptor(email_receptor);
				m.setEmailEmisor(email_emisor);
				m.setMensaje(mensaje);
				m.setLeido(true);
				
				
				MensajesControlador.getControlador().save(m);
				
				
				
			}
			
		} catch (Exception e) {
			logger.error("Excepción al localizar los datos del usuario en sesión.", e);
			
			
		}
		response.setContentType("application/json;charset=UTF-8"); // Codificación UTF-8 de los datos JSON que devuelve el Servlet
		// Creo el JSON de salida y lo devuelvo al cliente
		response.getWriter().println(mapper.writeValueAsString(dto));
	}

}
