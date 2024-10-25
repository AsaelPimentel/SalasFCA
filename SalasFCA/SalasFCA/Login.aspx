<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="SalasFCA.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="CSS/Estilos.css" rel="stylesheet" />
    <script src="JS/Funciones.js"></script>
    <title>Salas FCA | Iniciar Sesión</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="login-form">
                <img src="IMG/LogoInstitucional2.png" alt="Imagen de inicio de sesión" class="login-image" />
                <h1>Iniciar Sesión</h1>
                <div class="form-group">
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" AssociatedControlID="txtUsuario" />
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="textbox" placeholder="@uabc.edu.mx"/>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblContrasena" runat="server" Text="Contraseña:" AssociatedControlID="txtContrasena" />
                    <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="textbox" placeholder="Contraseña"/>
                </div>
                <asp:Button ID="btnIniciarSesion" runat="server" Text="Iniciar Sesión" CssClass="button" />
            </div>
        </div>

        <asp:SqlDataSource ID="DS_Login" runat="server" ConnectionString="<%$ ConnectionStrings:CS_UABCFCA_MASTER %>" ProviderName="<%$ ConnectionStrings:CS_UABCFCA_MASTER.ProviderName %>" SelectCommand="SELECT * FROM [usuarios] WHERE (([usuario] = @usuario) AND ([password] = @password))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtUsuario" Name="usuario" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtContrasena" Name="password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <!-- modal de alerta -->
        <div class="modal-container" id="customModal">
            <div class="modal-content">
                <img src="IMG/alerta.gif" width="100px" height="75px" />
                <h2>¡Alerta!</h2>
                <p id="modalMessage"></p>
                <button class="modal-button" onclick="closeModal()">Aceptar</button>
            </div>
        </div>
    </form>
</body>
</html>
