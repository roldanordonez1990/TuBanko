<jsp:include page="cabecera.jsp" flush="true">
	<jsp:param name="tituloDePagina" value="Login" />
</jsp:include>

<script>
	$(document).ready(function() {
  
	var loginImages = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    $("#loginIma").css("background", "url('../images/" + loginImages[Math.floor(Math.random() * loginImages.length)] + "')");
    $("#loginIma").css("background-position", "center");
    $("#loginIma").css("background-size", "cover");
  
					// AcciÃ³n a realizar cuando el usuario pulse el botÃ³n "#btnEntrar". Recordar que dicho botÃ³n tiene que incluir el type="button". Si no se pusiera					// ese type el botÃ³n se comportarÃ­ por defecto como type="submit" y enviarÃ­a el formulario, cosa que no es lo que queremos.
					$("#btnEntrar").click(function() {               

					// Comienzo la acciÃ³n validando el formulario antes de su envÃ­o        
					if (!checkFormValidity($("#formLogin"))) { // Compruebo la validaciÃ³n con una funciÃ³n que podemos encontrar en el fichero jquery-utils.js
						showAlertMessage($("#login-container"), ALERT_DANGER, "Datos no v&aacute;lidos", "Has introducido al menos un dato no v&aacute;lido"); // Muestro una alerta
					}

					else{
						 insertWaitingIcon($("#spinner"));

						// Construyo un objeto con los datos del formulario introducidos por el usuario
						var obj = { usuOrEmail: $("#usuOrEmail").val(), 
									pass: $("#pass").val() };
				
						// EnvÃ­o la peticiÃ³n JSON
						sendJsonRequest("/Login", // URL a la que envÃ­o la peticiÃ³n
						JSON.stringify(obj),  // Datos JSON que envÃ­o al Servlet
						function (data, status) {  // FunciÃ³n que se ejecutarÃ¡ cuando la peticiÃ³n se realice con Ã©xito
					if (data.userName == null) { // Si el servicio devuelve "null" significa que no se ha encontrado un usuario como el que se quiere autenticar
					alert("nooooooooo");
						showAlertMessage($("#login-container"), ALERT_DANGER, "Error", "El usuario y/o contrase&ntilde;a introducidos no son v&aacute;lidos");
					}
					else { // AutenticaciÃ³n correcta, redirigimos al portal de la aplicaciÃ³n.
					window.location.href = "portal.jsp";
					}
					removeWaitingIcon($("#spinner"));  // Detengo la animaciÃ³n de "Waiting"
				}, 
				function (resumenError) {  // FunciÃ³n que se ejecutarÃ¡ si la peticiÃ³n web sale mal
					showAlertMessage($("#login-container"), ALERT_DANGER, "Error inesperado: ", resumenError); // Muestro una alerta
					removeWaitingIcon($("#spinner")); // Detengo la animaciÃ³n de "Waiting"
				});
				}
			});
		});

</script>

<body class="bg-gradient-success">

	<div class="container" id="containerPrincipal">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">
				<img src="../res/TuBanKo.png" style="width: 55%;"
					class="mx-auto d-block">

				<div class="card o-hidden border-0 shadow-lg my-5 " id="login-container">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block" id="loginIma"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Inicia sesi&oacute;n en
											TuBanK</h1>
									</div>
									<form id="formLogin">
										<div class="form-group">
											<input type="email" class="form-control form-control-user checkValidity"
												id="usuOrEmail" aria-describedby="emailHelp"
												placeholder="Usuario o correo electr&oacute;nico" validity="email">
												<div class="valid-feedback">Correcto</div>
                      							<div class="invalid-feedback">Debes introducir un email v&aacute;lido antes de intentar entrar</div>  
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user checkValidity"
												id="pass" placeholder="contrase&ntilde;a" validity="noEmpty">
												<div class="valid-feedback">Correcto</div>
												<div class="invalid-feedback">Debes introducir una contrase&ntilde;a antes de intentar entrar</div> 
										</div>
										<button type="button"
											class="btn btn-primary btn-user btn-block" id="btnEntrar"><span id="spinner"></span> Iniciar
											Sesi&oacute;n </button> 
										<hr>
									</form>
									<div class="text-center">
										<a class="small" href="forgot-password.html">&iquest;Olvid&eacute;
											mi contrase&ntilde;a?</a>
									</div>
									<div class="text-center">
										<a class="small" href="register.html">Crea una Cuenta</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

  </div>


</body>
</html>