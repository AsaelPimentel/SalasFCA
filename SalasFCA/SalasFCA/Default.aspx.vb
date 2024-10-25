Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim FechaActual As Date = DateTime.Now
            DS_ListaEventos.SelectParameters("N_FechaInicio").DefaultValue = FechaActual
            DS_ListaEventos.SelectParameters("N_FechaFin").DefaultValue = FechaActual
            GVListEvents.DataBind()
        End If
        If Session("rol") = Nothing Then
            Response.Redirect("Login.aspx")
        End If
        If Session("rol") = Nothing Then
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub GVListEvents_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVListEvents.SelectedIndexChanged
        GVListEvents.DataBind()

        If GVListEvents.Rows.Count = 0 Then
            LblNoEventos.Visible = True
        Else
            LblNoEventos.Visible = False
        End If
    End Sub
End Class