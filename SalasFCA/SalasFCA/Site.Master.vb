Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub ImgBtnCerrarSesion_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnCerrarSesion.Click
        Session.Abandon()
        Session.Remove("rol")
        Response.Redirect("Login.aspx")
    End Sub
End Class