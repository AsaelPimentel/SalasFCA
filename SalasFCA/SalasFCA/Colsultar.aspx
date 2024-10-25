<%@ Page Title="Editar Eventos" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Colsultar.aspx.vb" Inherits="SalasFCA.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- estilos de gridview -->
    <style>
        hr {
            border-color: #DD971A;
        }
        /* Estilo para filas seleccionadas */
        .GridViewSelectedRow {
            background-color: #00552E; /* Un tono más oscuro del color de encabezado */
            color: white;
        }

        /* Estilo para la paginación */
        .GridViewPager {
            background-color: #00723F;
            color: white;
        }

            /* Estilo para el enlace de página activa en la paginación */
            .GridViewPager a:link, .GridViewPager a:visited {
                color: white;
            }

            /* Estilo para el enlace de página no activa en la paginación */
            .GridViewPager a:hover {
                color: #DD971A; /* Un tono del color de contenido */
            }

        #PnlFormEvento {
            margin-top: 20px; /* Agrega margen superior para separar el panel de la gridview */
        }

        #GVEventos {
            margin-bottom: 20px; /* Agrega margen inferior para separar la gridview del panel */
        }
    </style>

    <main>
        <section>
            <div class="container text-center">
                <h4>Consultar eventos - modificar eventos</h4>
            </div>
        </section>
        <hr />
        <section class="col-md-6 offset-md-5">
            <asp:DropDownList ID="DdlEstadoFiltro" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="DdlEstadoFiltro_SelectedIndexChanged">
                <asp:ListItem Text="Todos" Value="" />
                <asp:ListItem Text="Pendiente" Value="1" />
                <asp:ListItem Text="Confirmado" Value="2" />
                <asp:ListItem Text="Cancelado" Value="3" />
            </asp:DropDownList>
            <div class="container offset-md-1">
            <asp:Button ID="BtnLimpiarFiltro" runat="server" Text="Limpiar Filtro" CssClass="btn btn-secondary" OnClick="BtnLimpiarFiltro_Click" />
            </div>
        </section>
        <br />
        <section class="">
            <asp:SqlDataSource ID="DS_EditarEvento" runat="server" ConnectionString="<%$ ConnectionStrings:CS_UABCFCA_SALAS %>" SelectCommand="SELECT [ID_Evento], [N_Docente], [N_Empleado], [N_Telefono], [N_Correo], [N_Evento], [N_FechaInicio], [N_HoraInicio], [N_FechaFin], [N_HoraFin], [Nid_Sala], [N_Notas], [N_Consentimiento], [N_Confirmacion] FROM [Eventos] WHERE (ID_Evento = @evento)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Folio" Name="evento" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GvEventos" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_Evento" DataSourceID="DS_Evento" OnSelectedIndexChanged="GvEventos_SelectedIndexChanged" CssClass="text-center table table-hover table-responsive" Width="100%">
                <SelectedRowStyle CssClass="GridViewSelectedRow" BackColor="#00552E" ForeColor="white" />
                <PagerStyle CssClass="GridViewPager" BackColor="#00723F" ForeColor="white" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="N_Docente" HeaderText="Docente" SortExpression="N_Docente" />
                    <asp:BoundField DataField="N_Empleado" HeaderText="Numero de Empleado" SortExpression="N_Empleado" />
                    <asp:BoundField DataField="N_Telefono" HeaderText="Telefono" SortExpression="N_Telefono" />
                    <asp:BoundField DataField="N_Evento" HeaderText="Evento" SortExpression="N_Evento" />
                    <asp:BoundField DataField="N_FechaInicio" HeaderText="Fecha de Inicio" SortExpression="N_FechaInicio" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="N_HoraInicio" HeaderText="Hora de Inicio" SortExpression="N_HoraInicio" />
                    <asp:BoundField DataField="N_FechaFin" HeaderText="Fecha de Fin" SortExpression="N_FechaFin" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="N_HoraFin" HeaderText="Hora de Fin" SortExpression="N_HoraFin" />
                    <asp:BoundField DataField="N_Sala" HeaderText="Sala" SortExpression="N_Sala" />
                    <asp:BoundField DataField="N_Notas" HeaderText="Notas" SortExpression="N_Notas" />
                    <asp:BoundField DataField="N_Consentimiento" HeaderText="Consentimiento" SortExpression="N_Consentimiento" />
                    <asp:BoundField DataField="Expr1" HeaderText="Confirmacion" SortExpression="Expr1" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeader" BackColor="#00723F" ForeColor="white" Font-Bold="True" />
                <RowStyle CssClass="GridViewContent" BackColor="#DD971A" ForeColor="white" />
                <AlternatingRowStyle CssClass="GridViewRowEven" BackColor="#DD971A" />
            </asp:GridView>
            <asp:SqlDataSource ID="DS_Evento" runat="server" ConnectionString="<%$ ConnectionStrings:CS_UABCFCA_SALAS %>" SelectCommand="SELECT Eventos.ID_Evento, Eventos.N_Docente, Eventos.N_Empleado, Eventos.N_Telefono, Eventos.N_Correo, Eventos.N_Evento, Eventos.N_FechaInicio, Eventos.N_HoraInicio, Eventos.N_FechaFin, Eventos.N_HoraFin, Eventos.Nid_Sala, Cat_Salas.N_Sala, Eventos.N_Notas, Eventos.N_Consentimiento, Eventos.N_Confirmacion, Cat_Confirmaciones.N_Confirmacion AS Expr1 FROM Eventos INNER JOIN Cat_Confirmaciones ON Eventos.N_Confirmacion = Cat_Confirmaciones.Nid_Confirmacion INNER JOIN Cat_Salas ON Eventos.Nid_Sala = Cat_Salas.ID_Sala"></asp:SqlDataSource>
        </section>

        <div class="container text-center d-flex justify-content-center col-10">
            <asp:Panel ID="PnlEventos" runat="server" Height="400px" Visible="false" ScrollBars="Vertical" CssClass="mx-auto my-5">
                <div class="container">
                    <!-- encabezado -->
                    <div class="container text-center ">
                        <div class="row">
                            <div class="col">
                                <img src="IMG/UABC.png" width="75px" />
                            </div>
                            <div class="col-6 text-center">
                                <h5>Facultad de Ciencias Administrativas.</h5>
                                <h6>Campus Mexicali.</h6>
                                <p><em><u>Solicitud de prestamo de area y equipo.</u></em></p>
                            </div>
                            <div class="col">
                                <img src="IMG/logo-black.png" width="75px" />
                            </div>
                        </div>
                    </div>
                    <br />
                    <!-- Folio o id del evento -->
                    <asp:Label ID="Folio" runat="server" Text="" Visible="false"></asp:Label>
                    <!-- datos del docente -->
                    <div class="container">
                        <h5 class="text-center bg-success">--> Datos del docente <-- </h5>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="LblDocente" runat="server" Text="Nombre del docente" CssClass="text-center"></asp:Label>
                                <asp:TextBox ID="TxtDocente" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <asp:Label ID="LblEmpleado" runat="server" Text="Numero de empleado" CssClass="text-center"></asp:Label>
                                <asp:TextBox ID="TxtEmpleado" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="LblTelDocente" runat="server" Text="Telefono" CssClass="text-center"></asp:Label>
                                <asp:TextBox ID="TxtTelDocente" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            </div>
                            <div class="col">
                                <asp:Label ID="LblMailDocente" runat="server" Text="Correo Institucional" CssClass="text-center"></asp:Label>
                                <asp:TextBox ID="TxtMailDocente" runat="server" CssClass="form-control" placeholder="@uabc.edu.mx" TextMode="Email"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <!-- Datos del evento -->
                    <div class="container">
                        <h5 class="text-center bg-success">--> Datos del Evento <-- </h5>
                        <div class="row">
                            <asp:Label ID="LblEvento" runat="server" Text="Nombre del evento" CssClass="text-center"></asp:Label>
                            <asp:TextBox ID="TxtEvento" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <h5 class="text-center bg-success">--> Horario del evento <-- </h5>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="LblFechaInicio" runat="server" Text="Fecha De inicio" CssClass="text-center"></asp:Label>
                                <asp:TextBox ID="TxtFechaInicio" runat="server" CssClass="form-control" TextMode="Date" EnableTheming="True"></asp:TextBox>
                            </div>
                            <div class="col">
                                <asp:Label ID="LblHoraIncio" runat="server" Text="Hora de apertura" CssClass="text-center"></asp:Label>
                                <asp:TextBox ID="TxtHoraIncio" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="LblFechaFin" runat="server" Text="Fecha de fin" CssClass="text-center"></asp:Label>
                                <asp:TextBox ID="TxtFechaFin" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="col">
                                <asp:Label ID="LblHoraFin" runat="server" Text="Hora de cierre" CssClass="text-center"></asp:Label>
                                <asp:TextBox ID="TxtHoraFin" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!-- Datos de la sala y notas y confirmacion -->
                    <div class="container">
                        <h5 class="text-center bg-warning">--> Sala seleccionada <--</h5>
                        <div class="row">
                            <asp:Label ID="LblSala" runat="server" Text="Sala" CssClass="text-center"></asp:Label>
                            <asp:DropDownList ID="DdlSala" runat="server" CssClass="form-select" DataSourceID="DS_Salas" DataTextField="N_Sala" DataValueField="ID_Sala"></asp:DropDownList>
                            <asp:SqlDataSource ID="DS_Salas" runat="server" ConnectionString="<%$ ConnectionStrings:CS_UABCFCA_SALAS %>" SelectCommand="SELECT * FROM [Cat_Salas]"></asp:SqlDataSource>
                        </div>
                        <div class="row">
                            <asp:Label ID="LblNotas" runat="server" Text="Notas" CssClass="text-center"></asp:Label>
                            <asp:TextBox ID="TxtNotas" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                        </div>
                        <div class="row">
                            <div class="col" style="background-color: #DD971A;">
                                <p class="text-center text-break text-white">
                                    Por medio de este documento, me resposabilizo a pagar en caso de cualquier daño total o parcial a los bienes muebles e inmuebles, 
                                        asi como del robo o extravio del equipamiento bajo mi cuidado dentro del espacio
                                </p>
                            </div>
                            <asp:TextBox ID="TxtConsentimiento" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="row">
                            <asp:Label ID="LblConfirmacion" runat="server" Text="Estado de la reservacion" CssClass="text-center"></asp:Label>
                            <asp:DropDownList ID="DdlConfirmacion" runat="server" CssClass="form-select" DataSourceID="DS_Estado" DataTextField="N_Confirmacion" DataValueField="Nid_Confirmacion"></asp:DropDownList>
                            <asp:SqlDataSource ID="DS_Estado" runat="server" ConnectionString="<%$ ConnectionStrings:CS_UABCFCA_SALAS %>" SelectCommand="SELECT * FROM [Cat_Confirmaciones]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <br />
                <!-- Botones -->
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <div class="form-group">
                                <asp:Button ID="BtnCancelar" runat="server" Text="Cerrar" CssClass="btn btn-outline-info" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="BtnModificar" runat="server" Text="Modificar" CssClass="btn btn-warning" />
                                <asp:SqlDataSource ID="DS_ActualizarEvento" runat="server" ConnectionString="<%$ ConnectionStrings:CS_UABCFCA_SALAS %>" SelectCommand="SELECT * FROM [Eventos]" UpdateCommand="UPDATE Eventos SET N_Docente = @doc, N_Empleado = @emp, N_Telefono = @tel, N_Correo = @core, N_Evento = @even, N_FechaInicio = @fchin, N_HoraInicio = @hrin, N_FechaFin = @fchfin, N_HoraFin = @hrfin, Nid_Sala = @sala, N_Notas = @notas, N_Consentimiento = @conse, N_Confirmacion = @conf WHERE (ID_Evento = @id)">
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="TxtDocente" Name="doc" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtEmpleado" Name="emp" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtTelDocente" Name="tel" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtMailDocente" Name="core" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtEvento" Name="even" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtFechaInicio" Name="fchin" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtHoraIncio" Name="hrin" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtFechaFin" Name="fchfin" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtHoraFin" Name="hrfin" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="DdlSala" Name="sala" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="TxtNotas" Name="notas" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="TxtConsentimiento" Name="conse" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="DdlConfirmacion" Name="conf" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="Folio" Name="id" PropertyName="Text" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </main>

</asp:Content>
