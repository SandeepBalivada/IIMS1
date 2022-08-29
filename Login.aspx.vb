Imports Oracle.ManagedDataAccess.Client
Imports System.Data
Imports System.Data.OleDb
Imports System.Configuration.AppSettingsReader
'Imports System.DirectoryServices
Imports System.Drawing
Imports System.Drawing.Imaging
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
End Class