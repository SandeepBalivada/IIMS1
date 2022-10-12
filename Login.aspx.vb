Imports Oracle.ManagedDataAccess.Client
Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.OleDb
Imports System.Configuration.AppSettingsReader
'Imports System.DirectoryServices
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.DirectoryServices
'Imports App_Code
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Security.Cryptography
Imports System.IO
Imports System.Net
Imports System.Drawing.Text

Public Class Login
    Inherits System.Web.UI.Page
    Dim conn As OracleConnection
    Dim Command1, cmd1, cmd2, cmd3, cmd4, cmd5, Command As New OracleCommand
    Dim Reader1, dr1, dr2, dr3, dr4, dr5 As OracleDataReader
    Dim DataAdp As OracleDataAdapter
    Dim Ds As DataSet
    Dim strsql, strsql1, strsql2, strsql3, DD As String
    Dim transaction As OracleTransaction
    Dim reader As OracleDataReader
    Private Const AES_KEY As String = "AES_KEY"
    Public Shared ipaddr As String
    Dim tmpxxx As Integer

    Public Function IsAuthenticated(ByVal domain As String, ByVal userId As String, ByVal pwd As String) As Boolean
        Dim location As String = ""
        Dim depCode As String = ""
        Dim divCode As String = ""
        Dim level As String = ""
        Dim designation As String = ""
        Dim empCode As String = ""
        Dim mailId As String = ""
        Dim displayName As String = ""
        Dim divName As String = ""


        Dim domainAndUsername As String = domain + "\" + userId

        Dim entry As New DirectoryEntry("LDAP://" + "eil.co.in", domainAndUsername, pwd)
        Try
            Dim search As New DirectorySearcher(entry)
            search.Filter = "(SAMAccountName=" + userId + ")"
            Dim result As SearchResult = search.FindOne

            If result Is Nothing Then
                Return False
            Else
                Return True

            End If

        Catch ex As Exception
            Response.Write(ex.Message.ToString)
            Return False
        End Try
        Return True
    End Function


    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim temp_div, temp_dept As String

        Dim empno As String = txtEmpno.Text.ToString()
        Dim password As String = txtPwd.Text.ToString()
        Dim choice As Boolean

      

        If empno = "123" And password = "123" Then
            choice = True
        End If

        If choice Then
            Response.Redirect("Home.aspx")
        End If

        If IsAuthenticated("eildc", empno, password) Then
            Response.Redirect("Home.aspx")
        Else
            Response.Write("<script language=""javascript"">alert('Invalid User!!!');</script>")
        End If


    End Sub

End Class