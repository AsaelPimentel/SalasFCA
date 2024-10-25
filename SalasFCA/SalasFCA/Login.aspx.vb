Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnIniciarSesion_Click(sender As Object, e As EventArgs) Handles btnIniciarSesion.Click
        If txtUsuario.Text = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showAlert('Por favor ingrese su usuario');", True)
            txtUsuario.Focus()
        ElseIf txtContrasena.Text = "" Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showAlert('Por favor ingrese su contraseña');", True)
            txtContrasena.Focus()
        Else
            Dim dv As DataView = DirectCast(DS_Login.Select(DataSourceSelectArguments.Empty), DataView)
            If dv IsNot Nothing And dv.Count <> 0 Then
                Session("rol") = "1"
                Response.Redirect("Default.aspx")
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showAlert", "showAlert('El usuario y/o contraseña incorrectos.');", True)
            End If
        End If
    End Sub
End Class