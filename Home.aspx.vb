Imports Microsoft.VisualBasic
Imports Oracle.ManagedDataAccess.Client
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
Imports System.Data


Public Class Home
    Inherits System.Web.UI.Page

    Dim Conn As New OracleConnection
    Dim cmd4, Command As New OracleCommand
    Dim transaction As OracleTransaction
    Dim dr4, Reader As OracleDataReader
    Dim DataAdp As OracleDataAdapter
    Dim DataSet As DataSet
    Dim strsql1, strsql As String


    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim temp_div, temp_dept As String

        Dim eventDate As String = txtDate.Text.Trim.ToString()
        Dim systemName As String = txtSystemName.Text.Trim.ToString()
        Dim details As String = txtDetails.Text.Trim.ToString()
        Dim impact As String = txtImpact.Text.Trim.ToString()
        Dim actionTaken As String = txtActionTaken.Text.Trim.ToString()
        Dim actionTakenBy As String = txtActionTakenBy.Text.Trim.ToString()

        Dim choice As Boolean

        Conn = New OracleConnection(System.Configuration.ConfigurationManager.AppSettings("strConn"))
        If Conn.State = ConnectionState.Closed Then Conn.Open()
        transaction = Conn.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            Command.Connection = Conn
            Command.Transaction = transaction
            'Command.CommandText = "INSERT INTO IIMSRECORDS(SYS_NAME,DETAILS,IMPACT,ACTION_TAKEN,ACTION_TAKEN_BY)VALUES('" & txtSystemName.Text.Trim & "','" & txtDetails.Text.Trim & "','" & txtImpact.Text.Trim & "','" & txtActionTaken.Text.Trim & "','" & txtActionTakenBy.Text & "')"
            'Command.CommandText = "INSERT INTO IIMSRECORDS(INCDATE,SYS_NAME,DETAILS,IMPACT,ACTION_TAKEN,ACTION_TAKEN_BY)VALUES(TO_DATE('" & eventDate & "','dd-mm-yyyy')," & systemName & "','" & details & "','" & impact & "','" & actionTaken & "','" & actionTakenBy & "')"
            'Command.CommandText = "insert into iimsRecords (INCDATE,SYS_NAME,DETAILS,IMPACT,ACTION_TAKEN,ACTION_TAKEN_BY) values (to_date(' " & eventDate & " ','yyyy-mm-dd'), 'Tenders Server','Tenders application stopped working', 'Login problem', 'FIPS complaint option has been enabled for VAPT-disabled','Sandeep')"
            Command.CommandText = "insert into iimsRecords (INCDATE,SYS_NAME,DETAILS,IMPACT,ACTION_TAKEN,ACTION_TAKEN_BY) values (to_date(' " & eventDate & " ','yyyy-mm-dd'), ' " & systemName & " ',' " & details & "','" & impact & "','" & actionTaken & "','" & actionTakenBy & "')"

            Command.ExecuteNonQuery()
            transaction.Commit()
            errmsg.Text = "Data saved"
            Conn.Close()
        Catch ex As Exception
            transaction.Rollback()
            errmsg.Text = ex.Message.ToString
        End Try




    End Sub
End Class
