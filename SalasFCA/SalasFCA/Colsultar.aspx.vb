Public Class Contact
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("rol") = Nothing Then
            Response.Redirect("Login.aspx")
        End If
        If Session("rol") = Nothing Then
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub GvEventos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GvEventos.SelectedIndexChanged
        Dim selectedRow As GridViewRow = GvEventos.SelectedRow
        Dim eventoID As String = GvEventos.DataKeys(selectedRow.RowIndex).Value.ToString()

        DS_EditarEvento.SelectParameters("evento").DefaultValue = eventoID
        Dim dv As DataView = DirectCast(DS_EditarEvento.Select(DataSourceSelectArguments.Empty), DataView)
        If dv IsNot Nothing AndAlso dv.Count <> 0 Then
            Folio.Text = dv.Table.Rows(0)(0).ToString()
            TxtDocente.Text = dv.Table.Rows(0)(1).ToString()
            TxtEmpleado.Text = dv.Table.Rows(0)(2).ToString()
            TxtTelDocente.Text = dv.Table.Rows(0)(3).ToString()
            TxtMailDocente.Text = dv.Table.Rows(0)(4).ToString()
            TxtEvento.Text = dv.Table.Rows(0)(5).ToString()
            TxtFechaInicio.Text = Convert.ToDateTime(dv.Table.Rows(0)(6)).ToString("yyyy-MM-dd")
            TxtHoraIncio.Text = TimeSpan.Parse(dv.Table.Rows(0)(7).ToString()).ToString("hh\:mm\:ss")
            TxtFechaFin.Text = Convert.ToDateTime(dv.Table.Rows(0)(8)).ToString("yyyy-MM-dd")
            TxtHoraFin.Text = TimeSpan.Parse(dv.Table.Rows(0)(9).ToString()).ToString("hh\:mm\:ss")
            DdlSala.SelectedValue = dv.Table.Rows(0)(10).ToString()
            TxtNotas.Text = dv.Table.Rows(0)(11).ToString()
            TxtConsentimiento.Text = dv.Table.Rows(0)(12).ToString
            DdlConfirmacion.SelectedValue = dv.Table.Rows(0)(13).ToString()
        End If
        PnlEventos.Visible = True
    End Sub


    Protected Sub BtnCancelar_Click(sender As Object, e As EventArgs) Handles BtnCancelar.Click
        PnlEventos.Visible = False
        Folio.Text = ""
        TxtDocente.Text = ""
        TxtEmpleado.Text = ""
        TxtTelDocente.Text = ""
        TxtMailDocente.Text = ""
        TxtEvento.Text = ""
        TxtFechaInicio.Text = ""
        TxtHoraIncio.Text = ""
        TxtFechaFin.Text = ""
        TxtHoraFin.Text = ""
        DdlSala.ClearSelection()
        TxtNotas.Text = ""
        TxtConsentimiento.Text = ""
        DdlConfirmacion.ClearSelection()
    End Sub

    Protected Sub BtnModificar_Click(sender As Object, e As EventArgs) Handles BtnModificar.Click
        DS_ActualizarEvento.Update()
        Dim script As String = "alert('Evento modificado correctamente.');"
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "alert", script, True)
        ' Redirigir después del mensaje si es necesario
        Response.AddHeader("REFRESH", "0;URL=" + Request.RawUrl)
    End Sub
    Protected Sub DdlEstadoFiltro_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlEstadoFiltro.SelectedIndexChanged
        ' Obtener el valor seleccionado del DropDownList
        Dim estadoSeleccionado As String = DdlEstadoFiltro.SelectedValue

        ' Definir la consulta SQL base
        Dim consultaSql As String = "SELECT Eventos.ID_Evento, Eventos.N_Docente, Eventos.N_Empleado, Eventos.N_Telefono, Eventos.N_Correo, Eventos.N_Evento, Eventos.N_FechaInicio, Eventos.N_HoraInicio, Eventos.N_FechaFin, Eventos.N_HoraFin, Eventos.Nid_Sala, Cat_Salas.N_Sala, Eventos.N_Notas, Eventos.N_Consentimiento, Eventos.N_Confirmacion, Cat_Confirmaciones.N_Confirmacion AS Expr1 FROM Eventos INNER JOIN Cat_Confirmaciones ON Eventos.N_Confirmacion = Cat_Confirmaciones.Nid_Confirmacion INNER JOIN Cat_Salas ON Eventos.Nid_Sala = Cat_Salas.ID_Sala"

        ' Aplicar filtro según el estado seleccionado
        If Not String.IsNullOrEmpty(estadoSeleccionado) Then
            consultaSql &= " WHERE Eventos.N_Confirmacion = @estadoSeleccionado"
        End If

        ' Asignar la consulta SQL al SqlDataSource
        DS_Evento.SelectCommand = consultaSql

        ' Asignar el valor del parámetro (si es necesario)
        If Not String.IsNullOrEmpty(estadoSeleccionado) Then
            DS_Evento.SelectParameters.Clear()
            DS_Evento.SelectParameters.Add("estadoSeleccionado", estadoSeleccionado)
        End If

        ' Actualizar la GridView
        GvEventos.DataBind()
    End Sub

    Protected Sub BtnLimpiarFiltro_Click(sender As Object, e As EventArgs) Handles BtnLimpiarFiltro.Click
        ' Restablecer la consulta SQL original sin filtros
        DS_Evento.SelectCommand = "SELECT Eventos.ID_Evento, Eventos.N_Docente, Eventos.N_Empleado, Eventos.N_Telefono, Eventos.N_Correo, Eventos.N_Evento, Eventos.N_FechaInicio, Eventos.N_HoraInicio, Eventos.N_FechaFin, Eventos.N_HoraFin, Eventos.Nid_Sala, Cat_Salas.N_Sala, Eventos.N_Notas, Eventos.N_Consentimiento, Eventos.N_Confirmacion, Cat_Confirmaciones.N_Confirmacion AS Expr1 FROM Eventos INNER JOIN Cat_Confirmaciones ON Eventos.N_Confirmacion = Cat_Confirmaciones.Nid_Confirmacion INNER JOIN Cat_Salas ON Eventos.Nid_Sala = Cat_Salas.ID_Sala"

        ' Limpiar los parámetros
        DS_Evento.SelectParameters.Clear()

        ' Actualizar la GridView
        GvEventos.DataBind()
    End Sub

End Class