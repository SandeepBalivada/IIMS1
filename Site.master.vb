Imports System
Imports System.Collections.Generic
Imports System.Security.Claims
Imports System.Security.Principal
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class Site_Master
    Inherits MasterPage

    Private Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
    Private Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
    Private _antiXsrfTokenValue As String

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
        Dim requestCookie = Request.Cookies(AntiXsrfTokenKey)
        Dim requestCookieGuidValue As Guid

        If requestCookie IsNot Nothing AndAlso System.Guid.TryParse(requestCookie.Value, requestCookieGuidValue) Then
            _antiXsrfTokenValue = requestCookie.Value
            Page.ViewStateUserKey = _antiXsrfTokenValue
        Else
            _antiXsrfTokenValue = System.Guid.NewGuid().ToString("N")
            Page.ViewStateUserKey = _antiXsrfTokenValue
            Dim responseCookie = New HttpCookie(AntiXsrfTokenKey) With {
                .HttpOnly = True,
                .Value = _antiXsrfTokenValue
            }


            If FormsAuthentication.RequireSSL AndAlso Request.IsSecureConnection Then
                responseCookie.Secure = True
            End If

            Response.Cookies.[Set](responseCookie)
        End If

        AddHandler Page.PreLoad, AddressOf master_Page_PreLoad
    End Sub

    Protected Sub master_Page_PreLoad(ByVal sender As Object, ByVal e As EventArgs)
        'If Not IsPostBack Then
        '    ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey
        '    ViewState(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, String.Empty)
        'Else

        '    If CStr(ViewState(AntiXsrfTokenKey)) <> _antiXsrfTokenValue OrElse CStr(ViewState(AntiXsrfUserNameKey)) <> (If(Context.User.Identity.Name, String.Empty)) Then
        '        Throw New InvalidOperationException("Validation of Anti-XSRF token failed.")
        '    End If
        'End If

        If Not IsPostBack Then
            Session("AntiXsrfTokenKey") = Page.ViewStateUserKey
            Session("AntiXsrfUserNameKey") = If(Context.User.Identity.Name, String.Empty)
        Else

            If CStr(Session("AntiXsrfTokenKey")) <> _antiXsrfTokenValue OrElse CStr(Session("AntiXsrfUserNameKey")) <> (If(Context.User.Identity.Name, String.Empty)) Then
                Throw New InvalidOperationException("Validation of Anti-XSRF token failed.")
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        
        If Session("USER_NAME") IsNot Nothing Then
            lblWelcome.Text = "Welcome : "
            lblName.Text = Session("USER_NAME").ToString() & "<br />" & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[" & Session("ROLE").ToString() & "]"
        End If

        If Session("JobNo") IsNot Nothing Then
            lblJobNo.Visible = True
            lblJobNo.InnerText = "Job No:"
            jobno.Visible = True
            jobno.InnerText = Session("JobNo")
        Else
            lblJobNo.Visible = False
            jobno.Visible = False
            lblJobNo.InnerText = ""
        End If

        bindLinks()

        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache)
        HttpContext.Current.Response.Cache.AppendCacheExtension("no-store, must-revalidate,private,proxy-revalidate")
        HttpContext.Current.Response.AppendHeader("Pragma", "no-cache")
        HttpContext.Current.Response.AppendHeader("Expires", "0")

        If Session("USER_ID") IsNot Nothing AndAlso Session("AuthToken") IsNot Nothing AndAlso Request.Cookies("AuthToken") IsNot Nothing Then
            If Session("AuthToken").ToString <> Request.Cookies("AuthToken").Value Then
                Response.Redirect("~/Login.aspx")
            End If
        Else
            Response.Redirect("~/Login.aspx")
        End If

        RefreshAuthToken()

        Dim value As String = Convert.ToBase64String(MachineKey.Protect(System.Text.Encoding.UTF8.GetBytes(Session("USER_ID").ToString()), "EIL Authentication Token"))

        Dim myEilCookie As HttpCookie = New HttpCookie("myEilCookie")
        myEilCookie.Value = value
        myEilCookie.Domain = ".eil.co.in"
        myEilCookie.Expires = DateTime.Now.AddHours(8)
        Response.Cookies.Remove("myEilCookie")
        Response.Cookies.Add(myEilCookie)

    End Sub
    Private Sub RefreshAuthToken()
        Dim gu_id As String = Guid.NewGuid().ToString()
        Session("AuthToken") = gu_id
        'Request.Cookies.Add(New HttpCookie("AuthToken", gu_id))
        Response.Cookies("AuthToken").Value = gu_id
    End Sub

    Public Sub bindLinks()
        mySidebar.Visible = False
        divLogout.Visible = False

        If Session("USER_ID") IsNot Nothing AndAlso Session("ROLE_ID") IsNot Nothing Then
            'sidebar_visible.Visible = True
            divLogout.Visible = True
            mySidebar.Visible = True
        Else
            'sidebar_visible.Visible = False
            divLogout.Visible = False
            mySidebar.Visible = False
        End If
    End Sub

    Protected Sub LogOut(ByVal sender As Object, ByVal e As EventArgs)
        Response.Redirect("~/Logout.aspx")
    End Sub
End Class
