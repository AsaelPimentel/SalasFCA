<%@ Page Title="Registrar Eventos" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Salas.aspx.vb" Inherits="SalasFCA.Salas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="JS/Validaciones.js"></script>
    <script>
        function imprimirPagina() {
            // Clonar el contenido del modal
            var modalContentClone = document.getElementById('exampleModal').cloneNode(true);

            // Modificar el ID del clon para evitar conflictos con el modal original
            modalContentClone.id = 'exampleModalClone';

            // Rellenar los datos del clon con los valores del formulario
            var txtNomDocenteClone = modalContentClone.querySelector('#<%= TxtNomDocente.ClientID %>');
            var txtNumEmpleadoClone = modalContentClone.querySelector('#<%= TxtNumEmpleado.ClientID %>');
            var txtTelDocenteClone = modalContentClone.querySelector('#<%= TxtTelDocente.ClientID %>');
            var txtMailDocenteClone = modalContentClone.querySelector('#<%= TxtMailDocente.ClientID %>');
            var txtNomEventoClone = modalContentClone.querySelector('#<%= TxtNomEvento.ClientID %>');
            var txtFechaSeleccionadaClone = modalContentClone.querySelector('#<%= TxtFechaSeleccionada.ClientID %>');
            var txtHoraIncioClone = modalContentClone.querySelector('#<%= TxtHoraIncio.ClientID %>');
            var txtFechaFinClone = modalContentClone.querySelector('#<%= TxtFechaFin.ClientID %>');
            var txtHoraFinClone = modalContentClone.querySelector('#<%= TxtHoraFin.ClientID %>');
            var chbxSalaClone = modalContentClone.querySelector('#<%= ChbxSala.ClientID %>');
            var txtNotasClone = modalContentClone.querySelector('#<%= TxtNotas.ClientID %>');
            var txtMailConsentimientoClone = modalContentClone.querySelector('#<%= TxtMailConsentimiento.ClientID %>');

        txtNomDocenteClone.value = document.getElementById('<%= TxtNomDocente.ClientID %>').value;
        txtNumEmpleadoClone.value = document.getElementById('<%= TxtNumEmpleado.ClientID %>').value;
        txtTelDocenteClone.value = document.getElementById('<%= TxtTelDocente.ClientID %>').value;
        txtMailDocenteClone.value = document.getElementById('<%= TxtMailDocente.ClientID %>').value;
        txtNomEventoClone.value = document.getElementById('<%= TxtNomEvento.ClientID %>').value;
        txtFechaSeleccionadaClone.value = document.getElementById('<%= TxtFechaSeleccionada.ClientID %>').value;
        txtHoraIncioClone.value = document.getElementById('<%= TxtHoraIncio.ClientID %>').value;
        txtFechaFinClone.value = document.getElementById('<%= TxtFechaFin.ClientID %>').value;
        txtHoraFinClone.value = document.getElementById('<%= TxtHoraFin.ClientID %>').value;
        chbxSalaClone.value = document.getElementById('<%= ChbxSala.ClientID %>').value;
        txtNotasClone.value = document.getElementById('<%= TxtNotas.ClientID %>').value;
        txtMailConsentimientoClone.value = document.getElementById('<%= TxtMailConsentimiento.ClientID %>').value;

            // Copiar la hoja de estilos al contenido clonado
            var stylesheets = document.querySelectorAll('link[rel="stylesheet"], style');
            stylesheets.forEach(function (stylesheet) {
                modalContentClone.appendChild(stylesheet.cloneNode(true));
            });
            // Agregar estilos específicos para la impresión
            var style = document.createElement('style');
            style.innerHTML = `
        body {
            font-size: 14px; /* Tamaño de fuente predeterminado */
            overflow: hidden;

        }
            body.modal-body {
                overflow: hidden; /* Ocultar la barra de desplazamiento */
            }
        @page {
            size: letter;
            margin: 1cm; /* Márgenes de la página */
        }
    `;
            modalContentClone.appendChild(style);

            // Abrir una nueva ventana o pestaña con el contenido clonado
            var nuevaVentana = window.open('', '_blank');
            nuevaVentana.document.body.appendChild(modalContentClone);

            // Imprimir la nueva ventana o pestaña
            nuevaVentana.print();
        }
    </script>
