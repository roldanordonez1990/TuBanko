package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import Utils.SuperTipoServlet;
import model.Imagen;
import model.Usuario;

/**
 * Comprueba que exista un usuario en la sesión de trabajo, una vez que lo obtiene devolverá la información
 * de este usuario, incorporando la imagen del mismo.
 * En caso de que se desee obtener una miniatura de la imagen, se recibirá un JSON del tipo
 *    {"miniatura":true}
 * En caso de que no se reciba el json, o que este tenga el valor "false", se devolverá la imagen normal, no
 * la miniatura.
 * 
 * Servlet implementation class GetDatosUsuarioEnSesion
 */
@WebServlet("/GetFichaUsuario")
public class GetFichaUsuario extends SuperTipoServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LogManager.getLogger(GetFichaUsuarioGuardar.class);	

    /**
     * @see SuperTipoServlet#SuperTipoServlet()
     */
    public GetFichaUsuario() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Obtengo el usuario guardado en la sesión
		Usuario u = null;
		Imagen i = null;
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> dto = new HashMap<String, Object>(); // "dto" significa Data Transfer Object
		
		try {
			// Obtengo los datos recibidos en el JSON
			JsonNode rootNode = mapper.readTree(request.getInputStream());
			boolean miniatura = false; // Comienzo pensando que no me están pidiendo la miniatura
			boolean contenido = false;
			
			try {
				// Intento obtener el valor de si el json incorpora o no el valor del campo "miniatura".
				miniatura = Boolean.parseBoolean(rootNode.path("miniatura").asText());
				contenido = Boolean.parseBoolean(rootNode.path("contenido").asText());
				
			}
			catch (Exception ex) {
				// Si ocurre una excepción no importa, no se enviará la miniatura
			}

			// El usuario guardado en sesión puede no tener la imagen u otros datos, primero recuperaré el usuario
			// de la sesión y después lo buscaré en la BBDD.
			u = (Usuario) request.getSession().getAttribute(Login.ID_USER_IN_SESSION);
			
			if (u != null) { // Si existe un usuario guardado en la sesión, obtengo sus datos
				dto.put("userName", u.getNombreUsuario()); // Relleno el dto para construir el json de respuesta al servlet
				dto.put("image", (miniatura)? u.getImagen().getMiniatura() : u.getImagen().getContenido());
				dto.put("id", u.getId());
				dto.put("apellido", u.getApellido());
				dto.put("dni", u.getDni());
				dto.put("direccion", u.getDireccion());
				dto.put("email", u.getEmail());
				dto.put("telefono", u.getTelefono());
				//dto.put("idTipologia", u.getTipologiasexo());

			} 
		}
		catch (Exception ex) {
			// Ocurrió una excepción en el acceso a datos o un error que nos impide acceder a los campos del JSON.
			logger.error("Excepción al localizar los datos del usuario en sesión.", ex);
		}

		response.setContentType("application/json;charset=UTF-8");	// Codificación UTF-8 de los datos JSON que devuelve el Servlet
		// Creo el JSON de salida y lo devuelvo al cliente
		response.getWriter().println(mapper.writeValueAsString(dto));
		
	}

}