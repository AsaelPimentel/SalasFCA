<%@ Page Title="Inicio" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="SalasFCA._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- estilos css -->
    <style>
        .GridViewHeader {
            background-color: #00723F;
            color: white; /* Color del texto en los encabezados */
            font-weight: bold; /* Texto en negritas */
        }

        /* Estilo para el contenido de la GridView */
        .GridViewContent {
            background-color: #DD971A;
            color: white; /* Color del texto en el contenido */
        }

        /* Estilo para las filas pares de la GridView (opcional) */
        .GridViewRowEven {
            background-color: #DD971A;
        }
    </style>
    <!-- carrusel de imagenes de las salas -->
    <section>
        <main>
<%--            <div class="container bg-success">
                <div class="flex-md-row">
                    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-bs-interval="10000">
                                <img src="IMG/Salas/SalaAulaMagna.jpg" class="d-block mx-auto" style="max-width: 100%; max-height: 400px; height: auto;" />
                            </div>
                            <div class="carousel-item" data-bs-interval="2000">
                                <img src="IMG/Salas/SalaAudiovisual.jpg" class="d-block mx-auto" style="max-width: 100%; max-height: 400px; height: auto;" />
                            </div>
                            <div class="carousel-item">
                                <img src="IMG/Salas/SalaExplanada.jpg" class="d-block mx-auto" style="max-width: 100%; max-height: 400px; height: auto;" />
                            </div>
                            <div class="carousel-item">
                                <img src="IMG/Salas/SalaPergola.jpg" class="d-block mx-auto" style="max-width: 100%; max-height: 400px; height: auto;" />
                            </div>
                            <div class="carousel-item">
                                <img src="IMG/Salas/SalaSia104.png" class="d-block mx-auto" style="max-width: 100%; max-height: 400px; height: auto;" />
                            </div>
                            <div class="carousel-item">
                                <img src="IMG/Salas/SalaSia3erPiso.jpg" class="d-block mx-auto" style="max-width: 100%; max-height: 400px; height: auto;" />
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>--%>
        </main>
    </section>
    <br />
    <main>
        <h2>
            <center>
                Eventos del dia
            </center>
        </h2>
        <!-- lista de evento del dia en forma de to do list -->
        <!-- Formato de la tabla para mostrar los eventos -->
        <asp:Label ID="LblNoEventos" runat="server" Text="No hay eventos asignados para hoy." Visible="False"></asp:Label>

        <asp:GridView ID="GVListEvents" runat="server" DataSourceID="DS_ListaEventos" AutoGenerateColumns="False" CssClass="text-center" Width="100%">
            <Columns>
                <asp:BoundField DataField="N_Docente" HeaderText="Nombre del Docente" SortExpression="N_Docente" ItemStyle-CssClass="GridViewContent" />
                <asp:BoundField DataField="N_Correo" HeaderText="Correo del Docente" SortExpression="N_Correo" ItemStyle-CssClass="GridViewContent" />
                <asp:BoundField DataField="N_Evento" HeaderText="Nombre del Evento" SortExpression="N_Evento" ItemStyle-CssClass="GridViewContent" />
                <asp:BoundField DataField="N_FechaInicio" HeaderText="Fecha de inicio" SortExpression="N_FechaInicio" DataFormatString="{0:MM/dd/yyyy}" ItemStyle-CssClass="GridViewContent" />
                <asp:BoundField DataField="N_HoraInicio" HeaderText="Hora de inicio" SortExpression="N_HoraInicio" ItemStyle-CssClass="GridViewContent" />
                <asp:BoundField DataField="N_FechaFin" HeaderText="Fecha de fin" SortExpression="N_FechaFin" DataFormatString="{0:MM/dd/yyyy}" ItemStyle-CssClass="GridViewContent" />
                <asp:BoundField DataField="N_HoraFin" HeaderText="Hora de fin" SortExpression="N_HoraFin" ItemStyle-CssClass="GridViewContent" />
                <asp:BoundField DataField="N_Sala" HeaderText="Sala" SortExpression="N_Sala" ItemStyle-CssClass="GridViewContent" />
                <asp:BoundField DataField="Expr1" HeaderText="Estado de la reserva" SortExpression="Expr1" ItemStyle-CssClass="GridViewContent" />
            </Columns>
            <HeaderStyle CssClass="GridViewHeader" />
            <AlternatingRowStyle CssClass="GridViewRowEven" />
        </asp:GridView>
        <!-- consulta para los parametros -->
        <asp:SqlDataSource ID="DS_ListaEventos" runat="server" ConnectionString="<%$ ConnectionStrings:CS_UABCFCA_SALAS %>" 
    SelectCommand="SELECT Eventos.ID_Evento, Eventos.N_Docente, Eventos.N_Empleado, Eventos.N_Telefono, Eventos.N_Correo, Eventos.N_Evento, Eventos.N_FechaInicio, Eventos.N_HoraInicio, Eventos.N_FechaFin, Eventos.N_HoraFin, Eventos.Nid_Sala, Cat_Salas.N_Sala, Eventos.N_Notas, Eventos.N_Consentimiento, Eventos.N_Confirmacion, Cat_Confirmaciones.N_Confirmacion AS Expr1 FROM Eventos INNER JOIN Cat_Confirmaciones ON Eventos.N_Confirmacion = Cat_Confirmaciones.Nid_Confirmacion INNER JOIN Cat_Salas ON Eventos.Nid_Sala = Cat_Salas.ID_Sala WHERE (CAST(Eventos.N_FechaInicio AS DATE) = CAST(GETDATE() AS DATE))">
    <SelectParameters>
        <asp:Parameter Name="N_FechaInicio" Type="DateTime" />
        <asp:Parameter Name="N_FechaFin" Type="DateTime" />
    </SelectParameters>
</asp:SqlDataSource>
    </main>

</asp:Content>
