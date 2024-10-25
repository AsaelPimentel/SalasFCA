
//Funcion para que un textbox solo acepte numeros del 0 al 9
function allowOnlyNumbers(event) {
    // Obtén el código de la tecla presionada
    var key = event.which || event.keyCode;

    // Verifica si la tecla presionada es un número del 0 al 9
    if (key >= 48 && key <= 57) {
        return true; // Permite la entrada de números del 0 al 9
    } else {
        return false; // Bloquea la entrada de otras teclas
    }
    //Validar que no hhaya campos en blanco//
    function validateNotEmpty(textBox) {
        var value = textBox.value.trim();
        if (value === '') {
            alert('El campo no puede estar vacío.');
            textBox.focus(); // Devuelve el foco al campo para que el usuario lo complete
        }
    }

}