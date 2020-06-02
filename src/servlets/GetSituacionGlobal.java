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

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import Utils.SuperTipoServlet;
import model.Contrato;
import model.Usuario;
import model.controladores.TipoContratoControlador;
import model.controladores.UsuarioControlador;

/**
 * Servlet implementation class GetSituacionGlobal
 */
@WebServlet("/GetSituacionGlobal")
public class GetSituacionGlobal extends SuperTipoServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LogManager.getLogger(GetDatosUsuarioEnSesion.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetSituacionGlobal() {
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
			// En este Servlet no necesito obtener datos de entrada

			// Busco al usuario en la BBDD si está logado o no
			u = (Usuario) request.getSession().getAttribute(Login.ID_USER_IN_SESSION);

			if (u != null) { // Si encuentro al usuario logado, obtengo sus datos
				u = UsuarioControlador.getControlador().find(u.getId());

				// Obtengo un array de elementos con cada una de las cuentas, tarjetas,
				// préstamos, etc del usuario
				List<HashMap<String, Object>> cuentasCorrientes = new ArrayList<HashMap<String, Object>>();
				List<HashMap<String, Object>> tarjetasDebito = new ArrayList<HashMap<String, Object>>();
				List<HashMap<String, Object>> tarjetasCredito = new ArrayList<HashMap<String, Object>>();
				List<HashMap<String, Object>> prestamos = new ArrayList<HashMap<String, Object>>();

				for (Contrato c : u.getContratos()) {
					HashMap<String, Object> hm = new HashMap<String, Object>();
					hm.put("id", c.getId());
					hm.put("descriptor", c.getDescriptor());
					hm.put("saldo", c.getSaldo());

					if (c.getTipocontrato().getId() == TipoContratoControlador.CUENTA_CORRIENTE.getId()) {
						cuentasCorrientes.add(hm);
					} else if (c.getTipocontrato().getId() == TipoContratoControlador.TARJETA_DEBITO.getId()) {
						hm.put("limite", c.getLimite());
						tarjetasDebito.add(hm);
					} else if (c.getTipocontrato().getId() == TipoContratoControlador.TARJETA_CREDITO.getId()) {
						tarjetasCredito.add(hm);
					} else if (c.getTipocontrato().getId() == TipoContratoControlador.PRESTAMOS.getId()) {
						prestamos.add(hm);
					}
				}

				dto.put("userName", u.getNombreUsuario()); // Relleno el dto para construir el json de respuesta al
															// servlet
				dto.put("accounts", cuentasCorrientes);
				dto.put("debitCards", tarjetasDebito);
				dto.put("creditCards", tarjetasCredito);
				dto.put("loans", prestamos);

			}

		} catch (Exception e) {
			// Ocurrirá una excepción en el acceso a datos o un error que nos impide
			// acceder a los campos del JSON.
			logger.error("Excepción al localizar los datos del usuario en sesión.", e);
		}
		response.setContentType("application/json;charset=UTF-8");	// CodificaciÃ³n UTF-8 de los datos JSON que devuelve el Servlet
		// Creo el JSON de salida y lo devuelvo al cliente
		response.getWriter().println(mapper.writeValueAsString(dto));
	}

}
