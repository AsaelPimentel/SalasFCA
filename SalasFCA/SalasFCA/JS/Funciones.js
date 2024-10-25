﻿//function showAlert(message) {
//    document.getElementById("modalMessage").innerHTML = message;
//    document.body.classList.add("body-no-scroll"); // Evita que se desplace el fondo
//    document.getElementById("customModal").style.display = "flex";
//}

//function closeModal() {
//    document.getElementById("customModal").style.display = "none";
//    document.body.classList.remove("body-no-scroll"); // Habilita el desplazamiento del fondo
//}

function showAlert(message) {
    const customModal = document.getElementById("customModal");
    document.getElementById("modalMessage").innerHTML = message;
    document.body.classList.add("body-no-scroll");
    customModal.style.display = "flex";

    // Agregar la clase shake-modal para aplicar la animación al modal
    customModal.classList.add("shake-modal");
}

function closeModal() {
    const customModal = document.getElementById("customModal");
    customModal.style.display = "none";
    document.body.classList.remove("body-no-scroll");

    // Quitar la clase shake-modal para detener la animación
    customModal.classList.remove("shake-modal");
}