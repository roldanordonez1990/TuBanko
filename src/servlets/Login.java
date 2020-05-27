package servlets;

import java.io.IOException;

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
import model.Usuario;
import model.controladores.UsuarioControlador;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends SuperTipoServlet {
	private static final long serialVersionUID = 1L;

	private static final Logger logger = LogManager.getLogger(Login.class);
  
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Usuario u = null;
		String userOrEmail = null;
		String password = null;
		try {
			// Obtengo los datos recibidos en el JSON
			ObjectMapper mapper = new ObjectMapper();
			JsonNode rootNode = mapper.readTree(request.getInputStream());
			userOrEmail = rootNode.path("usuOrEmail").asText();
			password = rootNode.path("pass").asText();
			
			// Busco al usuario en la BBDD
			u = UsuarioControlador.getControlador().findByPasswordAndUsernameOrMail(userOrEmail, userOrEmail, password);
			// Si no encuentro al usuario, informo
			if (u == null) {
				logger.info("No se puede localizar al usuario '" + userOrEmail + "' con password '" + password + "'");
			}
			// Si encuentro al usuario establezco su imagen a null, porque en este caso no quiero que dicha imagen
			// viaje en el JSON de salida.
			else {
				logger.info("El usuario " + userOrEmail + " ha iniciado sesion");
			}
			//else {
				//u.setImagen(null);
			//}
		}
		catch (Exception ex) {
			// Ocurri� una excepci�n en el acceso a datos o un error que nos impide acceder a los campos del JSON.
			logger.error("Excepci�n al buscar al usuario o email: '" + userOrEmail + "' con password: '" + password, ex + "'");
		}
		
		// Creo el JSON de salida y lo devuelvo al cliente
		ObjectMapper mapper = new ObjectMapper();
		response.getWriter().println(mapper.writeValueAsString(u));
	}

}
