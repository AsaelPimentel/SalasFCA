Public Class Salas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("rol") = Nothing Then
            Response.Redirect("Login.aspx")
        End If
        If Session("rol") = Nothing Then
            Response.Redirect("Login.aspx")
        End If
    End Sub
    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        ' Validar campos antes de realizar la inserción en la base de datos
        If ValidarCampos() Then
            ' Iterar a través de los elementos seleccionados en el CheckBoxList
            For Each item As ListItem In ChbxSala.Items
                If item.Selected Then
                    ' Crear un nuevo registro en la base de datos para cada sala seleccionada
                    DS_Evento.InsertParameters("sala").DefaultValue = item.Value
                    DS_Evento.Insert()
                End If
            Next

            ' Limpiar los campos después de la inserción
            LimpiarCampos()

            ' Mostrar mensaje de éxito
            Dim script As String = "alert('Evento registrado correctamente.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        Else
            ' Mostrar mensaje de error si la validación falla
            Dim script As String = "alert('Por favor, complete todos los campos obligatorios.');"
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        End If
    End Sub

    Private Function ValidarCampos() As Boolean
        ' Verificar que todos los campos obligatorios estén llenos
        If String.IsNullOrEmpty(TxtNomDocente.Text) Or
           String.IsNullOrEmpty(TxtNumEmpleado.Text) Or
           String.IsNullOrEmpty(TxtTelDocente.Text) Or
           String.IsNullOrEmpty(TxtMailDocente.Text) Or
           String.IsNullOrEmpty(TxtNomEvento.Text) Or
           String.IsNullOrEmpty(TxtFechaSeleccionada.Text) Or
           String.IsNullOrEmpty(TxtHoraIncio.Text) Or
           String.IsNullOrEmpty(TxtFechaFin.Text) Or
           String.IsNullOrEmpty(TxtHoraFin.Text) Or
           ChbxSala.SelectedItem Is Nothing Or
           String.IsNullOrEmpty(TxtNotas.Text) Or
           String.IsNullOrEmpty(TxtMailConsentimiento.Text) Then
            Return False
        End If

        Return True
    End Function

    Private Sub LimpiarCampos()
        ' Limpiar el contenido de los campos después de la inserción
        TxtNomDocente.Text = ""
        TxtNumEmpleado.Text = ""
        TxtTelDocente.Text = ""
        TxtMailDocente.Text = ""
        TxtNomEvento.Text = ""
        TxtFechaSeleccionada.Text = ""
        TxtHoraIncio.Text = ""
        TxtFechaFin.Text = ""
        TxtHoraFin.Text = ""
        For Each item As ListItem In ChbxSala.Items
            item.Selected = False
        Next
        TxtNotas.Text = ""
        TxtMailConsentimiento.Text = ""
    End Sub

End Class