<!-- Calendario -->
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                locale: 'es',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                dateClick: function (info) {
                    // Obtenemos la fecha seleccionada en el formato "yyyy-mm-dd"
                    var fechaSeleccionada = info.date.toISOString().split('T')[0];
                    // Accedemos al elemento ASP TextBox por su ID
                    var elementoASP = document.getElementById('<%= TxtFechaSeleccionada.ClientID %>');
                    // Asignamos la fecha seleccionada al TextBox
                    elementoASP.value = fechaSeleccionada;
                    // Abre el modal
                    $("#exampleModal").modal("show");
                }

            });
            calendar.render();

        });

    </script>
    <section>
        <div class="container-lg">
            <div class="container">
                <div class="col-md-8 offset-md-2">
                    <div id='calendar'></div>
                </div>
            </div>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="display: none;">
                Launch demo modal
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                                <h1 class="modal-title fs-5 text-center" id="exampleModalLabel">Universidad Autonoma de Baja California</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Inicio del formualrio -->
                            <div class="container text-center">
                                <div class="row">
                                    <div class="col">
                                        <img src="IMG/UABC.png" width="75px" />
                                    </div>
                                    <div class="col-6">
                                        <h5>Facultad de Ciencias Administrativas.</h5>
                                        <h6>Campus Mexicali.</h6>
                                        <p><em><u>Solicitud de prestamo de area y equipo.</u></em></p>
                                    </div>
                                    <div class="col">
                                        <img src="IMG/logo-black.png" width="75px" />
                                    </div>
                                </div>
                            </div>
                            <!-- datos del maestro -->
                            <br />
                            <div class="container">
                                <h6 class="text-center bg-success text-white">-->Datos del docente <-- </h6>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="LblNomDocente" runat="server" Text="Nombre del docente"></asp:Label>
                                        <asp:TextBox ID="TxtNomDocente" runat="server" placeholder="Nombre del docente" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <%-- Solo Acepta Numeros del 0 al 9 y no permite escribir el abecedario o teclas especiales --%>
                                    <div class="col">
                                        <asp:Label ID="LblNumEmpleado" runat="server" Text="Numero de empleado"></asp:Label>
                                        <asp:TextBox ID="TxtNumEmpleado" runat="server" placeholder="Numero de empleado" CssClass="form-control" onkeypress="return allowOnlyNumbers(event);"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <%--Solo Acepta Numeros del 0 al 9 y no permite escribir el abecedario o teclas especiales --%>
                                    <div class="col">
                                        <asp:Label ID="LblTelDocente" runat="server" Text="Telefono"></asp:Label>
                                        <asp:TextBox ID="TxtTelDocente" runat="server" placeholder="Telefono del maestro" CssClass="form-control" onkeypress="return allowOnlyNumbers(event);"></asp:TextBox>
                                    </div>
                                    <%-- Solo puede poner correos y ya esta escrito el termino del correo --%>
                                    <div class="col">
                                        <asp:Label ID="LblMailDocente" runat="server" Text="Correo Insititucional"></asp:Label>
                                        <asp:TextBox ID="TxtMailDocente" runat="server" value="@uabc.edu.mx" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="container">
                                <h6 class="text-center bg-success text-white">-->Datos del Evento <-- </h6>
                                <div class="row">
                                    <asp:Label ID="LblNomEvento" runat="server" Text="Nombre del evento"></asp:Label>
                                    <asp:TextBox ID="TxtNomEvento" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <h6 class="text-center bg-warning text-white">--> Horario del evento <-- </h6>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="LblFechaInicio" runat="server" Text="Fecha Inicio"></asp:Label>
                                        <asp:TextBox ID="TxtFechaSeleccionada" CssClass="form-control" runat="server" TextMode="Date" ToolTip="MM/DD/YYYY" Enabled="true"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="LblHoraInicio" runat="server" Text="Hora inicio"></asp:Label>
                                        <asp:TextBox ID="TxtHoraIncio" CssClass="form-control" runat="server" TextMode="Time"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="LblFechaFin" runat="server" Text="Fecha cierre"></asp:Label>
                                        <asp:TextBox ID="TxtFechaFin" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="LblHoraFin" runat="server" Text="Hora Cierre"></asp:Label>
                                        <asp:TextBox ID="TxtHoraFin" CssClass="form-control" runat="server" TextMode="Time" placeholder="MM/DD/YYYY"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="container">
                                <h6 class="text-center bg-warning text-white">--> Sala a seleccionada <--</h6>
                                <div class="row">
                                    <asp:Label ID="LblSalaSeleccion" runat="server" Text="Sala a resevar"></asp:Label>
                                    <asp:CheckBoxList ID="ChbxSala" CssClass="form-check" runat="server" DataSourceID="DS_Salas" DataTextField="N_Sala" DataValueField="ID_Sala" RepeatDirection="Vertical"></asp:CheckBoxList>
                                    <asp:SqlDataSource ID="DS_Salas" runat="server" ConnectionString="<%$ ConnectionStrings:CS_UABCFCA_SALAS %>" SelectCommand="SELECT * FROM [Cat_Salas]"></asp:SqlDataSource>
                                </div>
                                <div class="row">
                                    <asp:Label ID="LblNotas" runat="server" CssClass="text-center" Text="Notas Adicionales"></asp:Label>
                                    <asp:TextBox ID="TxtNotas" CssClass="form-control" runat="server" Rows="3" TextMode="MultiLine" placeholder="Ej: se requiere de bocinas, manparas, presidum, etc. "></asp:TextBox>
                                </div>
                            </div>
                            <div class="container">
                                <div class="row" style="background-color:darkgray;">
                                    <div class="col text-center">
                                        <p class="text-wrap text-break">
                                            Por medio de este documento, me responsabilizo a pagar en caso de cualquier daño total o parcial a los bienes muebles e inmuebles, asi como el robo o extravio del equipamiento bajo mi cuidado dentro del espacio asignado
                                        </p>
                                    </div>
                                    <asp:TextBox ID="TxtMailConsentimiento" runat="server" placeholder="Ingrese su nombre como confomidad" CssClass="form-control" ></asp:TextBox>
                                    <asp:Button ID="BtnPDF" class="btn btn-primary" runat="server" Text="Imprimir como PDF" OnClientClick ="imprimirPagina()"  />   
                                </div>
                            </div>
                            <!-- fin del formulario -->
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <asp:Button ID="BtnSave" class="btn btn-primary" runat="server" Text="Registrar Evento" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="DS_Evento" runat="server" ConnectionString="<%$ ConnectionStrings:CS_UABCFCA_SALAS %>" SelectCommand="SELECT * FROM [Frm_Eventos]" InsertCommand="INSERT INTO Eventos(N_Docente, N_Empleado, N_Telefono, N_Correo, N_Evento, N_FechaInicio, N_HoraInicio, N_FechaFin, N_HoraFin, Nid_Sala, N_Notas, N_Confirmacion, N_Consentimiento) VALUES (@docente, @empleado, @tel, @mail, @evento, @inicio, @horainicio, @fin, @horafin, @sala, @nota, @estado, @aceptacion)">
            <InsertParameters>
                <asp:ControlParameter ControlID="TxtNomDocente" Name="docente" PropertyName="Text" DefaultValue="" />
                <asp:ControlParameter ControlID="TxtNumEmpleado" Name="empleado" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtTelDocente" Name="tel" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtMailDocente" Name="mail" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtNomEvento" Name="evento" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtFechaSeleccionada" Name="inicio" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtHoraIncio" Name="horainicio" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtFechaFin" Name="fin" PropertyName="Text" />
                <asp:ControlParameter ControlID="TxtHoraFin" Name="horafin" PropertyName="Text" />
                <asp:ControlParameter ControlID="ChbxSala" Name="sala" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="TxtNotas" Name="nota" PropertyName="Text" />
                <asp:Parameter DefaultValue="1" Name="estado" />
                <asp:ControlParameter ControlID="TxtMailConsentimiento" Name="aceptacion" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>

    </section>
</asp:Content>
