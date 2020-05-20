

// Siempre que la página esté completamente cargada se aplica lo siguiente
$(document).ready(function () {
    /**
     * Cuando la página esté completamente cargada le asignamos las propiedades al div que actúa
     * como ventana modal de carga
     */
    $('.modal').modal({
        keyboard: false,    // No se puede cerrar la ventana con la tecla "escape"
        backdrop: 'static', // No se puede cerrar la ventana haciendo clic sobre el fondo de la página
        show: false  // Por defecto aparece oculto en la página
    })
    

});


/**
 * Obtiene los parámetros pasados por la URL de "window.location". 
 * Estudia la cadena de texto de window.location y genera un array que, al ser js, 
 * puede accederse directamente un par key->value
 */
function getRequestParameters() {
    var requestParams = new Array();
    if (window.location.search.split('?').length > 1) {
        var params = window.location.search.split('?')[1].split('&');
        for (var i = 0; i < params.length; i++) {
            var key = params[i].split('=')[0];
            var value = decodeURIComponent(params[i].split('=')[1]);
            requestParams[key] = value;
        }
    }
    return requestParams;
};

/**
 * Hace una llamada a un request JSON, pasando un json de envío y recibiendo una respuesta.
 * Además también se encarga de activar la ventana modal de "cargando" y de desactivarla cuando
 * se recibe la respuesta desde el servidor o cuando se incurre en un error
 * @param {*} url 
 * @param {*} jsonSendingData 
 * @param {*} successFunction 
 * @param {*} errorFunction 
 */
function sendJsonRequest(url, jsonSendingData, successFunction, errorFunction) {
    $('#infoModal').fadeIn('100');
    $.ajax(url, {
        data: jsonSendingData,
        contentType: 'application/json',
        type: 'POST',
        dataType: 'json',
        success: function (data, status) {
            successFunction(data, status);
            $('#infoModal').fadeOut();
        },
        error: function (xhr, strError, exception) {
            if (errorFunction != null) {
                errorFunction(strError);
            }
            $('#infoModal').fadeOut();
        }
    });
}


// Variables para especificar el tipo de alerta que se desea mostrar
var ALERT_INFO = 1;
/**
 * Muestra alertas en la parte superior de la página. Si hubiera alertas previas, las elimina con 
 * una suave animación.
 * @param {*} type 
 * @param {*} shortMsg 
 * @param {*} msg 
 */
function showAlertMessage(type, shortMsg, msg) {
    // Si existen alertas en pantalla, las elimino
    var millisToDelayNewMsg = 0;
    if ($(".alert") != null) {
        millisToDelayNewMsg = 300;
        $(".alert").fadeOut(millisToDelayNewMsg);
        setTimeout(function () {
            $('.alert').remove();
        }, millisToDelayNewMsg);
    }

    // Muestro el nuevo mensaje, tras esperar los millis que correspondan
    var htmlToPrepend = '<div class="alert ';
    if (type == ALERT_INFO) {
        htmlToPrepend += ' alert-success ';
    }
    htmlToPrepend += 'alert-dismissible fade show" role="alert">';
    if (shortMsg != null) {
        htmlToPrepend += '<strong>' + shortMsg + '</strong> ';
    }
    htmlToPrepend += msg + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"> ' +
        '<span aria-hidden="true">&times;</span>' +
        '</button> ' +
        '</div>';

    // Después de construir el html, finalmente lo muestro con una animación
    setTimeout(function () {
        $("#containerPrincipal").prepend(htmlToPrepend);
    }, millisToDelayNewMsg);
    $(".alert").fadeIn(300);
}


/**
 * Obtener el contenido de un inputFom tipo "file", codificado en formato Base64,
 * una vez que el fichero se ha cargado se llama a la función que nos indican.
 * @param {*} fileInput 
 * @param {*} onFileLoadedFunction 
 */
function getDataFromFileInput(fileInput, onFileLoadedFunction) {
     if (fileInput.prop('files') && fileInput.prop('files')[0]) {
        var fileToUpload = fileInput.prop('files')[0];
        var fr = new FileReader();
        fr.readAsDataURL(fileToUpload);
        fr.onload = function () {
            var fileData = fr.result;  // data <-- in this var you have the file data in Base64 format
            onFileLoadedFunction(fileData);
        };
    }
    else {
        onFileLoadedFunction(null);
    }
}