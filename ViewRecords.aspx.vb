Imports Oracle.ManagedDataAccess.Client
Imports System.Data
'Imports System.Data.OleDb
Imports System.IO
Imports System.Configuration.AppSettingsReader
Imports System.Text
Imports System.Collections
Imports System.Diagnostics.Debug
Imports System.Collections.ObjectModel
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Threading
Imports System.ComponentModel
Imports Microsoft.VisualBasic
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Security.Cryptography
Imports System.Drawing.Text

Public Class ViewRecords
    'Inherits System.Web.UI.UserControl
    Inherits System.Web.UI.Page
    Dim Conn As OracleConnection
    Dim cmd4, Command As New OracleCommand
    Dim transaction As OracleTransaction
    Dim dr4, Reader As OracleDataReader
    Dim DataAdp As OracleDataAdapter
    Dim DataSet As DataSet
    Dim strsql1, strsql As String
    Dim dt As String = System.DateTime.Now
    Dim dts As String = Date.Today

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        Conn = New OracleConnection(System.Configuration.ConfigurationManager.AppSettings("strConn"))
        If Conn.State = ConnectionState.Closed Then Conn.Open()
            strsql = "SELECT * from IIMSRECORDS"
            Command = New OracleCommand(strsql, Conn)
        'Conn.Open()
            Command.Connection = Conn
            Reader = Command.ExecuteReader
            Reader.Read()
            If Reader.HasRows() Then
                DataSet = New DataSet("IIMSRECORDS")
                DataAdp = New OracleDataAdapter(strsql, Conn)
                DataAdp.Fill(DataSet, "IIMSRECORDS")
                GridView1.DataSource = DataSet
            End If

            GridView1.DataBind()
        Conn.Close()

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub
End Class
